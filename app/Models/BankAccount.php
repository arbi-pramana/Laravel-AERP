<?php

namespace App\Models;

use App\Utility\Formatting;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BankAccount extends Model
{
    use HasFactory;

    public function current_balance($id)
    {
        $opening_balance = BankAccount::find($id)->opening_balance;

        $from_account = BankTransfer::where('from_account', $id)->sum('amount');
        $to_account = BankTransfer::where('to_account', $id)->sum('amount');
        $current_balance = $opening_balance + $to_account - $from_account;
        return Formatting::price($current_balance);
    }
}
