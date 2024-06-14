<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LogController extends Controller
{
    public function getLogsByDate($tgl)
    {
        $logs = DB::table('t_log as a')
            ->select('b.nama_user', 'b.email', 'd.desk_group_user', 'a.tgl_log', 'a.session')
            ->join('m_user as b', 'a.id_user', '=', 'b.id_user')
            ->join('m_group_user as d', 'b.id_group_user', '=', 'd.id_group_user')
            ->whereDate('a.tgl_log', $tgl)
            ->orderByDesc('a.tgl_log')
            ->get();

        return response()->json(['logs' => $logs]);
    }
}
