@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$bank_accounts = App\Models\BankAccount::get();
@endphp

<div id="invoice_payment">
@if($url == "create")
<select class="form-control select2" name="account_id" id="account_id" required>
    <option value="" selected disabled>--Select Account--</option>
    @foreach($bank_accounts as $account)
        <option value="{{$account->id}}">{{$account->bank_name}}</option>
    @endforeach
</select>
@endif
</div>