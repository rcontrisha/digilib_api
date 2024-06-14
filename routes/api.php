<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupUserController;
use App\Http\Controllers\PeminjamanController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\AksesGroupController;
use App\Http\Controllers\LogController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route Login
Route::post('login', [LoginController::class, 'login']);

// Route Buku
Route::get('/books', [BookController::class, 'index']);
Route::get('books/{id}', [BookController::class, 'show']);
Route::put('/books/{id}', [BookController::class, 'update']);
Route::post('books', [BookController::class, 'store']);
Route::delete('/books/{id}', [BookController::class, 'destroy']);
Route::get('/contribution/{id_user_upload}', [BookController::class, 'getBooksByUser']);

// Route Kategori
Route::get('/kategori', [KategoriController::class, 'index']);
Route::post('/kategori', [KategoriController::class, 'store']);
Route::get('/kategori/{id}', [KategoriController::class, 'show']);
Route::put('/kategori/{id}', [KategoriController::class, 'update']);
Route::delete('/kategori/{id}', [KategoriController::class, 'destroy']);

// Route User
Route::get('users', [UserController::class, 'index']);
Route::get('users/{id}', [UserController::class, 'show']);
Route::post('users', [UserController::class, 'store']);
Route::put('users/{id}', [UserController::class, 'update']);
Route::delete('users/{id}', [UserController::class, 'destroy']);
Route::post('users/edit-password', [UserController::class, 'editPassword']);

// Route Group User
Route::get('/group-users', [GroupUserController::class, 'index']);
Route::post('/group-users', [GroupUserController::class, 'store']);
Route::get('/group-users/{id}', [GroupUserController::class, 'show']);
Route::put('/group-users/{id}', [GroupUserController::class, 'update']);
Route::delete('/group-users/{id}', [GroupUserController::class, 'destroy']);

// Route Peminjaman
Route::get('/peminjaman', [PeminjamanController::class, 'index']);
Route::post('/peminjaman', [PeminjamanController::class, 'store']);
Route::get('/peminjaman/{id}', [PeminjamanController::class, 'show']);
Route::put('/peminjaman/{id}', [PeminjamanController::class, 'update']);
Route::delete('/peminjaman/{id}', [PeminjamanController::class, 'destroy']);
Route::put('/peminjaman/{id}/return', [PeminjamanController::class, 'returnBook']);

// Route Menu
Route::get('/allowed-menus', [MenuController::class, 'getAllMenus']);

// Route Akses Group
Route::get('/akses-group/{id}', [AksesGroupController::class, 'index']);
Route::post('/akses-group', [AksesGroupController::class, 'store']);
Route::delete('/akses-group', [AksesGroupController::class, 'destroy']);

// Route Log Pengunjung
Route::get('/logs/{tgl}', [LogController::class, 'getLogsByDate']);