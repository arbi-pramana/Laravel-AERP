<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DebitNote extends Model
{
    use HasFactory;

    public function bill()
    {
        return $this->belongsTo(Bill::class,"bill_id","id");
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class,"vendor_id","id");
    }
}
