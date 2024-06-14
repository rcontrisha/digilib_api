<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupMenu extends Model
{
    use HasFactory;

    protected $table = 't_akses_menu'; // Sesuaikan dengan nama tabel yang digunakan
    public $timestamps = false; 

    protected $fillable = [
        'id_group_user',
        'id_menu'
    ];
}
