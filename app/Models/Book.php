<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $table = 'm_buku';
    protected $primaryKey = 'id_buku'; // Menetapkan kolom 'id_buku' sebagai kunci utama
    public $timestamps = false;

    // Atribut yang dapat diisi (kecuali id_buku)
    protected $fillable = [
        'id_buku', 'judul', 'deskripsi', 'id_kategori', 'pengarang', 'tahun', 'penerbit', 'path_file', 'tgl_upload', 'id_user_upload'
    ];

    // Mendisable penambahan id_buku secara otomatis (auto-increment)
    public $incrementing = false;
    protected $keyType = 'string'; // Karena id_buku adalah varchar
}

