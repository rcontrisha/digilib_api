<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{
    // Get all users
    public function index()
    {
        $users = User::all();
        return response()->json($users, 200);
    }

    // Get user by id
    public function show($id)
    {
        $user = User::find($id);

        if ($user) {
            return response()->json($user, 200);
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }

    // Create new user
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_user' => 'required|unique:m_user',
            'nama_user' => 'required|string|max:255',
            'email' => 'required|email|unique:m_user',
            'password' => 'required|string|min:6',
            'id_group_user' => 'required|string',
            'aktif' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = new User([
            'id_user' => $request->id_user,
            'nama_user' => $request->nama_user,
            'email' => $request->email,
            'password' => base64_encode($request->password),
            'id_group_user' => $request->id_group_user,
            'aktif' => $request->aktif,
        ]);

        $user->save();

        return response()->json($user, 201);
    }

    // Update user by id
    public function update(Request $request, $id)
    {
        $user = User::find($id);

        if ($user) {
            $validator = Validator::make($request->all(), [
                'nama_user' => 'sometimes|required|string|max:255',
                'email' => 'sometimes|required|email|unique:m_user,email,' . $id . ',id_user',
                'password' => 'sometimes|required|string|min:6',
                'id_group_user' => 'sometimes|required|string',
                'aktif' => 'sometimes|required|string',
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            $user->nama_user = $request->get('nama_user', $user->nama_user);
            $user->email = $request->get('email', $user->email);
            if ($request->has('password')) {
                $user->password = base64_encode($request->password);
            }
            $user->id_group_user = $request->get('id_group_user', $user->id_group_user);
            $user->aktif = $request->get('aktif', $user->aktif);

            $user->save();

            return response()->json($user, 200);
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }

    // Delete user by id
    public function destroy($id)
    {
        $user = User::find($id);

        if ($user) {
            $user->delete();
            return response()->json(['message' => 'User deleted successfully'], 200);
        } else {
            return response()->json(['message' => 'User not found'], 404);
        }
    }

    // Edit user password by id
    public function editPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|string',  // id_user yang akan diubah password-nya
            'pass' => 'required|string|min:6',  // password baru
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $id = $request->id;
        $password = base64_encode($request->pass);
        Log::info("$id");

        // Update password in the database
        try {
            $affectedRows = User::where('id_user', $id)->update(['password' => $password]);
            if ($affectedRows > 0) {
                // Password updated successfully
                return response()->json(['message' => 'Password updated successfully'], 200);
            } else {
                // User with the given id not found
                return response()->json(['message' => 'User not found'], 404);
            }
        } catch (\Exception $e) {
            // Handle any potential database errors
            return response()->json(['message' => 'Failed to update password', 'error' => $e->getMessage()], 500);
        }
    }
}
