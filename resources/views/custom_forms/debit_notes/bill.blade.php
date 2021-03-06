@if($url == "create")
<select name="bill_id" id="bill_id" class="form-control select2" onchange="changeBill()" required>
    <option value="">--Select Bill--</option>
    @foreach($bills as $bill)
        <option value="{{$bill->id}}">{{$bill_prefix.str_pad($bill->id,5,0,STR_PAD_LEFT)}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select name="bill_id" id="bill_id" class="form-control select2" onchange="changeBill()" required>
    <option value="">--Select Bill--</option>
    @foreach($bills as $bill)
        <option @if($bill->id == $debit_note->bill_id) selected @endif value="{{$bill->id}}">{{$bill_prefix.str_pad($bill->id,5,0,STR_PAD_LEFT)}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$bill_prefix.str_pad($data->bill->id,5,0,STR_PAD_LEFT)}}
    @else
        {{$bill_prefix.str_pad($debit_note->bill->id,5,0,STR_PAD_LEFT)}}
    @endif
@endif