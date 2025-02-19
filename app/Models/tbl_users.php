<?php

namespace App\Models;

use App\Models\masters\master_designation;
use App\Models\masters\master_level;
use Illuminate\Database\Eloquent\Model;
use Staudenmeir\EloquentHasManyDeep\HasManyDeep;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Auth\Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class tbl_users extends Model implements AuthenticatableContract, JWTSubject
{
    use Authenticatable;
    public $timestamps = false;
    protected $table = 'tbl_users';
    protected $primaryKey = 'user_id';
    protected $fillable = ["full_name", "mobile", "email", "username", "password", "salt", "district_lgd_code", "is_active", "has_permissions", "remember_token", "is_password_changed"];

    // Relationship with tbl_user_map (for user mapping data)
    public function userMaps()
    {
        return $this->hasMany(tbl_user_map::class, 'fk_user_id', 'user_id');
    }

    // Indirect relationship with levels and designations via tbl_user_map
    public function levels()
    {
        return $this->hasManyThrough(
            master_level::class,
            tbl_user_map::class,
            'fk_user_id', // Foreign key on tbl_user_map
            'level_id',   // Foreign key on master_level
            'user_id',    // Local key on tbl_users
            'fk_level_id'   // Local key on tbl_user_map
        );
    }

    public function designations()
    {
        return $this->hasManyThrough(
            master_designation::class,
            tbl_user_map::class,
            'fk_user_id',     // Foreign key on tbl_user_map
            'designation_id', // Foreign key on master_designation
            'user_id',        // Local key on tbl_users
            'fk_designation_id' // Local key on tbl_user_map
        );
    }

    // Methods required by the JWTSubject interface
    public function getJWTIdentifier()
    {
        return $this->getKey(); // Typically, the primary key
    }

    public function getJWTCustomClaims()
    {
        return []; // Add any custom claims, if needed
    }
}
