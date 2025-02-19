<?php
namespace App\Models;

use App\Models\masters\master_department;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class tbl_task_user_map extends Model
{
    use HasFactory;

    protected $table = 'tbl_task_user_map';
    protected $fillable = [
        'fk_task_id',
        'fk_dept_id',
        'fk_section_id',
        'fk_user_id',
        'created_by',
        'created_at',
        'created_ip'
    ];

    public function department()
    {
        return $this->belongsTo(master_department::class, 'fk_dept_id','dept_id');
    }

    public function task()
    {
        return $this->belongsTo(tbl_task::class, 'fk_task_id','task_id');
    }
}
