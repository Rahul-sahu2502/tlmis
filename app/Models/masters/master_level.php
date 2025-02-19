<?php

namespace App\Models\masters;

use App\Models\tbl_level_role_map;
use Illuminate\Database\Eloquent\Model;

class master_level extends Model
{
    protected $table = 'master_level';
    protected $primaryKey = 'level_id';
    protected $fillable = ["level", "remark", "is_active"];
    public $timestamps = false;

    // Relationship with tbl_level_role_map
    public function levelRoleMaps()
    {
        return $this->hasMany(tbl_level_role_map::class, 'fk_level_id', 'level_id');
    }
}
