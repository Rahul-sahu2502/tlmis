<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tl_review extends Model
{
    use HasFactory;
    protected $table = 'tl_reviews';
    protected $fillable = [
        'tl_date',
        'tl_time',
        'tl_title',
        'tl_desc',
        'tl_status',
        'postponed_date',
        'postponed_time',
        'created_by',
        'updated_by',
        'created_ip',
        'updated_ip'
    ];
    public const STATUS_MAP = [
        'SCH' => 'Scheduled',
        'CMP' => 'Completed',
        'PST' => 'Postponed',
        'CNC' => 'Canceled',
    ];
    public function getTlStatusNameAttribute()
    {
        return self::STATUS_MAP[$this->tl_status] ?? 'Unknown';
    }
    public function getStatusBadgeAttribute()
    {
        $statusClasses = [
            'SCH' => 'badge bg-primary-subtle text-primary',
            'CMP' => 'badge bg-primary-subtle text-success',
            'PST' => 'badge bg-primary-subtle text-warning',
            'CNC' => 'badge bg-primary-subtle text-danger',
        ];

        $class = $statusClasses[$this->tl_status] ?? 'badge bg-primary-subtle text-secondary';
        $label = self::STATUS_MAP[$this->tl_status] ?? 'Unknown';

        return "<span class='{$class}'>{$label}</span>";
    }
    public function reviewTaskMap()
    {
        return $this->hasMany(tl_review_task_map::class, 'fk_tl_review_id');
    }
    public function tasks()
    {
        return $this->hasManyThrough(
            tbl_task::class,               // Final model to fetch
            tl_review_task_map::class,     // Intermediate model
            'fk_tl_review_id',             // Foreign key on tl_review_task_map
            'task_id',                     // Foreign key on tbl_task
            'id',                          // Local key on tl_reviews
            'fk_task_id'                   // Local key on tl_review_task_map
        );
    }
}
