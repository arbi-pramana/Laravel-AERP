<div id="invoice_payment">
@if($url == "create")
<select class="form-control select2" name="account_id" id="account_id" required>
    <option value="" selected disabled>--Select Account--</option>
    @foreach($bank_accounts as $account)
        <option value="{{$account->id}}">{{$account->bank_name}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select class="form-control select2" name="account_id" id="account_id" required>
    @foreach($bank_accounts as $account)
        <option @if($dataTypeContent->account_id == $account->id) selected @endif value="{{$account->id}}">{{$account->bank_name}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$data->account->bank_name}}
    @else
        {{$dataTypeContent->account->bank_name}}
    @endif
@endif
</div>