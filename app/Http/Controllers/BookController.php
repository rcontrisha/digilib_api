<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use Illuminate\Support\Facades\Log;

class BookController extends Controller
{
    public function index()
    {
        return Book::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_buku' => 'required|unique:m_buku,id_buku', // Pastikan id_buku unik
            'judul' => 'required',
            'deskripsi' => 'required',
            'id_kategori' => 'required',
            'pengarang' => 'required',
            'tahun' => 'required',
            'penerbit' => 'required',
            'path_file' => 'sometimes',
            'tgl_upload' => 'required',
            'id_user_upload' => 'required'
        ]);

        return Book::create($request->all());
    }

    public function show($id)
    {
        return Book::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $book = Book::findOrFail($id);

        Log::info('Updating book:', $book->toArray());

        $validatedData = $request->validate([
            'id_buku' => 'sometimes|unique:m_buku,id_buku,'.$book->id_buku.',id_buku',
            'judul' => 'sometimes',
            'deskripsi' => 'sometimes',
            'id_kategori' => 'sometimes|string',
            'pengarang' => 'sometimes',
            'tahun' => 'sometimes',
            'penerbit' => 'sometimes',
            'path_file' => 'sometimes',
            'tgl_upload' => 'sometimes',
            'id_user_upload' => 'sometimes'
        ]);

        Log::info('Validated data:', $validatedData);

        $book->update($validatedData);

        Log::info('Updated book:', $book->fresh()->toArray());

        return $book;
    }

    public function destroy($id)
    {
        $book = Book::findOrFail($id);
        $book->delete();

        return response()->json(['message' => 'Book deleted successfully']);
    }

    // Fungsi untuk mengambil buku berdasarkan id_user_upload
    public function getBooksByUser($id_user_upload)
    {
        // Mengambil buku berdasarkan id_user_upload
        $books = Book::where('id_user_upload', $id_user_upload)->get();

        return response()->json($books);
    }
}
