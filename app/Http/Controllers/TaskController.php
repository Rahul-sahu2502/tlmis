<?php

namespace App\Http\Controllers;

use App\Events\NotificationSent;
use App\Services\NotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;


class TaskController extends Controller
{
    //
    private $response;


    public function tasksInsert(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make(
                $request->post(),
                [
                    'entry_date' => ['required', 'date_format:Y-m-d'],
                    'due_date' => ['required', 'date_format:Y-m-d'],
                    'fk_task_priority_id' => 'required',
                    'title' => 'required',
                    'fk_dept_id' => 'required',
                    // 'ref_docs'=>'required',
                    'fk_task_priority_id' => 'required',
                ],
                [
                    'entry_date.date_format' => 'Entry date invalid format',
                    'due_date.date_format' => 'Due date invalid format'
                ]
            );

            if ($validator->fails()) {
                $this->response = ["sts" => 3, "message" => "validation failed", "data" => $validator->errors()];
            } else if (strtotime($request->entry_date) > strtotime($request->due_date)) {
                $this->response = ["sts" => 3, "message" => "Due date must be greater than or equal to the entry date"];
            } else if (session('department_id') && empty($request->section_officer_id)) {
                $this->response = ["sts" => 3, "message" => "Please select section officer"];
            } else {
                DB::beginTransaction();
                $insert_data = $request->post();
                unset($insert_data['_token']);
                $dept_section_officer = $insert_data['fk_dept_id'];
                unset($insert_data['fk_dept_id']);
                unset($insert_data['DataTables_Table_0_length']);
                if (session('department_id')) {
                    $dept_section_officer = $insert_data['section_officer_id'];
                    unset($insert_data['section_officer_id']);
                }

                if ($request->hasFile('file')) {
                    $insert_data['has_file'] = "Y";
                }

                if (!empty($insert_data['ref_docs']))
                    $insert_data['ref_docs'] = json_encode($insert_data['ref_docs']);
                else
                    $insert_data['ref_docs'] = NULL;
                $insert_data['created_ipaddress'] = request()->getClientIp();
                $insert_data['created_by'] = session('user_id');
                $last_insert_id = DB::table("tbl_task")->insertGetId($insert_data);
                if ($last_insert_id) {
                    $inner_sts = true;
                    $task_user_map = [];
                    foreach ($dept_section_officer as $value) {
                        $user_id = explode("_", $value)[0];
                        $dept_id = explode("_", $value)[1];

                        array_push($task_user_map, array(
                            'fk_dept_id' => $dept_id,
                            'fk_task_id' => $last_insert_id,
                            'fk_user_id' => $user_id,
                            'created_by' => session('user_id'),
                            'created_ip' => request()->getClientIp()
                        ));
                        if (env('ENABLE_PUSHER_NOTIFICATIONS', false)) {
                            $notification = NotificationService::createNotification($user_id, "Notification", "Task", route('task_view'), ['message' => 'You have been assigned a task!']);
                            event(new NotificationSent($notification));
                        }
                    }
                    $inner_sts = DB::table("tbl_task_user_map")->insert($task_user_map);

                    if ($request->hasFile('file') && $inner_sts) {
                        $file = $request->file('file');
                        $upload_data['file_name'] = $file->getClientOriginalName();
                        $upload_data['file_size'] = $file->getSize();
                        $upload_data['fk_task_id'] = $last_insert_id;
                        $upload_data['file'] = UtilController::upload_file($file, 'task_files', 'uploads', ['jpeg', 'jpg', 'png', 'pdf'], ['image/jpeg', 'image/png', 'application/pdf']);
                        // dd($upload_data['file']);
                        if ($upload_data['file'] == false)
                            $inner_sts = false;
                        else {
                            $sts = DB::table("tbl_task_files")->insert($upload_data);
                            if (!$sts)
                                $inner_sts = false;
                        }
                    }
                    if ($inner_sts) {
                        DB::commit();
                        $this->response = ["sts" => 1, "message" => "Task successfully added",];
                    } else {
                        DB::rollBack();
                        $this->response = ["sts" => 2, "message" => "Please try again",];
                    }
                } else {
                    DB::rollBack();
                    $this->response = ["sts" => 2, "message" => "Please try again"];
                }
            }
            return response()->json($this->response);
        }
    }

    public function taskListDetails($user_id = 0, $task_id = 0, $details = 0, $search = [])
    {
        $condition = $deptu = $sql_created_by = $m_condition = "";
        if (session('level_id') == 1) {
            $sql_created_by = " AND t.created_by= $user_id";
            if (!empty($search) && @$search['dept']) {
                $m_condition = " AND m.fk_dept_id=" . $search['dept'];
                $deptu = " AND d.dept_id=" . $search['dept'];
            }
        } else if (session('level_id') > 1) {
            $depart_ids = session('department_id');
            $m_condition = " AND m.fk_user_id= $user_id AND m.fk_dept_id IN($depart_ids)";
            $deptu = " AND d.dept_id IN($depart_ids)";
        }
        if ($task_id > 0) {
            $condition .= " AND task_id = " . $task_id;
        }

        // Search
        if (!empty($search)) {
            if ($search['sts'] != "") {
                $sts = $search['sts'];
                if ($search['sts'] == "C" || $search['sts'] == "I")
                    $condition .= " AND t.status = '$sts'";
                else
                    $condition .= "";
            }
            if ($search['var'] != "") {
                $condition .= " AND t.title LIKE '%" . $search['var'] . "%'";
            }
            if ($search['days'] != "") {
                $days = $search['days'];
                $current_date = date('Y-m-d');
                $form_date = date('Y-m-d', strtotime($current_date . "-$days days"));
                if ($search['days'] != "L30")
                    $condition .= " AND t.due_date>='$form_date'";
                $condition .= " AND t.due_date<='" . $current_date . "'";
            } else {
                if ($search['fdate'] != "") {
                    $condition .= " AND t.due_date>='" . $search['fdate'] . "'";
                }
                if ($search['tdate'] != "") {
                    $condition .= " AND t.due_date<='" . $search['tdate'] . "'";
                }
            }
            if ($search['priority'] != "") {
                if ($search['priority'] == 0)
                    $condition .= "";
                else
                    $condition .= " AND t.fk_task_priority_id = " . $search['priority'];
            }
            if ($search['category'] != "") {
                if ($search['category'] == 0)
                    $condition .= "";
                else
                    $condition .= " AND t.fk_task_category_id = " . $search['category'];
            }
        }
        $query = "SELECT t.*, c.category, p.priority FROM
            (
                SELECT t.*, GROUP_CONCAT(d.dept_id SEPARATOR ',') dept_id, GROUP_CONCAT(d.department_eng SEPARATOR ', ') department_eng ,
                GROUP_CONCAT(d.department_hin SEPARATOR ', ') department_hin, m.map_id, m.send_back_by, m.send_back_status,m.is_viewed
                FROM
                (
                    SELECT t.ref_docs,t.task_id, t.title, t.fk_task_priority_id, t.fk_task_category_id,t.description,
                    t.status, t.has_file, t.closed_remark, t.is_replied,
                    t.entry_date, t.due_date,
                    DATE_FORMAT(t.created_date, '%d %b, %Y') created_date,
                    DATE_FORMAT(t.closed_date, '%d %b, %Y') closed_date
                    FROM tbl_task t WHERE 1=1 $sql_created_by $condition
                    ORDER BY t.created_date DESC
                )t
                INNER JOIN
                (
                    SELECT m.map_id,  m.fk_dept_id, m.fk_task_id, m.send_back_by, m.send_back_status,m.is_viewed FROM tbl_task_user_map m
                    WHERE 1=1 $m_condition
                    GROUP BY m.fk_task_id, m.fk_dept_id
                ) m ON t.task_id = m.fk_task_id
                INNER JOIN master_department d ON m.fk_dept_id = d.dept_id $deptu
                GROUP BY t.task_id
            )t
            INNER JOIN master_task_category c ON t.fk_task_category_id = c.task_category_id
            INNER JOIN master_task_priority p ON t.fk_task_priority_id = p.task_priority_id
            ORDER BY t.created_date DESC";
        // dd($query);
        $data = DB::select($query);
        if (!empty($data) && $details > 0) {
            if ($data[0]->has_file == "Y")
                $data['files'] = DB::select('SELECT * FROM tbl_task_files t WHERE t.fk_task_id=' . $data[0]->task_id);
            if (!empty($data[0]->ref_docs)) {
                $ref_docs = "";
                $i = 1;
                $len = sizeof(json_decode($data[0]->ref_docs));
                foreach (json_decode($data[0]->ref_docs) as $val) {
                    $ref_docs .= $val;
                    if ($len != $i)
                        $ref_docs .= ",";
                    $i++;
                }
                $data['ref_docs'] = DB::select("SELECT m.*, u.filename, u.path, d.name_en, d.name_hi, i.name issuer_name, i.issuer_type_id,
                it.name_hi, it.name_en   FROM
                    (
                        SELECT m.id, m.file_type_id, m.reference_no, m.issue_date, m.issuer, m.receiving_date
                        FROM tbl_file_mgmt m WHERE m.status=1 AND m.id IN ($ref_docs)
                    ) m
                    INNER JOIN tbl_file_mgmt_uploads u ON m.id = u.fk_file_mgmt_id AND u.fk_file_mgmt_id IN ($ref_docs)
                    INNER JOIN master_doc_types d ON m.file_type_id = d.id
                    INNER JOIN master_issuers i ON m.issuer = i.id
                    INNER JOIN master_issuer_types it ON i.issuer_type_id = it.id");
            }

            $task_id = $data[0]->task_id;
            $query = "SELECT t.*, u.full_name, d.department_eng FROM
                (
                    SELECT m.fk_user_id, m.fk_dept_id, CONCAT(m.fk_user_id,'_',m.fk_dept_id) user_dept, m.is_viewed
                    FROM tbl_task_user_map m WHERE m.fk_task_id= $task_id AND m.created_by=$user_id
                ) t
                INNER JOIN master_department d ON d.dept_id=t.fk_dept_id
                INNER JOIN tbl_users u ON u.user_id=t.fk_user_id";
            $data['dept_section_officer'] = DB::select($query);
        }
        // dd($data);
        return $data;
    }

    public function taskReply(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make($request->post(), [
                'reply' => 'required',
            ]);

            $sts = true;
            if ($validator->fails()) {
                $this->response = ["sts" => 3, "message" => "validation failed", "data" => $validator->errors()];
            } else {
                $insert_data = $request->post();
                unset($insert_data['_token']);

                if ($request->hasFile('reply_file')) {
                    $file = $request->file('reply_file');
                    $insert_data['file_name'] = $file->getClientOriginalName();
                    $insert_data['file_size'] = $file->getSize();
                    $insert_data['reply_file'] = UtilController::upload_file($file, 'task_reply_files', 'uploads', ['jpeg', 'jpg', 'png', 'pdf'], ['image/jpeg', 'image/png', 'application/pdf']);
                    if ($insert_data['reply_file'] == false) {
                        $sts = false;
                    }
                }
                if ($sts) {
                    $insert_data['created_ipaddress'] = request()->getClientIp();
                    $insert_data['created_by'] = session('user_id');
                    $last_insert_id = DB::table("tbl_task_reply_trs")->insertGetId($insert_data);
                    if ($last_insert_id) {
                        DB::table("tbl_task")->where('task_id', $request->fk_task_id)->update(['is_replied' => 'Y']);
                        $this->response = ["sts" => 1, "message" => "Success",];
                        if (env('ENABLE_PUSHER_NOTIFICATIONS', false)) {
                            $res = DB::table('tbl_task_user_map')->where('fk_task_id', $request->fk_task_id)->where('fk_user_id', '!=', Session::get('user_id'))->select('fk_user_id')->get();
                            if (!empty($res)) {
                                foreach ($res as $value) {
                                    $notification = NotificationService::createNotification($value->fk_user_id, "Notification", "Task", route('task_overview', ['var' => base64_encode($request->fk_task_id)]), ['message' => 'You have received a reply for a task!']);
                                    event(new NotificationSent($notification));
                                }
                            }
                            $res1 = DB::table('tbl_task_user_map')->where('fk_task_id', $request->fk_task_id)->where('created_by', '!=', Session::get('user_id'))->select('created_by')->first();
                            if (!empty($res1)) {
                                if (env('ENABLE_PUSHER_NOTIFICATIONS', false)) {
                                    $notification = NotificationService::createNotification($res1->created_by, "Notification", "Task", route('task_overview', ['var' => base64_encode($request->fk_task_id)]), ['message' => 'You have received a reply for a task!']);
                                    event(new NotificationSent($notification));
                                } else {
                                    Log::info('Notifications are disabled; event not triggered.');
                                }
                            }
                        } else {
                            Log::info('Notifications are disabled; event not triggered.');
                        }

                    } else {
                        $this->response = ["sts" => 2, "message" => "Please try again"];
                    }
                } else
                    $this->response = ["sts" => 2, "message" => "Please try again"];
            }
            return response()->json($this->response);
        }
    }

    public function taskReplyList(Request $request)
    {
        $created_by = session('user_id');
        $sql_create_by = "";
        $sql_user = "";
        $sql_reply = "";
        // if (session('level_id') == 1) {
        //     $sql_create_by = " AND t.created_by= $created_by";
        // } else if (session('level_id') == 2) {
        //     $sql_create_by = "AND t.created_by=" . session('create_by');
        //     // $sql_user=" AND u.user_id=".session('user_id');
        //     // $sql_reply=" WHERE r.created_by=".session('user_id');
        // }

        $task_id = $request->task_id;
        $data = DB::select("SELECT r.reply, r.reply_file, r.file_size, r.file_name, r.created_by, u.username,
            u.full_name, u.mobile, u.email, DATE_FORMAT(r.created_datetime,'%d %b, %Y - %h:%i%p') created_datetime,  r.created_by
            FROM tbl_task_reply_trs r
            INNER JOIN
            (
                SELECT t.task_id, t.created_by FROM tbl_task t WHERE t.task_id =  $task_id $sql_create_by
            )t ON r.fk_task_id = t.task_id AND r.fk_task_id = $task_id
            INNER JOIN tbl_users u ON r.created_by = u.user_id $sql_user
            $sql_reply");
        // return $data;
        return json_encode($data, JSON_UNESCAPED_UNICODE);
    }

    public function taskHistory(Request $request)
    {
        $data['title'] = 'Tasks';
        $data['page_title'] = "Tasks";
        $data['page_subtitle'] = "Task History";
        $condition = $deptu = $sql_created_by = $m_user_id = "";
        if (session('level_id') == 1) {
            $sql_created_by = " AND t.created_by= " . Session::get('user_id');
        } else if (session('level_id') > 1) {
            $depart_ids = session('department_id');
            $m_user_id = " WHERE m.fk_user_id=" . Session::get('user_id');
            $deptu = " AND d.dept_id IN($depart_ids)";
        }
        $task_id = base64_decode(urldecode($request->task_id));
        $condition .= " AND task_id = " . $task_id;
        $query = "SELECT t.*, c.category, p.priority FROM
            (
                SELECT t.*, GROUP_CONCAT(d.dept_id SEPARATOR ',') dept_id, GROUP_CONCAT(d.department_eng SEPARATOR ', ') department_eng ,
                GROUP_CONCAT(d.department_hin SEPARATOR ', ') department_hin
                FROM
                (
                    SELECT t.ref_docs,t.task_id, t.title, t.fk_task_priority_id, t.fk_task_category_id,t.description,
                    t.status, t.has_file, t.closed_remark, t.is_replied,
                    t.entry_date, t.due_date,
                    DATE_FORMAT(t.created_date, '%d %b, %Y - %h:%i%p') created_date,
                    DATE_FORMAT(t.closed_date, '%d %b, %Y - %h:%i%p') closed_date
                    FROM tbl_task t WHERE 1=1 $sql_created_by $condition
                    ORDER BY t.created_date DESC
                )t
                INNER JOIN
                (
                    SELECT m.fk_dept_id, m.fk_task_id FROM tbl_task_user_map m
                    $m_user_id
                    GROUP BY m.fk_task_id, m.fk_dept_id
                ) m ON t.task_id = m.fk_task_id
                INNER JOIN master_department d ON m.fk_dept_id = d.dept_id $deptu
                GROUP BY t.task_id
            )t
            INNER JOIN master_task_category c ON t.fk_task_category_id = c.task_category_id
            INNER JOIN master_task_priority p ON t.fk_task_priority_id = p.task_priority_id
            ORDER BY t.created_date DESC";
        // dd($query);
        $data['task_details'] = DB::select($query);
        if (!empty($data['task_details'])) {
            if ($data['task_details'][0]->has_file == "Y")
                $data['files'] = DB::select('SELECT * FROM tbl_task_files t WHERE t.fk_task_id=' . $data['task_details'][0]->task_id);
            if (!empty($data['task_details'][0]->ref_docs)) {
                $ref_docs = "";
                $i = 1;
                $len = sizeof(json_decode($data['task_details'][0]->ref_docs));
                foreach (json_decode($data['task_details'][0]->ref_docs) as $val) {
                    $ref_docs .= $val;
                    if ($len != $i)
                        $ref_docs .= ",";
                    $i++;
                }
                $data['ref_docs'] = DB::select("SELECT m.*, u.filename, u.path, d.name_en, d.name_hi, i.name issuer_name, i.issuer_type_id,
                it.name_hi, it.name_en   FROM
                    (
                        SELECT m.id, m.file_type_id, m.reference_no, m.issue_date, m.issuer, m.receiving_date
                        FROM tbl_file_mgmt m WHERE m.status=1 AND m.id IN ($ref_docs)
                    ) m
                    INNER JOIN tbl_file_mgmt_uploads u ON m.id = u.fk_file_mgmt_id AND u.fk_file_mgmt_id IN ($ref_docs)
                    INNER JOIN master_doc_types d ON m.file_type_id = d.id
                    INNER JOIN master_issuers i ON m.issuer = i.id
                    INNER JOIN master_issuer_types it ON i.issuer_type_id = it.id");
            }
        }
        $data['task_history'] = DB::select("SELECT t.*, c.category, p.priority FROM
            (
                SELECT t.*, GROUP_CONCAT(d.dept_id SEPARATOR ',') dept_id, GROUP_CONCAT(d.department_eng SEPARATOR ', ') department_eng ,
                GROUP_CONCAT(d.department_hin SEPARATOR ', ') department_hin
                FROM
                (
                    SELECT t.ref_docs,t.task_id, t.title, t.fk_task_priority_id, t.fk_task_category_id,t.description,
                    t.status, t.has_file,t.is_replied,
                    t.entry_date, t.due_date,
                    DATE_FORMAT(t.log_created_date, '%d %b, %Y - %h:%i%p') log_creation
                    FROM log_tbl_task t WHERE 1=1 $sql_created_by $condition
                    ORDER BY t.created_date DESC
                )t
                INNER JOIN
                (
                    SELECT m.fk_dept_id, m.fk_task_id FROM log_task_user_map_before_delete m
                    $m_user_id
                    GROUP BY m.fk_task_id, m.fk_dept_id
                ) m ON t.task_id = m.fk_task_id
                INNER JOIN master_department d ON m.fk_dept_id = d.dept_id $deptu
                GROUP BY t.task_id
            )t
            INNER JOIN master_task_category c ON t.fk_task_category_id = c.task_category_id
            INNER JOIN master_task_priority p ON t.fk_task_priority_id = p.task_priority_id
            ORDER BY t.log_creation DESC");

        return view('tasks.task_history', $data);
    }

    function taskClose(Request $request)
    {
        $task_id = $request->task_id;
        $closed_data['closed_remark'] = $request->remark;
        $closed_data['status'] = "C";
        $closed_data['closed_by'] = session('user_id');
        $closed_data['closed_date'] = NOW(); // date('Y-m-d H:i:s');
        $closed_data['closed_ipaddress'] = request()->getClientIp();
        DB::beginTransaction();
        $sts = DB::table('tbl_task')->where('task_id', $task_id)->update($closed_data);
        if ($sts) {
            unset($closed_data['status']);
            $closed_data['fk_task_id'] = $task_id;
            $sts = DB::table('tbl_task_closed_trs')->insert($closed_data);
            if ($sts) {
                $sts = DB::table('tbl_task_reopen_trs')->where('fk_task_id', $task_id)->whereNull('closed_by')->update($closed_data);
                $this->response = ["sts" => 1, "message" => "Successfully Closed",];
                DB::commit();
            } else {
                $this->response = ["sts" => 2, "message" => "Please try again"];
                DB::rollBack();
            }
        } else {
            $this->response = ["sts" => 2, "message" => "Please try again"];
            DB::rollBack();
        }
        return response()->json($this->response);
    }


    public function tasksUpdate(Request $request)
    {
        if ($request->post()) {
            $validator = Validator::make(
                $request->post(),
                [
                    'entry_date' => ['required', 'date_format:Y-m-d'],
                    'due_date' => ['required', 'date_format:Y-m-d'],
                    'fk_task_priority_id' => 'required',
                    'title' => 'required',
                    'fk_dept_id' => 'required',
                    'fk_task_priority_id' => 'required',
                ],
                [
                    'entry_date.date_format' => 'Entry date invalid format',
                    'due_date.date_format' => 'Due date invalid format'
                ]
            );

            if ($validator->fails()) {
                $this->response = ["sts" => 3, "message" => "validation failed", "data" => $validator->errors()];
            } else if (strtotime($request->entry_date) > strtotime($request->due_date)) {
                $this->response = ["sts" => 3, "message" => "Due date must be greater than or equal to the entry date"];
            } else {
                DB::beginTransaction();
                $update_data = $request->post();

                $old_dept_section_officer = json_decode($update_data['old_dept_section_officer']);
                unset($update_data['old_dept_section_officer']);
                unset($update_data['_token']);

                $dept_section_officer = $update_data['fk_dept_id'];
                unset($update_data['fk_dept_id']);
                // unset($insert_data['DataTables_Table_0_length']);
                if (session('department_id')) {
                    $dept_section_officer = $update_data['section_officer_id'];
                    unset($update_data['section_officer_id']);
                }

                if (!empty($update_data['ref_docs']))
                    $update_data['ref_docs'] = json_encode($update_data['ref_docs']);
                else
                    $update_data['ref_docs'] = NULL;
                if ($request->hasFile('file')) {
                    $update_data['has_file'] = "Y";
                }
                $update_data['updated_ipaddress'] = request()->getClientIp();
                $update_data['updated_by'] = session('user_id');
                $task_id = $update_data['task_id'];
                $sts = DB::table("tbl_task")->where('task_id', $task_id)->where('created_by', session('user_id'))->update($update_data);

                // Departement
                $unmatchedOldDept = array_diff($old_dept_section_officer, $dept_section_officer);
                $unmatchedNewDept = array_diff($dept_section_officer, $old_dept_section_officer);

                // dd($unmatchedOldDept, $unmatchedNewDept);
                if (sizeof($unmatchedOldDept) > 0) {
                    foreach ($unmatchedOldDept as $value) {
                        $ids = explode("_", $value);
                        $fk_user_id = $ids[0];
                        $fk_dept_id = $ids[1];

                        $sts = DB::delete("DELETE FROM tbl_task_user_map WHERE fk_user_id = $fk_user_id AND fk_dept_id=$fk_dept_id AND fk_task_id=$task_id");
                    }
                }
                if (sizeof($unmatchedNewDept) > 0) {
                    $task_user_map = [];
                    foreach ($unmatchedNewDept as $value) {
                        $ids = explode("_", $value);
                        $fk_user_id = $ids[0];
                        $fk_dept_id = $ids[1];

                        array_push($task_user_map, array(
                            'fk_dept_id' => $fk_dept_id,
                            'fk_task_id' => $task_id,
                            'fk_user_id' => $fk_user_id,
                            'created_by' => session('user_id'),
                            'created_ip' => request()->getClientIp()
                        ));
                    }
                    $sts = DB::table("tbl_task_user_map")->insert($task_user_map);
                }
                // file upload
                if ($request->hasFile('file')) {
                    $d_sts = DB::delete("DELETE FROM tbl_task_files WHERE fk_task_id=$task_id");
                    $file = $request->file('file');
                    $upload_data['file_name'] = $file->getClientOriginalName();
                    $upload_data['file_size'] = $file->getSize();
                    $upload_data['fk_task_id'] = $task_id;
                    $upload_data['file'] = UtilController::upload_file($file, 'task_files', 'uploads', ['jpeg', 'jpg', 'png', 'pdf'], ['image/jpeg', 'image/png', 'application/pdf']);
                    if ($upload_data['file'] == false)
                        $sts = false;
                    else {
                        $sts = DB::table("tbl_task_files")->insert($upload_data);
                        if (!$sts || !$d_sts)
                            $sts = false;
                    }
                }

                if ($sts) {
                    DB::commit();
                    $this->response = ["sts" => 1, "message" => "Task successfully updated",];
                } else {
                    DB::rollBack();
                    $this->response = ["sts" => 2, "message" => "Please try again"];
                }
            }
            return response()->json($this->response);
        }
    }

    function taskSendBack(Request $request)
    {
        $ids = explode("_", $request->ids);
        $task_id = $ids[0];
        $sb_data['send_back_remark'] = $request->remark;
        $sb_data['send_back_status'] = "P";
        $sb_data['is_send_back'] = 1;
        $sb_data['send_back_by'] = session('user_id');
        $sb_data['send_back_date'] = date('Y-m-d H:i:s');
        $sb_data['send_back_ipaddress'] = request()->getClientIp();

        $dept_id = explode(',', session('department_id'));
        $map_id = $ids[1];

        $sts = false;
        $loop_sts = true;
        DB::beginTransaction();
        foreach ($dept_id as $val) {
            if ($loop_sts) {
                $sts = DB::table('tbl_task_user_map')->where('fk_task_id', $task_id)
                    ->where('fk_dept_id', $val)->where('map_id', $map_id)->update($sb_data);
                if ($sts) {
                    $sb_data['fk_task_id'] = $task_id;
                    $sb_data['fk_dept_id'] = $val;
                    $sb_data['fk_map_id'] = $map_id;
                    $sts = DB::table('tbl_task_send_back_trs')->insert($sb_data);
                    if (!$sts)
                        $loop_sts = false;
                }
            } else
                $sts = false;
        }
        if ($sts) {
            DB::commit();
            $this->response = ["sts" => 1, "message" => "Successful",];
        } else {
            DB::rollBack();
            $this->response = ["sts" => 2, "message" => "Please try again"];
        }
        return response()->json($this->response);
    }

    function sendBackList()
    {
        $user_id = session('user_id');
        $dept = "";
        $umap = "";
        $tbl_user = "";
        if (session('level_id') > 1) {
            $depart_ids = session('department_id');
            $user_id = session('create_by');
            $dept = " AND m.fk_dept_id IN($depart_ids) AND m.send_back_by=" . session('user_id');
            $umap = " AND um.fk_user_id=" . session('user_id');
            $tbl_user = " AND u.user_id=" . session('user_id');
        }
        $data = DB::select("SELECT t.*,m.td_sb_id, m.fk_map_id, m.send_back_remark, m.send_back_status, d.department_hin, d.department_eng,
        u.full_name, u.mobile, u.username, DATE_FORMAT(m.send_back_date, '%d %b, %Y - %h:%i%p') send_back_date,
        DATE_FORMAT(m.sb_action_date, '%d %b, %Y - %h:%i%p') sb_action_date, m.sb_action_remark FROM
        (
            SELECT t.task_id, t.title, t.entry_date, t.due_date FROM tbl_task t WHERE t.created_by= $user_id #AND t.status='I'
        ) t
        INNER JOIN tbl_task_send_back_trs m ON m.fk_task_id = t.task_id AND m.send_back_status IS NOT NULL $dept
        INNER JOIN master_department d ON d.dept_id = m.fk_dept_id
        INNER JOIN tbl_user_map um ON um.fk_department_id = m.fk_dept_id $umap
        INNER JOIN tbl_users u ON u.user_id = um.fk_user_id $tbl_user
        ORDER BY m.send_back_date ASC");
        return $data;
    }

    function taskSBChangeStatus(Request $request)
    {
        $sb_data = explode('_', base64_decode($request->sts_data));
        $update_data['sb_action_remark'] = $request->remark;
        $update_data['send_back_status'] = $sb_data[3];
        $update_data['sb_action_by'] = session('user_id');
        $update_data['sb_action_date'] = NOW();
        $update_data['sb_action_ipddress'] = request()->getClientIp();

        $task_id = $sb_data[0];
        $td_map_id = $sb_data[1];
        $td_sb_id = $sb_data[2];
        DB::beginTransaction();
        $sts = DB::table('tbl_task_user_map')
            ->where('fk_task_id', $task_id)->where('map_id', $td_map_id)->update($update_data);
        if ($sts) {
            $sts = DB::table('tbl_task_send_back_trs')
                ->where('fk_task_id', $task_id)->where('fk_map_id', $td_map_id)->where('td_sb_id', $td_sb_id)->update($update_data);
        }
        if ($sts) {
            DB::commit();
            $this->response = ["sts" => 1, "message" => "Successful",];
        } else {
            DB::rollBack();
            $this->response = ["sts" => 2, "message" => "Please try again"];
        }
        return response()->json($this->response);
    }

    function userTaskAllocate(Request $request)
    {
        try {
            if ($request->dept_section_officer) {
                $dept_section_officer = $request->dept_section_officer;
                $old_dept_section_officer = json_decode($request->old_dept_section_officer);
                // dd($old_dept_section_officer, $dept_section_officer);
                $sts = false;

                DB::beginTransaction();
                $task_id = $request->task_id;
                $unmatchedOldDept = array_diff($old_dept_section_officer, $dept_section_officer);
                $unmatchedNewDept = array_diff($dept_section_officer, $old_dept_section_officer);

                // dd($unmatchedOldDept, $unmatchedNewDept);
                if (sizeof($unmatchedOldDept) > 0) {
                    foreach ($unmatchedOldDept as $value) {
                        $ids = explode("_", $value);
                        $fk_user_id = $ids[0];
                        $fk_dept_id = $ids[1];

                        $sts = DB::delete("DELETE FROM tbl_task_user_map WHERE fk_user_id = $fk_user_id AND fk_dept_id=$fk_dept_id AND fk_task_id=$task_id");
                    }
                }
                if (sizeof($unmatchedNewDept) > 0) {
                    $task_user_map = [];
                    foreach ($unmatchedNewDept as $value) {
                        $ids = explode("_", $value);
                        $fk_user_id = $ids[0];
                        $fk_dept_id = $ids[1];

                        array_push($task_user_map, array(
                            'fk_dept_id' => $fk_dept_id,
                            'fk_task_id' => $task_id,
                            'fk_user_id' => $fk_user_id,
                            'created_by' => session('user_id'),
                            'created_ip' => request()->getClientIp()
                        ));
                    }
                    $sts = DB::table("tbl_task_user_map")->insert($task_user_map);
                }
                if ($sts) {
                    DB::commit();
                    $this->response = ["sts" => 1, "message" => "Successfully allocated",];
                } else {
                    DB::rollback();
                    $this->response = ["sts" => 2, "message" => "Please try again"];
                }
            } else {
                $this->response = ["sts" => 3, "message" => "Select at least one officer"];
            }
        } catch (\Exception $e) {
            $this->response = ["sts" => 3, "message" => "Please try again..."];
        }
        return response()->json($this->response);
    }

    function taskAllocatedList($user_id)
    {
        $data = DB::select("SELECT CONCAT(m.fk_user_id,'_',m.fk_dept_id) user_dept FROM tbl_task_user_map m WHERE m.created_by= $user_id");
        return $data;
    }

    function officesTaskReportAjax()
    {
        $created_by = session('user_id');
        $data = DB::select("SELECT m.fk_dept_id, d.department_eng, d.department_hin, COUNT(DISTINCT(m.fk_task_id)) total, SUM(IF(t.status='C',1,0)) completed,
                SUM(IF(t.status='I',1,0)) inprogress FROM
            (
                SELECT m.fk_task_id, m.fk_dept_id
                FROM tbl_task_user_map m WHERE m.created_by=$created_by GROUP BY m.fk_task_id, m.fk_dept_id
            ) m
            INNER JOIN tbl_task t ON t.task_id = m.fk_task_id AND t.created_by=$created_by
            INNER JOIN master_department d ON m.fk_dept_id = d.dept_id
            GROUP BY m.fk_dept_id");
        return $data;
    }

    function taskReopen(Request $request)
    {

        $task_id = base64_decode($request->id);
        $ro_data['fk_task_id'] = $task_id;
        $ro_data['reopen_remark'] = $request->remark;
        $ro_data['reopen_by'] = session('user_id');
        $ro_data['reopen_ipaddress'] = request()->getClientIp();

        $sts = false;
        DB::beginTransaction();
        $sts = DB::table('tbl_task')
            ->where('task_id', $task_id)
            ->update(['status' => 'O']);
        if ($sts) {
            $sts = DB::table('tbl_task_reopen_trs')->insert($ro_data);
        }
        if ($sts) {
            DB::commit();
            $this->response = ["sts" => 1, "message" => "Task reopened successfully",];
        } else {
            DB::rollBack();
            $this->response = ["sts" => 2, "message" => "Please try again"];
        }
        return response()->json($this->response);
    }
    function attachSupportingDocs(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'task_file' => 'required|file|mimes:pdf,png,jpeg,jpg',
        ]);

        $sts = false;
        if ($validator->fails()) {
            $this->response = ["sts" => 3, "message" => "File required", "data" => $validator->errors()];
        } else {
            DB::beginTransaction();
            try {
                if ($request->hasFile('task_file')) {
                    $file = $request->file('task_file');
                    $upload_data['file_name'] = $file->getClientOriginalName();
                    $upload_data['file_size'] = $file->getSize();
                    $upload_data['fk_task_id'] = $request->task_id;
                    $upload_data['file'] = UtilController::upload_file($file, 'task_files', 'uploads', ['jpeg', 'jpg', 'png', 'pdf'], ['image/jpeg', 'image/png', 'application/pdf']);
                    if ($upload_data['file'] == false)
                        $sts = false;
                    else {
                        $sts = DB::table("tbl_task_files")->insert($upload_data);
                        $count = DB::select("SELECT COUNT(1) cnt FROM tbl_task t WHERE t.task_id=$request->task_id AND t.has_file='Y'")[0]->cnt;
                        if ($count == 0)
                            $sts = DB::table("tbl_task")->where('task_id', $request->task_id)->update(array('has_file' => 'Y'));
                    }

                    if ($sts) {
                        DB::commit();
                        Session::flash('success', 'Supporting documents successfully attached');
                        $this->response = ["sts" => 1, "message" => "Supporting documents successfully attached",];
                    } else {
                        DB::rollBack();
                        $this->response = ["sts" => 2, "message" => "Please try again.",];
                    }
                }
            } catch (\Exception $e) {
                DB::rollBack();
                $this->response = ["sts" => 3, "message" => "Please try again.."];
            }
        }
        return response()->json($this->response);
    }

    function deleteTaskFile(Request $request)
    {
        if ($request->post()) {
            try {
                $sts = DB::table('tbl_task_files')->where('file_id', $request->file_id)->where('fk_task_id', $request->task_id)->delete();
                if ($sts) {
                    $count = DB::select("SELECT COUNT(1) cnt FROM tbl_task_files t WHERE t.fk_task_id=$request->task_id")[0]->cnt;
                    if ($count == 0)
                        $sts = DB::table("tbl_task")->where('task_id', $request->task_id)->update(array('has_file' => 'N'));
                    $this->response = ["sts" => 1, "message" => "Successfully deleted",];
                } else {
                    $this->response = ["sts" => 2, "message" => "Please try again.",];
                }
            } catch (\Exception $e) {
                $this->response = ["sts" => 2, "message" => "Please try again.."];
            }
            return response()->json($this->response);
        }
    }

    function officesTaskPerformance()
    {
        $created_by = session('user_id');
        $data = DB::select("SELECT u.full_name fullName, COALESCE (tbl1.task_count,0) totalCount
                            FROM tbl_users u
                            LEFT JOIN (
                                SELECT fk_user_id, COUNT(*) AS task_count
                                FROM tbl_task_user_map 
                                GROUP BY fk_user_id
                            ) tbl1 ON u.user_id = tbl1.fk_user_id");
        return $data;
    }
}
