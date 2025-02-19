<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class tbl_task extends Model
{
    use HasFactory;

    protected $table = 'tbl_task';

    protected $fillable = [
        'title',
        'fk_task_priority_id',
        'fk_task_category_id',
        'entry_date',
        'due_date',
        'description',
        'status',
        'remark',
        'has_file',
        'created_by',
        'created_date',
        'created_ipaddress',
        'updated_by',
        'updated_date',
        'updated_ipaddress',
        'closed_by',
        'closed_date',
        'closed_ipaddress',
        'is_replied',
        'ref_docs',
    ];

    protected $casts = [
        'ref_docs' => 'array',
    ];
    public function taskDepartments()
    {
        return $this->hasMany(tbl_task_user_map::class, 'fk_task_id', 'task_id');
    }
    public function taskPriority()
    {
        return $this->belongsTo(master_task_priority::class, 'fk_task_priority_id', 'task_priority_id');
    }
}
