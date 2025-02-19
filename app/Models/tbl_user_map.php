<?php

namespace App\Models;

use App\Models\masters\master_department;
use App\Models\masters\master_designation;
use App\Models\masters\master_level;
use Illuminate\Database\Eloquent\Model;

class tbl_user_map extends Model
{
    public $timestamps = false;
    protected $table = 'tbl_user_map';
    protected $primaryKey = 'user_map_id';
    protected $fillable = ["fk_user_id", "fk_level_id", "fk_department_id", "fk_designation_id", 'remark', "is_active", "create_by", "update_by", "create_ipaddress", "update_ipaddress"];

// Relationship with tbl_users
    public function user()
    {
        return $this->belongsTo(tbl_users::class, 'fk_user_id', 'user_id');
    }

    // Relationship with tbl_level_role_map
    public function level()
    {
        return $this->belongsTo(master_level::class, 'fk_level_id', 'level_id');
    }

    // Relationship with master_departments
    public function department()
    {
        return $this->belongsTo(master_department::class, 'fk_department_id', 'dept_id');
    }

    // Relationship with master_designation
    public function designation()
    {
        return $this->belongsTo(master_designation::class, 'fk_designation_id', 'designation_id');
    }

}
