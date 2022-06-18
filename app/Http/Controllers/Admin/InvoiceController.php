<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CreditNote;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\InvoiceProduct;
use App\Models\Transaction;
use App\Utility\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InvoiceController extends Controller
{
    public function json(Request $request)
    {
        if(!empty($request->id)){
            return Invoice::with(['customer','category'])->find($request->id);
        } else {
            return Invoice::get();
        }
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $invoice = new Invoice;
            $invoice->customer_id = $request->customer_id;
            $invoice->issue_date = $request->issue_date;
            $invoice->due_date = $request->due_date;
            $invoice->category_id = $request->category_id;
            $invoice->ref_number = $request->ref_number;
            $invoice->shipping_display = $request->shipping_display;
            $invoice->status = 0;
            $invoice->created_by = $request->created_by;
            $invoice->save();
            
            foreach($request->product_id as $i => $product){
                $invoice_product = new InvoiceProduct;
                $invoice_product->invoice_id = $invoice->id;
                $invoice_product->product_id = $request->product_id[$i];
                $invoice_product->quantity = $request->quantity[$i];
                $invoice_product->price = $request->price[$i];
                $invoice_product->tax = $request->tax[$i];
                $invoice_product->discount = $request->discount[$i];
                $invoice_product->description = $request->description[$i];
                $invoice_product->save();
            }
            DB::commit();
            return redirect('admin/invoices')->with(
                [
                    'message'    => "Invoice created successfully",
                    'alert-type' => 'success',
                ]
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
        }
    }

    public function update(Request $request,$id)
    {
        DB::beginTransaction();
        try {
            $invoice = Invoice::find($id);
            $invoice->customer_id = $request->customer_id;
            $invoice->issue_date = $request->issue_date;
            $invoice->due_date = $request->due_date;
            $invoice->category_id = $request->category_id;
            $invoice->ref_number = $request->ref_number;
            $invoice->shipping_display = $request->shipping_display;
            $invoice->status = 0;
            $invoice->created_by = $request->created_by;
            $invoice->save();
            
            $this->destroyProduct($invoice->id);
            foreach($request->product_id as $i => $product){
                $invoice_product = new InvoiceProduct;
                $invoice_product->invoice_id = $invoice->id;
                $invoice_product->product_id = $request->product_id[$i];
                $invoice_product->quantity = $request->quantity[$i];
                $invoice_product->price = $request->price[$i];
                $invoice_product->tax = $request->tax[$i];
                $invoice_product->discount = $request->discount[$i];
                $invoice_product->description = $request->description[$i];
                $invoice_product->save();
            }
            DB::commit();
            return redirect('admin/invoices')->with( [
                'message'    => "Invoice updated successfully",
                'alert-type' => 'success',
            ]);
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
        }
    }

    public function updateStatus(Request $request, $id)
    {
        $invoice = Invoice::find($id);
        $invoice->status = $request->status;
        $invoice->save();

        return redirect('/admin/invoices/'.$id)->with([
            'message'    => "Invoice updated successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroy($id)
    {
        InvoiceProduct::where('invoice_id',$id)->delete();
        $invoice_payments = InvoicePayment::where('invoice_id',$id);
        if(!empty($invoice_payments->get())){
            foreach ($invoice_payments->get() as $invoice_payment) {
                Transaction::where('category','Invoice')->where('payment_id',$invoice_payment->id)->delete();
            }
        }
        $invoice_payments->delete();
        CreditNote::where('invoice_id',$id)->delete();
        Invoice::find($id)->delete();
        return redirect('/admin/invoices')->with([
            'message'    => "Invoice deleted successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroyProduct($id)
    {
        InvoiceProduct::where('invoice_id',$id)->delete();
    }

    public function destroyCreditNote($id)
    {
        $credit_note = CreditNote::find($id);
        $credit_note->delete();
        Status::salesInvoice($credit_note->invoice_id);
        return redirect()->back()->with([
            'message'    => "Credit note deleted successfully",
            'alert-type' => 'success',
        ]);
    }

}
