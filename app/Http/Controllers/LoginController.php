<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 401);
        }

        $user = User::where('email', $request->email)->where('aktif', 'Y')->first();

        // Memeriksa apakah user ditemukan dan passwordnya cocok
        if ($user && $user->password == $request->password) {
            // Simpan log ke dalam tabel t_log
            $tgl_log = now(); // Tanggal dan waktu saat ini
            $session = $this->generateRandomString(32); // Fungsi untuk generate session ID

            DB::table('t_log')->insert([
                'id_user' => $user->id_user,
                'tgl_log' => $tgl_log,
                'session' => $session,
            ]);

            return response()->json([
                'id_user' => $user->id_user,
                'nama_user' => $user->nama_user,
                'email' => $user->email,
                'id_group_user' => $user->id_group_user,
                'session_id' => $session, // Kirim session_id ke frontend jika perlu
            ]);
        } else {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
    }

    // Fungsi untuk generate random string
    private function generateRandomString($length = 32) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
