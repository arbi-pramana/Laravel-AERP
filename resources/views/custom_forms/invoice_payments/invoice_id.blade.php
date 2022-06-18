<div id="invoice_payment">
@if($url == "create")
<input type="text" class="form-control" value="{{$inv_prefix.str_pad($invoice->id,5,0,STR_PAD_LEFT)}}" readonly>
<input type="hidden" name="invoice_id" value="{{$invoice->id}}">
@elseif($url == "edit")
<input type="text" class="form-control" value="{{$inv_prefix.str_pad($invoice->id,5,0,STR_PAD_LEFT)}}" readonly>
<input type="hidden" name="invoice_id" value="{{$invoice->id}}">
@else
@endif
</div>