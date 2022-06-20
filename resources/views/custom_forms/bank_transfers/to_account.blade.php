<div id="invoice_payment">
@if($url == "create")
<select class="form-control select2" name="from_account" id="from_account" required>
    <option value="" selected disabled>--Select Account--</option>
    @foreach($bank_accounts as $account)
        <option value="{{$account->id}}">{{$account->holder_name." - ".$account->bank_name}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select class="form-control select2" name="from_account" id="from_account" required>
    @foreach($bank_accounts as $account)
        <option @if($dataTypeContent->from_account == $account->id) selected @endif value="{{$account->id}}">{{$account->holder_name." - ".$account->bank_name}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$data->account_to->holder_name." - ".$data->account_to->bank_name}}
    @else
        {{$dataTypeContent->account_to->holder_name." - ".$dataTypeContent->account_to->bank_name}}
    @endif
@endif
</div>