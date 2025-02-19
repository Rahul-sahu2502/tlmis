<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class tbl_notifications extends Model
{
    use HasFactory;
    protected $table = 'tbl_notifications';
    public $timestamps = false;
    protected $fillable = [ 'fk_user_id', 'type', 'module', 'data', 'redirect_url',
        'is_read', 'is_removed','create_by', 'update_by', 'create_ipaddress', 'update_ipaddress'];

    public function user()
    {
        return $this->belongsTo(tbl_users::class);
    }
}
