<?php

namespace App\Models\masters;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class master_doc_types extends Model
{
    use HasFactory;

    protected $table = 'master_doc_types';

    protected $fillable = [
        'name_hi', 
        'name_en', 
        'status', 
        'created_by', 
        'updated_by', 
        'created_ip', 
        'updated_ip'
    ];
    protected static function booted()
    {
        static::addGlobalScope('active', function (Builder $builder) {
            $builder->where('status', 1);
        });
    }
}
