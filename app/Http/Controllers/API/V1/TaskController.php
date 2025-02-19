<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Http\Controllers\TaskController as TaskData;
use App\Http\Controllers\UtilController;
use App\Library\ApiResponseHandler;
use App\Models\tl_review_task_map;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class TaskController extends Controller
{
    use ApiResponseHandler;

    public function remark_update(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'task_id' => 'required',
            'remarks' => 'required',
        ]);        
        if ($validator->fails()) {
            return response()->json($this->basicResponse('failed', $validator->errors()->first()), 200);    
        }

        try {
            
            $user = auth('api')->user();
            $userId = $user->user_id;
            $task_id = $request->task_id;
            $remarks = $request->remarks;

            $taskMap = tl_review_task_map::where('fk_task_id', $task_id)->first();
            if (!$taskMap) {
                return response()->json($this->basicResponse('failed', 'Task not found!'));
            }
            $taskMap->remarks = $remarks;
            $taskMap->updated_by = $userId;
            $taskMap->save();

            return response()->json($this->basicResponse('success', 'Task updated successfully'));
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', $th->getMessage()));
        }
    }

    public function overview(Request $request)
    {
        $user = auth('api')->user();
        $userId = $user->user_id;
        $task_id = $request->id;
        if (!$task_id) {
            return response()->json($this->basicResponse('failed', 'Task id is required!'));
        }

        try {
            
            $data = (new TaskData())->taskListDetails($userId, $task_id, 1, '');
            if (array_key_exists('0', $data)) {
                $data['task'] = $data['0'];
                unset($data['0']);
            }
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', $th->getMessage()));
        }

        return response()->json($this->responseWithData('success', 'Task fetched successfully', $data));
    }

    public function reply_logs(Request $request)
    {
        $user = auth('api')->user();
        $userId = $user->user_id;
        $task_id = $request->id;
        if (!$task_id) {
            return response()->json($this->basicResponse('failed', 'Task id is required!'));
        }

        try {

            $request->task_id = $task_id;
            $request->user_id = $userId;
            
            $data = (new TaskData())->taskReplyList($request, true);
            $data = json_decode($data, true);
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', $th->getMessage()));
        }

        return response()->json($this->responseWithData('success', 'Reply Log fetched successfully', $data));
    }

    public function reply(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'task_id' => 'required',
            'reply_text' => 'required',
        ]);        
        if ($validator->fails()) {
            return response()->json($this->basicResponse('failed', $validator->errors()->first()), 200);    
        }

        try {
            
            $user = auth('api')->user();
            $userId = $user->user_id;
            $insert_data = [];
            $insert_data['fk_task_id'] = $request->task_id;
            $insert_data['reply'] = $request->reply_text;

            $sts=true;
            if ($request->hasFile('reply_file')) {
                $file = $request->file('reply_file');
                $insert_data['file_name'] = $file->getClientOriginalName();
                $insert_data['file_size'] = $file->getSize();
                $insert_data['reply_file'] = UtilController::upload_file($file, 'task_reply_files', 'uploads', ['jpeg', 'jpg', 'png', 'pdf'], ['image/jpeg', 'image/png', 'application/pdf']);
                if ($insert_data['reply_file'] == false) {
                    $sts=false;
                }
            }
            if($sts){
                $insert_data['created_ipaddress'] = request()->getClientIp();
                $insert_data['created_by'] = $userId;
                $last_insert_id = DB::table("tbl_task_reply_trs")->insertGetId($insert_data);
                if ($last_insert_id) {
                    DB::table("tbl_task")->where('task_id', $request->fk_task_id)->update(['is_replied' => 'Y']);
                } else {
                    throw new \Exception("Error Processing Request", 1);
                }
            }

            return response()->json($this->basicResponse('success', 'Comment added successfully'));
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', $th->getMessage()));
        }
    }

    public function close(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'task_id' => 'required',
            'remark' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($this->basicResponse('failed', $validator->errors()->first()), 200);
        }

        try {
            $user = auth('api')->user();
            $userId = $user->user_id;
            $request->task_id = $request->task_id;
            $request->user_id = $userId;

            $data = (new TaskData())->taskReplyList($request, true);
            $data = json_decode($data, true);
            if(sizeof($data) == 0){
                return response()->json($this->basicResponse('failed', 'At least one comment/reply before close the task!'));
            }

            $task_id = $request->task_id;
            $closed_data = [
                'closed_remark' => $request->remark,
                'status' => 'C',
                'closed_by' => $userId,
                'closed_date' => now(),
                'closed_ipaddress' => $request->getClientIp(),
            ];

            $updateStatus = DB::table('tbl_task')->where('task_id', $task_id)->update($closed_data);

            if ($updateStatus) {
                unset($closed_data['status']);
                $closed_data['fk_task_id'] = $task_id;

                DB::table('tbl_task_closed_trs')->insert($closed_data);

                return response()->json($this->basicResponse('success', 'Successfully Closed'));
            } else {
                return response()->json($this->basicResponse('failed', 'Please try again'));
            }
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', $th->getMessage()));
        }
    }

}
