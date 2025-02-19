<?php

namespace App\Models;

use App\Models\masters\issuers;
use App\Models\masters\master_doc_types;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User;
use Illuminate\Database\Eloquent\Builder;

class file_mgmt extends Model
{
    use HasFactory;
    protected $table = 'tbl_file_mgmt';
    protected $fillable = [
        'id','file_type_id', 'reference_no', 'issue_date', 'issuer', 'receiving_date', 'unique_file_id','doc_nature','doc_priority','status', 'created_by', 'updated_by', 'created_ip', 'updated_ip'
    ];
    public function getDocPriorityLabelAttribute()
    {
        $labels = [
            'Immediate' => 'Immediate (तत्काल)',
            '2' => 'Within 2 Days (2 दिन के अंदर)',
            '5' => 'Within 5 Days (5 दिन के अंदर)',
            '7' => 'Within 7 Days (7 दिन के अंदर)',
            'Other' => 'Other (अन्य)',
        ];

        return $labels[$this->attributes['doc_priority']] ?? 'Unknown';
    }
    protected static function booted()
    {
        static::addGlobalScope('active', function (Builder $builder) {
            $builder->where('status', 1);
        });
    }
    public function uploads()
    {
        return $this->hasMany(file_mgmt_uploads::class, 'fk_file_mgmt_id');
    }
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
    public function issuerDetails()
    {
        return $this->belongsTo(issuers::class, 'issuer', 'id');
    }
    public function fileTypeDetails()
    {
        return $this->belongsTo(master_doc_types::class, 'file_type_id', 'id');
    }
}
