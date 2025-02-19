<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class file_mgmt_uploads extends Model
{
    use HasFactory;
    protected $table = 'tbl_file_mgmt_uploads';
    protected $fillable = [
        'fk_file_mgmt_id', 'filename', 'extension', 'path', 'created_by', 'updated_by', 'created_ip', 'updated_ip'
    ];
    public function file_mgmt()
    {
        return $this->belongsTo(file_mgmt::class, 'fk_file_mgmt_id');
    }
}
