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
        $data['title'] = 'Performance Delay';
        $data['page_title'] = 'Performance Delay';
        return view('performance.delay', $data);
    }


    public function count_tasks()
    {

        $chartValues = DB::select("SELECT DISTINCT
                                   u.full_name,
                                       AVG(COALESCE(tbl1.total_count, 0)) total_task,
                                       AVG(COALESCE(count_completed, 0)) total_completed,
                                       AVG(COALESCE(tbl2.total_reply, 0)) number_of_reply,
                                       (AVG(COALESCE(count_completed, 0)) - AVG(COALESCE(tbl2.total_reply, 0))) AS no_reply
                                   FROM tbl_users u
                                   INNER JOIN tbl_user_map tum ON u.user_id = tum.fk_user_id and tum.fk_level_id != 1
                                   LEFT JOIN
                                       (SELECT fk_user_id, COUNT(fk_task_id) total_count, sum(
                                           case when t.status = 'C'
                                           then 1 ELSE 0 END) count_completed FROM tbl_task_user_map tum inner JOIN tbl_task t ON tum.fk_task_id = t.task_id GROUP BY fk_user_id) tbl1
                                   ON u.user_id = tbl1.fk_user_id
                                   left JOIN
                                       (SELECT created_by, COUNT(DISTINCT fk_task_id) total_reply FROM tbl_task_reply_trs GROUP BY created_by) tbl2
                                   ON u.user_id = tbl2.created_by
                                   GROUP BY u.full_name");

        // $data['chartValues'] = $chartValues;
        $data['title'] = 'Count Task';
        $data['page_title'] = 'count_task';
        return view('performance.count_task', [$data, 'chartValues' => $chartValues]);
    }






    public function rating()
    {
        $data['title'] = 'Performnace Ratings';
        $data['page_title'] = 'Performance Ratings';
        return view('performance.rating', $data);
    }

    public function give_rating_page()
    {
        // $data['var']= $req->var;
        $data['title'] = 'User Task Rating';
        $data['page_title'] = 'Give User Task Rating ';
        return view('performance.user_task_rating', $data);
    }
}
