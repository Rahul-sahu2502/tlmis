<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;

class PerformanceController extends Controller
{

    public function delay()
    {
        $chartValues = DB::select(
            "SELECT 
                    COUNT(t.task_id) AS total_task,
                   	 SUM(CASE WHEN t.status = 'C' THEN 1 ELSE 0 END) AS Complete_tasks,
                   	 SUM(CASE WHEN t.status = 'I' THEN 1 ELSE 0 END) AS Inprocess_tasks,
                   	 SUM(CASE WHEN t.status != 'I' AND t.status != 'C' THEN 1 ELSE 0 END) AS Pending_tasks,
                   	 SUM(CASE 
                           WHEN DATEDIFF(t.closed_date, t.due_date) > 0 THEN 1 
                           ELSE 0 END) AS Delay_tasks
                   FROM tbl_task t"
        );



        $data = [
            'title' => 'Performance Delay',
            'page_title' => 'Performance Delay',
            'chartData' => json_encode($chartValues)
        ];

        return view('performance.delay', $data);
    }





    public function count_tasks()
    {
        $chartValues = DB::select(" SELECT DISTINCT
                                                 u.full_name, 
                                                 COALESCE(tbl1.total_count, 0) AS total_task,
                                                 COALESCE(tbl1.count_completed, 0) AS total_completed,
                                                 COALESCE(tbl2.total_reply, 0) AS number_of_reply,
                                                 COALESCE(tbl1.total_count, 0) - COALESCE(tbl2.total_reply, 0) AS no_reply
                                          FROM tbl_users u 
                                          INNER JOIN tbl_user_map tum  ON u.user_id = tum.fk_user_id AND tum.fk_level_id != 1
                                          LEFT JOIN (
                                                      SELECT 
                                                          fk_user_id, 
                                                          COUNT(fk_task_id) AS total_count, 
                                                          SUM(CASE WHEN t.status = 'C' THEN 1 ELSE 0 END) AS count_completed 
                                                          FROM tbl_task_user_map tum 
                                                       INNER JOIN tbl_task t ON tum.fk_task_id = t.task_id 
                                                       GROUP BY fk_user_id
                                                     ) tbl1 ON u.user_id = tbl1.fk_user_id
                                          LEFT JOIN (
                                                      SELECT 
                                                          created_by, 
                                                          COUNT(DISTINCT fk_task_id) AS total_reply 
                                                      FROM tbl_task_reply_trs  
                                                         GROUP BY created_by
                                                     ) tbl2 ON u.user_id = tbl2.created_by
                                         GROUP BY u.full_name, tbl1.total_count, tbl1.count_completed, tbl2.total_reply
                                 ");
        $data = [
            'title' => 'Count Task',
            'page_title' => 'count_task',
            'chartData' => json_encode($chartValues)
        ];

        return view('performance.count_task', $data);
    }





    public function rating()
    {
        $data = [
            'title' => 'performance ratings',
            'page_title' => 'performance ratings'
        ];

        return view('performance.rating', $data);
    }







    public function give_rating_page()
    {
        // $data['var']= $req->var;
        $data['title'] = 'User Task Rating';
        $data['page_title'] = 'Give User Task Rating';
        return view('performance.user_task_rating', $data);
    }
}
