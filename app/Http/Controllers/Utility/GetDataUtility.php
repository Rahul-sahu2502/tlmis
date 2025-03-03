<?php

namespace App\Http\Controllers\Utility;

use App\Http\Controllers\Controller;
use App\Models\masters\master_department;
use App\Models\masters\master_designation;
use App\Models\masters\master_level;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class GetDataUtility extends Controller
{
    public static function getLevels()
    {
        return master_level::where('is_active', 1)
            ->where('level_id', '>', Session::get('level_id'))
            ->whereNot('level_id', Session::get('level_id'))
            ->get();
    }
    public static function getDepartments()
    {
        return master_department::where('is_active', 1)->get();
    }
    public static function getDesignations()
    {
        return master_designation::where('is_active', 1)->get();
    }


    static function getTaskPriorities()
    {
        return DB::select("SELECT t.task_category_id, t.category FROM master_task_category t WHERE t.is_active = 1");
    }
    static function getTaskCategories()
    {
        return DB::select("SELECT t.task_priority_id, t.priority FROM master_task_priority t WHERE t.is_active = 1");
    }
    static function getUserList($userId)
    {
        $condition = " AND m.fk_level_id>1";
        if (Session::get('level_id') != 1) {
            // AND m.create_by= $userId
            $condition = " AND m.fk_level_id>" . session()->get('level_id');
        }
        return DB::select("SELECT m.*, u.full_name, u.mobile, l.level, d.department_eng, md.designation FROM
            (
                SELECT m.fk_user_id, m.fk_level_id,m.fk_department_id, m.fk_designation_id
                FROM tbl_user_map m WHERE 1=1 AND m.is_active=1 $condition #AND m.fk_level_id=2
            ) m
            INNER JOIN tbl_users u ON u.user_id = m.fk_user_id
            LEFT JOIN master_level l ON l.level_id = m.fk_level_id
            LEFT JOIN master_department d ON d.dept_id = m.fk_department_id
            LEFT JOIN master_designation md ON md.designation_id = m.fk_designation_id
            ORDER BY m.fk_department_id, m.fk_level_id ASC");
    }

    // it will return user_id or task_id through to map_id
    static function getUserTaskId($mapId)
    {
        return DB::select("SELECT fk_user_id, fk_task_id FROM tbl_task_user_map WHERE map_id =?", [$mapId]);
    }
    static function getUserName($userId)
    {
        return DB::select("SELECT full_name FROM tbl_users WHERE user_id =?", [$userId]);
    }
}
