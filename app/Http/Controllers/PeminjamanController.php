<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Peminjaman;

class PeminjamanController extends Controller
{
    public function index()
    {
        return Peminjaman::all();
    }

    public function store(Request $request)
    {
        return Peminjaman::create($request->all());
    }

    public function show($id)
    {
        return Peminjaman::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $peminjaman = Peminjaman::findOrFail($id);
        $peminjaman->update($request->all());
        return $peminjaman;
    }

    public function destroy($id)
    {
        $peminjaman = Peminjaman::findOrFail($id);
        $peminjaman->delete();
        return 204;
    }

    public function returnBook($id, Request $request)
    {
        $peminjaman = Peminjaman::findOrFail($id);
        
        // Periksa apakah buku sudah dikembalikan
        if ($peminjaman->status_pengembalian === 'Dikembalikan') {
            return response()->json(['message' => 'Buku sudah dikembalikan.'], 400);
        }

        // Perbarui status dan waktu pengembalian
        $peminjaman->update([
            'status_pengembalian' => 'Dikembalikan',
            'returned_at' => $request->input('returned_at'), // Terima waktu pengembalian dari body permintaan
        ]);

        return response()->json(['message' => 'Buku berhasil dikembalikan.'], 200);
    }
}
