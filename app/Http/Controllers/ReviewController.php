<?php

namespace App\Http\Controllers;

use App\Models\masters\master_department;
use App\Models\tbl_task;
use App\Models\tl_review;
use App\Models\tl_review_task_map;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ReviewController extends Controller
{
    public function index(Request $request)
    {
        $title = 'TL Reviews';
        $page_title = $request->id ? "Edit_Review" : "New_Review";
        $page_subtitle = $request->id ? "Update the review details" : "";
        $review = null;
        if ($request->id) {
            $review = tl_review::with('tasks')->find($request->id);
            if (!$review) {
                return redirect()->route('tl_view')->with('error', 'Review not found');
            }
        }
        $tasks=tbl_task::with('taskDepartments.department','taskPriority')->where('status','!=','C')->where('created_by', '=', session('user_id'));
        $data['tasks'] = $tasks->get();
        return view('review.index', compact('page_title', 'page_subtitle', 'data', 'review'))->with('title', $title);
    }
    public function detail(Request $request)
    {
        if (@$request->var) {
            $title = 'TL Reviews';
            $page_title = "Review_Details";
            $page_subtitle = "Back to Review List";
            $review = tl_review::with(['tasks' => function ($query) {
                $query->with(['taskDepartments.department']);
            }])->find(base64_decode($request->var));
            if (!$review) {
                return redirect()->route('tl_view')->with('error', 'Review not found');
            }
            $taskMapData = tl_review_task_map::where('fk_tl_review_id', $review->id)->get();
            foreach ($review->tasks as $task) {
                $taskStatusRemark = $taskMapData->where('fk_task_id', $task->task_id)->first();
                $task->status = $taskStatusRemark ? $taskStatusRemark->status : 'NOT-REVIEWED';
                $task->remarks = $taskStatusRemark ? $taskStatusRemark->remarks : '';
            }
            $statuses = tl_review::STATUS_MAP;
            return view('review.detail', compact('review', 'page_title', 'page_subtitle', 'statuses'))
                ->with('title', $title);
        } else {
            return back();
        }
    }

    public function view()
    {
        $title = 'TL Reviews';
        $page_title = "Review_List";
        $page_subtitle = "";
        return view('review.list', compact('page_title', 'page_subtitle'))->with('title', $title);
    }
    public function tlReport()
    {
        $title = 'Reports';
        $page_title = "review_report";
        $page_subtitle = "";
        $reviews = tl_review::with(['reviewTaskMap' => function ($query) {
            $query->whereIn('status', ['REVIEWED', 'NOT-REVIEWED']);
        }])
        ->with(['reviewTaskMap.task.taskDepartments.department'])
        ->latest('tl_date')
        ->take(5)
        ->get()
        ->map(function ($review) {
            return [
                'review_date' => $review->tl_date,
                'review_time' => $review->tl_time,
                'review_title' => $review->tl_title,
                'tasks' => $review->reviewTaskMap->map(function ($taskMap) {
                    return [
                        'task_title' => $taskMap->task->title,
                        'department_name' => $taskMap->task->taskDepartments->first()->department->department_eng,
                        'status' => $taskMap->status,
                    ];
                }),
            ];
        });
    
        return view('review.report', compact('page_title', 'page_subtitle', 'reviews'))->with('title', $title);
    }
    public function deptAnalysis()
    {
        $title = 'Reports';
        $page_title = "review_report";
        $page_subtitle = "";
        $reportData = tl_review::with(['reviewTaskMap' => function ($query) {
            $query->whereIn('status', ['REVIEWED', 'NOT-REVIEWED']);
        }])
        ->with(['reviewTaskMap.task.taskDepartments.department'])
        ->get()
        ->flatMap(function ($review) {
            return $review->reviewTaskMap->map(function ($taskMap) use ($review) {
                return [
                    'department_name' => $taskMap->task->taskDepartments->first()->department->department_eng,
                    'status' => $taskMap->status,
                    'review_id' => $review->id,
                ];
            });
        })
        ->groupBy('department_name')
        ->map(function ($tasksByDepartment) {
            $reviewIds = $tasksByDepartment->pluck('review_id')->unique();
            $scheduledTL = tl_review::whereIn('id', $reviewIds)->count();
        
            $departmentData = [
                'total_tasks' => $tasksByDepartment->count(),
                'reviewed_tasks' => $tasksByDepartment->where('status', 'REVIEWED')->count(),
                'not_reviewed_tasks' => $tasksByDepartment->where('status', 'NOT-REVIEWED')->count(),
                'scheduled_tl' => $scheduledTL,
            ];
            return $departmentData;
        });  
        return view('review.report-dept', compact('page_title', 'page_subtitle', 'reportData'))->with('title', $title);
    }
    public function reviewAnalysis()
    {
        $title = 'Reports';
        $page_title = "review_report";
        $page_subtitle = "";
        $reportData = tl_review::with(['reviewTaskMap' => function ($query) {
            $query->whereIn('status', ['REVIEWED', 'NOT-REVIEWED']);
        }])
        ->select('id','tl_date','tl_time','tl_title')
        ->get()
        ->map(function ($review) {
            $totalTasks = $review->reviewTaskMap->count();
            $reviewedTasks = $review->reviewTaskMap->where('status', 'REVIEWED')->count();
            $notReviewedTasks = $review->reviewTaskMap->where('status', 'NOT-REVIEWED')->count();
    
            return [
                'review_id' => $review->id,
                'review_date' => date('d-m-Y', strtotime($review->tl_date)),
                'review_time' => $review->tl_time ? date('h:i A', strtotime($review->tl_time)) :'',
                'review_title' => $review->tl_title,
                'total_tasks' => $totalTasks,
                'reviewed_tasks' => $reviewedTasks,
                'not_reviewed_tasks' => $notReviewedTasks,
            ];
        });
        return view('review.report-review', compact('page_title', 'page_subtitle', 'reportData'))->with('title', $title);
    }
    public function getReport(Request $request) {
        $summaryData = tl_review::select('tl_status', DB::raw('COUNT(*) as count'))
                ->groupBy('tl_status')
                ->get();
        $summary = [
            'Scheduled' => 0,
            'Completed' => 0,
            'Postponed' => 0,
            'Canceled' => 0,
        ];
        foreach ($summaryData as $data) {
            $statusName = tl_review::STATUS_MAP[$data->tl_status] ?? 'Unknown';
            if (array_key_exists($statusName, $summary)) {
                $summary[$statusName] = $data->count;
            }
        }
        return response()->json($summary);
    }
    public function getTrends(Request $request) {
        $trendsData = tl_review::select(
                DB::raw('DATE(tl_date) as date'),
                'tl_status',
                DB::raw('COUNT(*) as count')
            )
            ->groupBy('date', 'tl_status')
            ->orderBy('date')
            ->get()
            ->groupBy('date')
            ->map(function ($group) {
                $statuses = tl_review::STATUS_MAP;
                $counts = array_fill_keys(array_values($statuses), 0);

                foreach ($group as $item) {
                    $statusName = tl_review::STATUS_MAP[$item->tl_status] ?? 'Unknown';
                    $counts[$statusName] = $item->count;
                }

                return array_merge(['date' => $group[0]->date], $counts);
            })
            ->values();

        return response()->json($trendsData);
    }
    public function list(Request $request)
    {
        $departmentId = Session::get('department_id');
        $status = $request->status;
        $query = DB::table('tl_reviews')
            ->distinct()
            ->select('tl_reviews.id', 'tl_reviews.tl_date', 'tl_reviews.tl_time', 'tl_reviews.tl_title', 'tl_reviews.tl_status', 'tl_reviews.postponed_date', 'tl_reviews.postponed_time')
            ->leftJoin('tl_review_task_map', 'tl_review_task_map.fk_tl_review_id', '=', 'tl_reviews.id')
            ->leftJoin('tbl_task_user_map', 'tbl_task_user_map.fk_task_id', '=', 'tl_review_task_map.fk_task_id')
            ->whereRaw('1 = 1');
        if ($departmentId > 0) {
            $query->where('tbl_task_user_map.fk_dept_id', $departmentId);
        }
        if ($status !== "ALL") {
            $query->where('tl_reviews.tl_status', $status);
        }
        $query->orderBy('tl_reviews.tl_date', 'desc');
        $reviews = $query->get();
        $filteredRecords = DB::table('tl_reviews')
            ->leftJoin('tl_review_task_map', 'tl_review_task_map.fk_tl_review_id', '=', 'tl_reviews.id')
            ->leftJoin('tbl_task_user_map', 'tbl_task_user_map.fk_task_id', '=', 'tl_review_task_map.fk_task_id')
            ->when($departmentId > 0, function ($query) use ($departmentId) {
                return $query->where('tbl_task_user_map.fk_dept_id', $departmentId);
            })
            ->when($status !== "ALL", function ($query) use ($status) {
                return $query->where('tl_reviews.tl_status', $status);
            })
            ->count();
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
                'tl_status' => $review->tl_status,
                'actions' => '<a href="' . url('tl-detail?var=' . base64_encode($review->id)) . '" class="btn btn-info btn-xm"><i class="ri-eye-line"></i></a>'
            ];
        });
        $totalRecords = DB::table('tl_reviews')->count();
        return response()->json([
            'draw' => $request->get('draw'),
            'recordsTotal' => $totalRecords,
            'recordsFiltered' => $filteredRecords,
            'data' => $data
        ]);
    }
    public function updateStatus(Request $request)
    {
        $validated = $request->validate([
            'id' => 'required|exists:tl_reviews,id',
            'tl_status' => 'required|in:SCH,CMP,PST,CNC',
            'postponed_date' => 'required_if:tl_status,PST|date',
            'postponed_time' => 'required_if:tl_status,PST',
        ]);
        $review = tl_review::find($validated['id']);
        $review->tl_status = $validated['tl_status'];
        if ($validated['tl_status'] === 'PST') {
            $review->postponed_date = $validated['postponed_date'];
            $review->postponed_time = $validated['postponed_time'];
        }
        if ($review->save()) {
            return response()->json(['success' => true, 'message' => 'Status updated successfully!']);
        }
        return response()->json(['success' => false, 'message' => 'Failed to update status.']);
    }

    public function updateTask(Request $request)
    {
        $taskMapping = tl_review_task_map::where('fk_tl_review_id', $request->review_id)
            ->where('fk_task_id', $request->task_id)
            ->first();
        if ($taskMapping) {
            $taskMapping->status = $request->status;
            $taskMapping->remarks = $request->remark;
            $taskMapping->save();

            return response()->json(['success' => true, 'message' => 'Status and remark updated successfully.']);
        }

        return response()->json(['success' => false, 'message' => 'Task mapping not found.']);
    }
    public function save(Request $request)
    {
        $validated = $request->validate([
            'tl_date' => 'required|date',
            'tl_time' => 'required',
            'task_id' => 'required|string',
        ]);
        $taskIds = json_decode($validated['task_id'], true);
        if (!is_array($taskIds) || count($taskIds) === 0) {
            return response()->json([
                'status' => 'error',
                'message' => 'No tasks selected for the review.',
            ], 400);
        }
        $existingTaskIds = DB::table('tbl_task')
            ->whereIn('task_id', $taskIds)
            ->pluck('task_id')
            ->toArray();

        $invalidTaskIds = array_diff($taskIds, $existingTaskIds);
        if (!empty($invalidTaskIds)) {
            return response()->json([
                'status' => 'error',
                'message' => 'One or more tasks are invalid: ' . implode(', ', $invalidTaskIds),
            ], 400);
        }
        DB::beginTransaction();
        try {
            if ($request->cmd === 'INS') {
                $tlReview = tl_review::create([
                    'tl_date' => $validated['tl_date'],
                    'tl_time' => $validated['tl_time'],
                    'tl_title' => $request->tl_title,
                    'tl_desc' => $request->tl_desc,
                    'tl_status' => 'SCH'
                ]);
            } elseif ($request->cmd === 'UPD') {
                $tlReview = tl_review::findOrFail($request->id);
                $tlReview->update([
                    'tl_date' => $validated['tl_date'],
                    'tl_time' => $validated['tl_time'],
                    'tl_title' => $request->tl_title,
                    'tl_desc' => $request->tl_desc,
                    'tl_status' => 'SCH'
                ]);
                tl_review_task_map::where('fk_tl_review_id', $tlReview->id)->delete();
            }
            foreach ($taskIds as $taskId) {
                tl_review_task_map::create([
                    'fk_tl_review_id' => $tlReview->id,
                    'fk_task_id' => $taskId
                ]);
            }
            DB::commit();
            return response()->json([
                'status' => 'success',
                'message' => 'Your TL Review with associated tasks have been saved successfully.',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'status' => 'error',
                'message' => 'An error occurred while saving the data. Please try again.' . $e,
            ], 500);
        }
    }
}
