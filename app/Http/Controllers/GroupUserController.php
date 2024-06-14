<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GroupUser;

class GroupUserController extends Controller
{
    public function index()
    {
        $groupUsers = GroupUser::all();
        return response()->json($groupUsers);
    }

    public function store(Request $request)
    {
        $groupUser = GroupUser::create($request->all());
        return response()->json($groupUser, 201);
    }

    public function show($id)
    {
        $groupUser = GroupUser::findOrFail($id);
        return response()->json($groupUser);
    }

    public function update(Request $request, $id)
    {
        $groupUser = GroupUser::findOrFail($id);
        $groupUser->update($request->all());
        return response()->json($groupUser, 200);
    }

    public function destroy($id)
    {
        GroupUser::findOrFail($id)->delete();
        return response()->json(null, 204);
    }
}
