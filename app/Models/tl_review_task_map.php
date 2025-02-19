<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class tl_review_task_map extends Model
{
    use HasFactory;

    protected $table = 'tl_review_task_map';

    protected $fillable = [
        'fk_tl_review_id','fk_task_id','status','remarks','created_by','updated_by','created_ip','updated_ip'
    ];
    public function tlReview()
    {
        return $this->belongsTo(tl_review::class, 'fk_tl_review_id');
    }
    public function task()
    {
        return $this->belongsTo(tbl_task::class, 'fk_task_id', 'task_id');
    }
}
