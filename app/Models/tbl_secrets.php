<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class tbl_secrets extends Model
{
    protected $table = 'tbl_secrets';
    protected $primaryKey = 'otp_id';
    public $timestamps = false;
    protected $fillable = ["user_id", "mobile", "otp", "created_at", "verified_at"];
}
