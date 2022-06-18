@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$bill_prefix = App\Models\Setting::where('key','system-setting.bill_prefix')->first()->value ?? '';
$bill = App\Models\Bill::find(request('bill_id'));
@endphp

<div id="invoice_payment">
@if($url == "create")
<input type="text" class="form-control" value="{{$bill_prefix.str_pad($bill->id,5,0,STR_PAD_LEFT)}}" readonly>
<input type="hidden" name="bill_id" value="{{$bill->id}}">
@elseif($url == "edit")
<input type="text" class="form-control" value="{{$bill_prefix.str_pad($bill->id,5,0,STR_PAD_LEFT)}}" readonly>
<input type="hidden" name="bill_id" value="{{$bill->id}}">
@else
@endif
</div>