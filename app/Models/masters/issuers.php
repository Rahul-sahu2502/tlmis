<?php

namespace App\Models\masters;

use App\Models\file_mgmt;
use Illuminate\Database\Eloquent\Model;

class issuers extends Model
{
    protected $table = 'master_issuers';
    protected $fillable = ["name", "issuer_type_id", "status", "created_by", "updated_by", "created_ip", "updated_ip"];
    public function issuerType()
    {
        return $this->belongsTo(master_issuer_types::class, 'issuer_type_id', 'id');
    }
    public function fileMgmt()
    {
        return $this->hasMany(file_mgmt::class, 'issuer', 'id');
    }
}
