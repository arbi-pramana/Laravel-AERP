<?php 
namespace App\Utility;

use App\Models\Bill;
use App\Models\BillPayment;
use App\Models\BillProduct;
use App\Models\CreditNote;
use App\Models\DebitNote;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\InvoiceProduct;

class Status{
    function salesInvoice($id){
        $payment = InvoicePayment::where('invoice_id',$id)->sum('amount');
        $credit_note = CreditNote::where('invoice_id',$id)->sum('amount');
        $totalPayment = $payment+$credit_note;

        $invoice_products = InvoiceProduct::where('invoice_id',$id)->get();
        foreach($invoice_products as $invoice_product){
            $total_price = $invoice_product->quantity*$invoice_product->price;
            $total_discount = $invoice_product->sum('discount');
            $total_tax = ($total_price*$invoice_product->tax)/100;
            $subtotals[] = $total_price-$total_discount+$total_tax;
        }
        $totalInvoice = array_sum($subtotals);

        if($totalPayment >= $totalInvoice){
            $invoice = Invoice::find($id);
            $invoice->status = 3;
            $invoice->save();
        } elseif($totalPayment == 0) {
            $invoice = Invoice::find($id);
            $invoice->status = 1;
            $invoice->save();
        } else {
            $invoice = Invoice::find($id);
            $invoice->status = 2;
            $invoice->save();
        }
    }

    function purchaseBill($id){
        $payment = BillPayment::where('bill_id',$id)->sum('amount');
        $debit_note = DebitNote::where('bill_id',$id)->sum('amount');
        $totalPayment = $payment+$debit_note;

        $bill_products = BillProduct::where('bill_id',$id)->get();
        foreach($bill_products as $bill_product){
            $total_price = $bill_product->quantity*$bill_product->price;
            $total_discount = $bill_product->sum('discount');
            $total_tax = ($total_price*$bill_product->tax)/100;
            $subtotals[] = $total_price-$total_discount+$total_tax;
        }
        $totalBill = array_sum($subtotals);
        if($totalPayment >= $totalBill){
            $bill = Bill::find($id);
            $bill->status = 3;
            $bill->save();
        } elseif($totalPayment == 0) {
            $bill = Bill::find($id);
            $bill->status = 1;
            $bill->save();
        } else {
            $bill = Bill::find($id);
            $bill->status = 2;
            $bill->save();
        }
    }
}