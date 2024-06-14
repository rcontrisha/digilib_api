<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupUser extends Model
{
    protected $table = 'm_group_user'; // Ganti nama_tabel_group_user dengan nama tabel yang sesuai
    protected $primaryKey = 'id_group_user'; // Ganti id_group_user dengan primary key yang sesuai
    public $incrementing = false; // Sesuaikan dengan konfigurasi primary key
    protected $keyType = 'string'; // Karena id_kategori adalah varchar
    public $timestamps = false; 
    
    protected $fillable = [
        'id_group_user', 'desk_group_user',
    ];
}
