<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillPayment extends Model
{
    use HasFactory;

    public function account()
    {
        return $this->belongsTo(BankAccount::class,"account_id","id");
    }
}
