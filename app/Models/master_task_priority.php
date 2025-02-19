<?php
namespace App\Models;

use App\Models\masters\master_department;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class master_task_priority extends Model
{
    use HasFactory;

    protected $table = 'master_task_priority';
    protected $fillable = [
        'task_priority_id',
        'priority',
        'remark',
        'is_active',
        'created_by',
        'created_ipaddress',
        'created_datetime',
        'updated_by',
        'updated_ipaddress',
        'updated_datetime',
    ];

    public function task()
    {
        return $this->belongsTo(tbl_task::class, 'fk_task_priority_id','task_id');
    }
}
