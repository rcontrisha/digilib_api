<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kategori;

class KategoriController extends Controller
{
    // Mendapatkan semua kategori
    public function index()
    {
        return Kategori::all();
    }

    // Menyimpan kategori baru
    public function store(Request $request)
    {
        $request->validate([
            'id_kategori' => 'required|string|max:10|',
            'desk_kategori' => 'required|string|max:40',
        ]);

        $kategori = Kategori::create($request->all());

        return response()->json($kategori, 201);
    }

    // Mendapatkan kategori berdasarkan ID
    public function show($id)
    {
        $kategori = Kategori::findOrFail($id);
        return response()->json($kategori);
    }

    // Memperbarui kategori berdasarkan ID
    public function update(Request $request, $id)
    {
        $request->validate([
            'desk_kategori' => 'required|string|max:40',
        ]);

        $kategori = Kategori::findOrFail($id);
        $kategori->update($request->all());

        return response()->json($kategori);
    }

    // Menghapus kategori berdasarkan ID
    public function destroy($id)
    {
        $kategori = Kategori::findOrFail($id);
        $kategori->delete();

        return response()->json(['message' => 'Kategori deleted successfully']);
    }
}
