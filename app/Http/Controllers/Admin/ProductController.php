<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function json(Request $request)
    {
        if(!empty($request->id)){
            return Product::with(['category','unit','tax'])->find($request->id);
        } else {
            return Product::get();
        }
    }
}
