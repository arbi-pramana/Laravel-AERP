<div id="invoice_payment">
@if($url == "create")
<select class="form-control select2" name="to_account" id="to_account" required>
    <option value="" selected disabled>--Select Account--</option>
    @foreach($bank_accounts as $account)
        <option value="{{$account->id}}">{{$account->holder_name." - ".$account->bank_name}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select class="form-control select2" name="to_account" id="to_account" required>
    @foreach($bank_accounts as $account)
        <option @if($dataTypeContent->to_account == $account->id) selected @endif value="{{$account->id}}">{{$account->holder_name." - ".$account->bank_name}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$data->account_from->holder_name." - ".$data->account_from->bank_name}}
    @else
        {{$dataTypeContent->account_from->holder_name." - ".$dataTypeContent->account_from->bank_name}}
    @endif
@endif
</div>