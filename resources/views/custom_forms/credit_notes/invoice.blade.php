@if($url == "create")
<select name="invoice_id" id="invoice_id" class="form-control select2" onchange="changeInvoice()" required>
    <option value="">--Select Invoice--</option>
    @foreach($invoices as $invoice)
        <option value="{{$invoice->id}}">{{$inv_prefix.str_pad($invoice->id,5,0,STR_PAD_LEFT)}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select name="invoice_id" id="invoice_id" class="form-control select2" onchange="changeInvoice()" required>
    <option value="">--Select Invoice--</option>
    @foreach($invoices as $invoice)
        <option @if($invoice->id == $credit_note->invoice_id) selected @endif value="{{$invoice->id}}">{{$inv_prefix.str_pad($invoice->id,5,0,STR_PAD_LEFT)}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$inv_prefix.str_pad($data->invoice->id,5,0,STR_PAD_LEFT)}}
    @else
        {{$inv_prefix.str_pad($credit_note->invoice->id,5,0,STR_PAD_LEFT)}}
    @endif
@endif