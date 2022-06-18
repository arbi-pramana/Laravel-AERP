<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChartOfAccount extends Model
{
    use HasFactory;

    public function ChartOfAccountType()
    {
        return $this->belongsTo(ChartOfAccountType::class,"type","id");
    }

    public function ChartOfAccountSubType()
    {
        return $this->belongsTo(ChartOfAccountSubType::class,"sub_type","id");
    }
}
