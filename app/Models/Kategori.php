<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    protected $table = 'm_kategori'; // Nama tabel di database

    public $timestamps = false; // Jika tabel tidak menggunakan timestamps

    protected $fillable = [
        'id_kategori', 'desk_kategori'
    ];

    protected $primaryKey = 'id_kategori'; // Atur primary key jika bukan 'id'

    public $incrementing = false; // Karena id_kategori bukan auto-increment
    protected $keyType = 'string'; // Karena id_kategori adalah varchar
}
