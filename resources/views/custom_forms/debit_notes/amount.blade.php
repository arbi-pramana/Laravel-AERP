@php
use App\Utility\Formatting;
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$inv_prefix = App\Models\Setting::where('key','system-setting.invoice_prefix')->first()->value ?? '';
$credit_note = App\Models\CreditNote::with('invoice')->find($id);
$invoices = App\Models\Invoice::get();
@endphp

@if($url == "create")
    <input type="number" name="amount" class="form-control" required>
@elseif($url == "edit")
    <input type="number" name="amount" class="form-control" value="{{$dataTypeContent->amount}}">
@else
    @if(!empty($data))
        {{Formatting::price($data->amount)}}
    @else
        {{Formatting::price($dataTypeContent->amount)}}
    @endif
@endif