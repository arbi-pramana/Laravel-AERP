<?php
namespace App\Utility;

use App\Models\Transaction as ModelsTransaction;
use Illuminate\Support\Facades\Auth;

class Transaction{
    public function store($data = [])
    {
        $transaction = new ModelsTransaction;
        $transaction->user_id = $data['user_id']; 
        $transaction->user_type = $data['user_type']; 
        $transaction->account = $data['account']; 
        $transaction->type = $data['type']; 
        $transaction->amount = $data['amount']; 
        $transaction->description = $data['description']; 
        $transaction->date = $data['date']; 
        $transaction->created_by = Auth::user()->id; 
        $transaction->payment_id = $data['payment_id']; 
        $transaction->category = $data['category'];
        $transaction->save();
    }

    public function destroy($id,$category)
    {
        ModelsTransaction::where('payment_id',$id)
            ->where('category',$category)
            ->delete();
    }

    public function destroyRevenueOrPayment($id,$type)
    {
        ModelsTransaction::where('payment_id',$id)
            ->where('type',$type)
            ->delete();
    }
}