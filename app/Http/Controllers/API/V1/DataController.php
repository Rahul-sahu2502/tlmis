<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Library\ApiResponseHandler;
use App\Models\tl_review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DataController extends Controller
{
    use ApiResponseHandler;
    public function dashboard()
    {
        $user = auth('api')->user();
        $userId = $user->user_id;
        $limit = $request->limit ?? 5;

        $countQuery = "SELECT
            COUNT(DISTINCT tt.task_id) AS total_task,
                COUNT(DISTINCT CASE WHEN tt.status = 'C' THEN tt.task_id END) AS completed_task,
            COUNT(DISTINCT CASE WHEN tt.status = 'I' THEN tt.task_id END) AS inprogress_task,
                COUNT(DISTINCT td_map.fk_dept_id) AS total_departments
            FROM
                tbl_task tt
            LEFT JOIN
                tbl_task_reply_trs ttrt ON tt.task_id = ttrt.fk_task_id
            LEFT JOIN
                tbl_task_dept_map td_map ON tt.task_id = td_map.fk_task_id";

        try {

            $recentReviews = tl_review::where('created_by', $userId)
                ->select('id', 'tl_date', 'tl_time', 'tl_title', 'tl_status', 'postponed_date', 'postponed_time')
                ->orderBy('tl_date', 'desc')->limit($limit)->get();

            $data['taskStats'] = DB::select($countQuery);
            $data['recentReviews'] = $recentReviews;
            return $this->responseWithData('success', 'Dashboard data', $data);
        } catch (\Exception $th) {
            return $this->basicResponse('failed', $th->getMessage());
        }
    }
    
}
