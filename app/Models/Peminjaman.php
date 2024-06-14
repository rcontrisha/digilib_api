<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Peminjaman extends Model
{
    use HasFactory;

    protected $table = 'm_pinjam';
    public $timestamps = false;
    
    protected $fillable = [
        'user_id',
        'book_id',
        'borrowed_at',
        'status_pengembalian',
        'returned_at',
    ];
}
