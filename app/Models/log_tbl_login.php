<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class log_tbl_login extends Model
{
    protected $table = 'log_tbl_login';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = ["fk_user_id", "current_status", "login_ipaddress", "logged_out_ipaddress"];

    function relatedUser(){
        return $this->belongsTo(tbl_users::class, 'fk_user_id', 'user_id');
    }
}
