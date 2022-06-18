<?php

namespace App\Models;

use App\Utility\Formatting;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    public function customer()
    {
        return $this->belongsTo(Customer::class,"customer_id","id");
    }

    public function category()
    {
        return $this->belongsTo(Category::class,"category_id","id");
    }

    public function due_amount()
    {
        $invoice_products = InvoiceProduct::where('invoice_id',$this->id)->get();
        foreach($invoice_products as $invoice_product){
            $subtotals[] = $invoice_product->quantity*$invoice_product->price+((($invoice_product->quantity*$invoice_product->price)*$invoice_product->tax)/100)-$invoice_product->discount;
        }
        $payment = InvoicePayment::where('invoice_id',$this->id)->sum('amount');
        $credit_note = CreditNote::where('invoice_id',$this->id)->sum('amount');
        $due_amount = array_sum($subtotals)-$payment-$credit_note;
        return Formatting::price($due_amount);
    }
}
