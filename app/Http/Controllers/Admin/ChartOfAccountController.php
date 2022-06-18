<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChartOfAccountSubType;
use Illuminate\Http\Request;

class ChartOfAccountController extends Controller
{
    public function subTypeJson(Request $request)
    {
        $type = $request->type;
        $subTypes = ChartOfAccountSubType::where('type',$type)->get();
        return response()->json($subTypes);
    }
}