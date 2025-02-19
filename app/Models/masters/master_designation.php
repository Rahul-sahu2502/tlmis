<?php

namespace App\Models\masters;

use App\Models\tbl_level_role_map;
use Illuminate\Database\Eloquent\Model;

class master_designation extends Model
{
    protected $table = 'master_designation';
    protected $primaryKey = 'designation_id';
    protected $fillable = ["designation", "is_active"];
    public $timestamps = false;
    // Relationship with tbl_level_role_map
    public function levelRoleMaps()
    {
        return $this->hasMany(tbl_level_role_map::class, 'fk_designation_id', 'designation_id');
    }
}
