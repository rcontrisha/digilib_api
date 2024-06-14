<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GroupMenu;
use Illuminate\Support\Facades\DB;

class AksesGroupController extends Controller
{
    public function index($id)
    {
        $groupMenus = DB::table('m_menu')
                        ->leftJoin('t_akses_menu as xx', function ($join) use ($id) {
                            $join->on('m_menu.id_menu', '=', 'xx.id_menu')
                                ->where('xx.id_group_user', '=', $id);
                        })
                        ->where('m_menu.tampil', '=', 'Y')
                        ->where('m_menu.level', '=', '1')
                        ->select('m_menu.id_menu', 'xx.id_group_user', 'm_menu.desk_menu')
                        ->get();

        return response()->json($groupMenus, 200);
    }

    public function update(Request $request, $id)
    {
        // Sesuaikan dengan model yang sesuai
        $groupMenu = GroupMenu::findOrFail($id);

        $groupMenu->update($request->all());

        return response()->json($groupMenu, 200);
    }

    public function store(Request $request)
    {
        // Lakukan validasi data
        $validatedData = $request->validate([
            // Tentukan aturan validasi sesuai kebutuhan
            'id_menu' => 'required',
            'id_group_user' => 'required'
        ]);

        // Tambahkan data baru ke dalam tabel
        $groupMenu = GroupMenu::create($validatedData);

        return response()->json($groupMenu, 201);
    }

    public function destroy(Request $request)
    {
        $id_group_user = $request->header('id_group_user');
        $id_menu = $request->header('id_menu');

        if ($id_group_user && $id_menu) {
            // Hapus data dari tabel t_akses_menu berdasarkan id_group_user dan id_group_menu
            DB::table('t_akses_menu')
                ->where('id_group_user', $id_group_user)
                ->where('id_menu', $id_menu)
                ->delete();

            return response()->json(null, 204);
        } else {
            return response()->json(['error' => 'Missing id_group_user or id_group_menu in headers'], 400);
        }
    }
}
