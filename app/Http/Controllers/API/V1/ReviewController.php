<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Library\ApiResponseHandler;
use App\Models\tl_review;
use App\Models\tl_review_task_map;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReviewController extends Controller
{
    use ApiResponseHandler;
    public function pagePreRequest(Request $request) 
    {
        $pages = ['review', 'task'];
        if(!in_array($request->page, $pages)) {
            return $this->basicResponse('failed', 'Page must be one of '. implode(', ', $pages));
        }

        $data = [];
        if($request->page === 'review') {
            $data['page_title']="Reviews";
            $data['page_subtitle']="Review List/अनुरोध सूची";
            $data['filters'] = [
                [
                    'name' => 'Status',
                    'visiblity' => true,
                    'options' => $this->getReviewStatus()
                ]
            ];
        }

        if($request->page === 'task') {
            $data['page_title']="Tasks";
            $data['page_subtitle']="Task List/कार्य सूची";
            $data['filters'] = [
                [
                    'name' => 'Status',
                    'visiblity' => true,
                    'options' => [
                        [
                            'value' => 'A',
                            'text' => 'All'
                        ],
                        [
                            'value' => 'I',
                            'text' => 'In-Progress'
                        ],
                        [
                            'value' => 'C',
                            'text' => 'Completed'
                        ]
                    ]
                ]
            ];
        }
        
        return response()->json($this->responseWithData('success', 'Page loaded successfully', $data));
    }

    private function getReviewStatus() {
        $statuses = tl_review::STATUS_MAP;
        $array = [];
        foreach ($statuses as $key => $value) {
            $array[] = ['value' => $key, 'text' => $value];
        }
        return $array;
    }

    public function review_list(Request $request)
    {
        $user = auth('api')->user();
        $userId = $user->user_id;
        $status = $request->status;
        $search = $request->search; // For search filter
        $limit = $request->limit ?? 10; // Default limit to 10 records
        $page = $request->page ?? 1; // Default to first page
        $offset = ($page - 1) * $limit; // Calculate the offset

        $query = tl_review::where('created_by', $userId)
            ->select('id', 'tl_date', 'tl_time', 'tl_title', 'tl_status', 'postponed_date', 'postponed_time');

        // Apply filters
        if ($status !== "ALL" && $status !== null) {
            $query->where('tl_status', $status);
        }

        if ($search) {
            $query->where('tl_title', 'like', "%$search%");
        }

        $totalRecords = tl_review::where('created_by', $userId)->count(); // Total records without filters
        $filteredRecords = $query->count(); // Total records with filters applied

        // Add sorting, limit, and offset
        $reviews = $query->orderBy('tl_date', 'desc')
            ->skip($offset)
            ->take($limit)
            ->get();

        $data = $reviews->map(function ($review) {
            $isPostponed = $review->tl_status === 'PST';

            return [
                'id' => $review->id,
                'tl_date' => $isPostponed
                    ? date('d M,Y', strtotime($review->postponed_date))
                    : date('d M,Y', strtotime($review->tl_date)),
                'tl_time' => $isPostponed
                    ? date('h:i A', strtotime($review->postponed_time))
                    : date('h:i A', strtotime($review->tl_time)),
                'tl_title' => $review->tl_title,
                'tl_status' => $review->tlStatusName,
            ];
        });

        return response()->json([
            'status' => 'success',
            'message' => 'Data retrieved successfully',
            'data' => $data,
            'dataRecords' => [
                'recordsTotal' => $totalRecords,
                'recordsFiltered' => $filteredRecords,
                'currentPage' => intval($page),
                'limit' => intval($limit),
                'totalPages' => ceil($filteredRecords / $limit),
            ]
        ]);
    }

    public function task_list(Request $request, $review_id) 
    {
        $user = auth('api')->user();
        $userId = $user->user_id;
        $status = $request->query('status');
        $search = $request->query('search'); // For search filter

        $data = [];
        $review = tl_review::where('created_by', $userId)->with(['tasks' => function ($query) {
                $query->with(['taskDepartments.department']);
            }])->find($review_id);
        
        if (!$review) {
            return response()->json($this->basicResponse('failed', 'Review not found!'));
        }

        $data = [];
        $query = tl_review_task_map::where('fk_tl_review_id', $review->id);

        // Apply filters
        if ($status !== "A" && $status !== null) {
            $query->where('status', $status);
        }

        if ($search) {
            $query->where('title', 'like', "%$search%");
        }

        $taskMapData = $query->get();
        foreach ($review->tasks as $task) {
            $taskStatusRemark = $taskMapData->where('fk_task_id', $task->task_id)->first();
            $task->status = $taskStatusRemark ? $taskStatusRemark->status : 'NOT-REVIEWED';
            $task->remarks = $taskStatusRemark ? $taskStatusRemark->remarks : '';
            $departments = [];
            foreach ($task->taskDepartments as $value) {
                
                unset($value->department->fk_issuer_type);
                unset($value->department->is_active);
                unset($value->department->created_by);
                unset($value->department->updated_by);
                unset($value->department->created_at);
                unset($value->department->updated_at);
                unset($value->department->created_ip);
                unset($value->department->updated_ip);
                array_push($departments, $value->department);
            }
            $task->departments = $departments;
            unset($task->taskDepartments);

            if(!empty($task->ref_docs)){
                $ref_docs="";
                $i=1;
                $len  = sizeof($task->ref_docs);
                foreach($task->ref_docs as $val){ 
                    $ref_docs.= $val;
                    if($len!=$i)
                        $ref_docs.=",";
                    $i++;
                }

                $URL = url('uploads');
                $task->ref_docs = DB::select("SELECT m.*, u.filename, u.path, d.name_en, d.name_hi, i.name issuer_name, i.issuer_type_id,
                it.name_hi, it.name_en, CONCAT('$URL/', u.path, u.filename) file_url FROM
                    (
                        SELECT m.id, m.file_type_id, m.reference_no, m.issue_date, m.issuer, m.receiving_date
                        FROM tbl_file_mgmt m WHERE m.status=1 AND m.id IN ($ref_docs)
                    ) m
                    INNER JOIN tbl_file_mgmt_uploads u ON m.id = u.fk_file_mgmt_id AND u.fk_file_mgmt_id IN ($ref_docs)
                    INNER JOIN master_doc_types d ON m.file_type_id = d.id
                    INNER JOIN master_issuers i ON m.issuer = i.id
                    INNER JOIN master_issuer_types it ON i.issuer_type_id = it.id");
            }
            array_push($data, $task);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Data retrieved successfully',
            'data' => $data
        ]);
    }
}
