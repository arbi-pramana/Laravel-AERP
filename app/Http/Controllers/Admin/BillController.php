<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Bill;
use App\Models\BillPayment;
use App\Models\BillProduct;
use App\Models\DebitNote;
use App\Models\Transaction;
use App\Utility\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BillController extends Controller
{
    public function json(Request $request)
    {
        if(!empty($request->id)){
            return Bill::with(['vendor','category'])->find($request->id);
        } else {
            return Bill::get();
        }
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $bill = new Bill;
            $bill->vendor_id = $request->vendor_id;
            $bill->bill_date = $request->bill_date;
            $bill->due_date = $request->due_date;
            $bill->category_id = $request->category_id;
            $bill->order_number = $request->order_number;
            $bill->shipping_display = $request->shipping_display;
            $bill->status = 0;
            $bill->created_by = $request->created_by;
            $bill->save();
            
            foreach($request->product_id as $i => $product){
                $bill_product = new BillProduct;
                $bill_product->bill_id = $bill->id;
                $bill_product->product_id = $request->product_id[$i];
                $bill_product->quantity = $request->quantity[$i];
                $bill_product->price = $request->price[$i];
                $bill_product->tax = $request->tax[$i];
                $bill_product->discount = $request->discount[$i];
                $bill_product->description = $request->description[$i];
                $bill_product->save();
            }
            DB::commit();
            return redirect('admin/bills')->with(
                [
                    'message'    => "Bill created successfully",
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
            $bill = Bill::find($id);
            $bill->vendor_id = $request->vendor_id;
            $bill->bill_date = $request->bill_date;
            $bill->due_date = $request->due_date;
            $bill->category_id = $request->category_id;
            $bill->order_number = $request->order_number;
            $bill->shipping_display = $request->shipping_display;
            $bill->status = 0;
            $bill->created_by = $request->created_by;
            $bill->save();
            
            $this->destroyProduct($bill->id);
            foreach($request->product_id as $i => $product){
                $bill_product = new BillProduct;
                $bill_product->bill_id = $bill->id;
                $bill_product->product_id = $request->product_id[$i];
                $bill_product->quantity = $request->quantity[$i];
                $bill_product->price = $request->price[$i];
                $bill_product->tax = $request->tax[$i];
                $bill_product->discount = $request->discount[$i];
                $bill_product->description = $request->description[$i];
                $bill_product->save();
            }
            DB::commit();
            return redirect('admin/bills')->with( [
                'message'    => "Bill updated successfully",
                'alert-type' => 'success',
            ]);
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
        }
    }

    public function updateStatus(Request $request, $id)
    {
        $bill = Bill::find($id);
        $bill->status = $request->status;
        $bill->save();

        return redirect('/admin/bills/'.$id)->with([
            'message'    => "Bill updated successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroy($id)
    {
        BillProduct::where('bill_id',$id)->delete();
        $bill_payments = BillPayment::where('bill_id',$id);
        if(!empty($bill_payments->get())){
            foreach ($bill_payments->get() as $invoice_payment) {
                Transaction::where('category','Purchase')->where('payment_id',$invoice_payment->id)->delete();
            }
        }
        $bill_payments->delete();
        DebitNote::where('bill_id',$id)->delete();
        Bill::find($id)->delete();
        return redirect('/admin/bills')->with([
            'message'    => "Bill deleted successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroyProduct($id)
    {
        BillProduct::where('bill_id',$id)->delete();
    }

    public function destroyDebitNote($id)
    {
        $debit_note = DebitNote::find($id);
        $debit_note->delete();
        Status::purchaseBill($debit_note->bill_id);
        return redirect()->back()->with([
            'message'    => "Debit note deleted successfully",
            'alert-type' => 'success',
        ]);
    }
}
