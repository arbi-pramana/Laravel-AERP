<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BankTransfer extends Model
{
    use HasFactory;

    public function account_from()
    {
        return $this->belongsTo(BankAccount::class,'from_account','id');
    }

    public function account_to()
    {
        return $this->belongsTo(BankAccount::class,'to_account','id');
    }

}
