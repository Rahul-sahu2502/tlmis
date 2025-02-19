<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Utility\GetDataUtility;
use App\Models\file_mgmt;
use App\Models\masters\master_doc_types;
use App\Models\tbl_task;
use App\Models\tl_review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class DashboardController extends Controller
{
    public function index(){
        $departmentId = Session::get('department_id');
        $userId = Session::get('user_id');
        $levelId =Session::get('level_id');
        $limit=5;
        $title = 'Dashboard';
        $page_title="Dashboard";
        $page_subtitle="";
        $users=DB::select("SELECT COUNT(DISTINCT um.fk_user_id)  AS total_users FROM tbl_users u
                            JOIN tbl_user_map um ON u.user_id = um.fk_user_id
                               WHERE u.is_active=1 and u.user_id!=:userId and um.is_active=1 and um.fk_level_id != :notLevelId and um.fk_level_id = :levlId
                   ",
            ['userId'=>Session::get('user_id'),'notLevelId'=>Session::get('level_id'),'levlId'=>Session::get('level_id')+1]);
        $query = DB::table('tl_reviews')
        ->distinct()
        ->select('tl_reviews.id', 'tl_reviews.tl_date', 'tl_reviews.tl_time', 'tl_reviews.tl_title', 'tl_reviews.tl_status', 'tl_reviews.postponed_date', 'tl_reviews.postponed_time')
        ->leftJoin('tl_review_task_map', 'tl_review_task_map.fk_tl_review_id', '=', 'tl_reviews.id')
        ->leftJoin('tbl_task_user_map', 'tbl_task_user_map.fk_task_id', '=', 'tl_review_task_map.fk_task_id')
        ->whereRaw('1 = 1');
            if ($departmentId > 0) {
                $query->where('tbl_task_user_map.fk_dept_id', $departmentId);
            };
        $tl_reviews = $query->orderBy('tl_date', 'desc')->limit($limit)->get();
        $countQuery = "SELECT
            COUNT(DISTINCT tt.task_id) AS total_task,
            COUNT(DISTINCT CASE WHEN tt.status = 'C' THEN tt.task_id END) AS completed_task,
            COUNT(DISTINCT CASE WHEN tt.status = 'I' THEN tt.task_id END) AS inprogress_task,
            COUNT(DISTINCT CASE WHEN trt.reply is not null && tt.status='I' THEN tt.task_id END) pending_from_admin
            FROM
                tbl_task tt
            left join tbl_task_user_map td_map on tt.task_id = td_map.fk_task_id
            left join tbl_task_reply_trs trt on tt.task_id = trt.fk_task_id";

            if($levelId == 1){
                //$countQuery .= " where tt.created_by = " . Session::get('user_id');
            }else{
                $countQuery .= " where td_map.fk_user_id = " . Session::get('user_id');
           }

        $taskStats = DB::select($countQuery);
        $taskStats[0]->total_users=$users[0]->total_users;
        return view('dashboard.index', [
            'data' => $taskStats,
            'tlReviews' => $tl_reviews,
            'title' => $title,
            'page_title' => $page_title,
            'page_subtitle' => $page_subtitle
        ]);
    }
    public function tasksAdd(Request $request){
        $data['title'] = 'Tasks';
        $data['page_title']="Tasks";
        $data['page_subtitle']="Add New Task";
        // $data['department_list']=DB::select("SELECT * FROM master_department t WHERE t.is_active = 1");
        $userId = Session::get('user_id');
        $levelId =Session::get('level_id');
        $departmentId = Session::get('department_id');

        $data['user_list']= GetDataUtility::getUserList($userId);
        $data['task_category']= GetDataUtility::getTaskPriorities();
        $data['task_priority']= GetDataUtility::getTaskCategories();

        $files = file_mgmt::with('uploads', 'issuerDetails' ,'fileTypeDetails')->where('doc_nature','TL')->orderBy('created_at', 'desc')->get();
        $data['doc_types'] = master_doc_types::all();
        return view('tasks.add',$data,compact('files'));
    }
    public function tasksView(Request $request){
        $data['title'] = 'Tasks';
        $data['page_title']="Tasks";
        $data['page_subtitle']="Task List";
        return view('tasks.view',$data);
    }
    public function taskViewStatusAjax(Request $request){
        // if($request->post()){
            // taskListDetails($create_by, $task_id, $details,$search_filters)
            $search['sts']=$request->sts;
            $search['var']=$request->var;
            $search['fdate']=$request->fdate;
            $search['tdate']=$request->tdate;
            $search['days']=$request->days;
            $search['dept']=$request->d;
            $search['priority']=$request->priority;
            $search['category']=$request->category;
            $data = (new TaskController())->taskListDetails(session('user_id'),0,0,$search);
            return json_encode($data);
        // }
    }
    public function tasksOverView(Request $request){
        if(@$request->var){
            $data['title'] = 'Tasks';
            $data['page_title']="Tasks";
            $data['page_subtitle']="Task Overview";
             // taskListDetails($create_by, $task_id, $details,$search_filters)
            $data['details'] = (new TaskController())->taskListDetails(session('user_id'),base64_decode($request->var),1,'');
            // dd($data['details']['ref_docs']);
            if(!empty($data['details'])){
                if(Session::get('level_id')>1)
                {
                    if($request->v==0){
                        DB::table("tbl_task_user_map")->where('fk_user_id',Session::get('user_id'))
                            ->where('fk_task_id',base64_decode($request->var))
                            ->update(['is_viewed'=>1]);
                    }
                }
                return view('tasks.overview',$data);
            }
            else
                return back();
        }
        else
            return back();
    }

    public function taskStatus(Request $request){
        $data['title'] = 'Reports';
        $data['page_title']="Reports";
        $data['page_subtitle']="Task Status report";

        $data['search']=$request->search;
        $data['sts']=$request->sts;
        $data['dept']=$request->d;
        $data['task_category']= GetDataUtility::getTaskPriorities();
        $data['task_priority']= GetDataUtility::getTaskCategories();
        return view('tasks.reports.task_status',$data);
    }

    public function taskDetails(Request $request){
        $data['title'] = 'Details';
        $data['page_title']="Tasks";
        $data['page_subtitle']="Tasks Details";

        // $data['department_list']=DB::select("SELECT * FROM master_department t WHERE t.is_active = 1");

        $userId = Session::get('user_id');
        $levelId =Session::get('level_id');
        $departmentId = Session::get('department_id');

        $data['user_list']= GetDataUtility::getUserList($userId);
        $data['task_category']= GetDataUtility::getTaskPriorities();
        $data['task_priority']= GetDataUtility::getTaskCategories();

        $data['details'] = (new TaskController())->taskListDetails(session('user_id'),base64_decode($request->var),1,'');
        if($data['details'][0]->status=="C"|| $data['details'][0]->is_replied=="Y")
            return redirect()->back();

        // dd($data['details']['user_dept']);
        $files = file_mgmt::with('uploads', 'issuerDetails', 'fileTypeDetails')->orderBy('created_at', 'desc')->get();
        $selected_docs = [];
        if(!empty($data['details'][0]->ref_docs))
            $selected_docs = json_decode($data['details'][0]->ref_docs, true);
        $data['doc_types'] = master_doc_types::all();
        return view('tasks.details',$data,compact('files','selected_docs'));
    }

    function getDocsList(Request $request){
        $ref_no = $request->get('ref_no');
        $issue_date = $request->get('issue_date');
        $file_type = $request->get('file_type');
        $usage = $request->get('usage');
        $selected_docs = [];
        if(isset($request->task_id)){
            $data= tbl_task::select('ref_docs')->where('created_by','=',session('user_id'))->where('task_id',$request->task_id)->get();
            if($data[0]->ref_docs!=NULL)
                $selected_docs = $data[0]->ref_docs;
        }
        $query = file_mgmt::with('uploads', 'issuerDetails', 'fileTypeDetails');
        if ($ref_no) {
            $query->where('reference_no', 'LIKE', '%' . $ref_no . '%');
        }
        if ($issue_date) {
            $query->where('issue_date', $issue_date);
        }
        if ($file_type!="") {
            if ($file_type!="A")
                $query->where('file_type_id', $file_type);
        }
        if ($usage === 'Y') {
            $query->whereIn('id', function ($subquery) {
                $subquery->selectRaw('JSON_UNQUOTE(JSON_EXTRACT(ref_docs, "$[0]"))')
                    ->from('tbl_task')->whereNotNull('ref_docs');
            });
        } elseif ($usage === 'N' || !$usage) {
            $query->whereNotIn('id', function ($subquery) {
                $subquery->selectRaw('JSON_UNQUOTE(JSON_EXTRACT(ref_docs, "$[0]"))')
                    ->from('tbl_task')->whereNotNull('ref_docs');
            });
        }
        $files = $query->orderBy('created_at', 'desc')->get();
        $html = '';
        foreach ($files as $file) {
            $file->task_reference_count = tbl_task::whereJsonContains('ref_docs', (string) $file->id)->count();
            $isChecked = in_array($file->id, $selected_docs) ? 'checked' : '';

            $docUpload = '';
            foreach ($file->uploads as $upload) {
                $file_path = asset("uploads/{$upload->path}");
                if (config('app.env') == 'production') {
                    $file_path = config('custom.file_point') . $upload->path;
                }
                $docUpload .= "<button type='button' data-file='" . basename($upload->filename) . "' data-src='{$file_path}' data-type='" . pathinfo($upload->path, PATHINFO_EXTENSION) . "' class='btn btn-sm btn-outline-info file-preview-icon'>
                                <i class='bx bx-file'></i>
                            </button>";
            }
            $html .= "<tr id='{$file->id}' class='" . ($file->task_reference_count == 0 ? '' : 'bg-success-subtle') . "'>
                        <td class='text-center'>
                            <input type='checkbox' value='{$file->id}' name='ref_docs[]' class='form-check doc_check' title='" . ($file->task_reference_count == 0 ? ' ' : "Used in {$file->task_reference_count} Tasks") . "' {$isChecked}>
                            <small class='text-center usage'>" . ($file->task_reference_count == 0 ? ' ' : "Usage : {$file->task_reference_count}") . "</small>
                        </td>
                        <td>{$file->fileTypeDetails->name_en} ({$file->fileTypeDetails->name_hi})</td>
                        <td>{$file->reference_no}<br>" . date('d-M-Y', strtotime($file->issue_date)) . "</td>
                        <td>{$file->issuerDetails->name}</td>
                        <td>{$docUpload}</td>
                    </tr>";
        }
        return response()->json(['html' => $html]);
    }

    public function getSBRequestList(Request $request){
        $data['title'] = 'Send back request';
        $data['page_title']="Tasks";
        $data['page_subtitle']="Send back request list/अनुरोध सूची";
        $data['list'] = (new TaskController())->sendBackList();
        // dd($data['list']);
        return view('tasks.sb_request_list',$data);
    }

    public function taskAllocate(Request $request){
        if(@$request->var){
            $data['title'] = 'Task Allocate';
            $data['page_title']="task_allocate";
            $data['page_subtitle']="Task Allocate";
             // taskListDetails($create_by, $task_id, $details,$search_filters)
            $data['details'] = (new TaskController())->taskListDetails(session('user_id'),base64_decode($request->var),1,'');

            $userId = Session::get('user_id');
            $departmentId = Session::get('department_id');
            $data['officer_list']= GetDataUtility:: getUserList($userId);
            $data['task_id']=base64_decode($request->var);

            $data['allocated_list']=(new TaskController())->taskAllocatedList($userId);
            // dd($data['details']['dept_section_officer']);
            if(!empty($data['details']))
                return view('tasks.task_allocate',$data);
            else
                return back();
        }
        else
            return back();
    }

    public function taskAllocateList(Request $request){

        $data['title'] = 'Tasks';
        $data['page_title']="Tasks";
        $data['page_subtitle']="Task List";
        $data['list'] = (new TaskController())->taskListDetails(session('user_id'),0,0);

        return view('tasks.task_allocate_list',$data);
    }
     public function officesTaskReport(Request $request){

        $data['title'] = 'Reports';
        $data['page_title']="Reports";
        $data['page_subtitle']="Office wise report";
        return view('tasks.reports.office_wise_report',$data);
    }
}
