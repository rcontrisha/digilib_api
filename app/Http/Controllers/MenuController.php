<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MenuController extends Controller
{
    public function getAllMenus(Request $request)
    {
        // Ambil id_group dari request (misalnya dari header)
        $idGroup = $request->header('idGroup');

        // Ambil menu utama yang diperbolehkan berdasarkan idGroup
        $mainMenus = DB::table('m_menu')
            ->join('t_akses_menu', 'm_menu.id_menu', '=', 't_akses_menu.id_menu')
            ->whereNull('m_menu.parent')
            ->where('m_menu.level', 1)
            ->where('m_menu.tampil', 'Y')
            ->where('t_akses_menu.id_group_user', $idGroup)
            ->get();

        // Ambil submenu dari setiap menu utama
        foreach ($mainMenus as $menu) {
            $menu->subMenu = $this->getSubMenu($request, $menu->id_menu);
        }

        // Gabungkan menu utama dengan submenu-nya dan menu lainnya
        return response()->json($mainMenus);
    }

    protected function getSubMenu(Request $request, $parentId)
    {
        // Ambil submenu berdasarkan id_menu parent
        $subMenus = DB::table('m_menu')
            ->where('parent', $parentId)
            ->where('level', 2)
            ->where('tampil', 'Y')
            ->get();

        return $subMenus;
    }
}
