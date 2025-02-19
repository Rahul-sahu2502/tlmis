<?php

namespace App\Models\masters;

use App\Models\tbl_user_map;
use Illuminate\Database\Eloquent\Model;

class master_department extends Model
{
    protected $table = 'master_department';
    protected $primaryKey = 'dept_id';
    protected $fillable = ["department_hin", "department_eng", "is_active", "fk_issuer_type"];
    public $timestamps = false;
    // Relationship with tbl_user_map
    public function userMaps()
    {
        return $this->hasMany(tbl_user_map::class, 'fk_department_id', 'dept_id');
    }
    public function issuerType()
    {
        return $this->hasMany(master_issuer_types::class,  'id','fk_issuer_type');
    }
}
