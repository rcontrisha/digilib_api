<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'm_user'; // Nama tabel

    protected $primaryKey = 'id_user'; // Primary key

    public $incrementing = false; // Jika id_user bukan auto-increment
    public $timestamps = false; 

    protected $fillable = [
        'id_user', 'nama_user', 'email', 'password', 'id_group_user', 'aktif'
    ];

    protected $keyType = 'string'; // Karena id_kategori adalah varchar

    // Jika password dienkripsi dalam bentuk base64, bisa tambahkan accessor
    public function getPasswordAttribute($value)
    {
        return base64_decode($value);
    }
}
