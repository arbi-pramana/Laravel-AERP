@if(!empty($data))
{{App\Utility\Formatting::price($data->journalItems->sum('debit'))}}
@else
{{App\Utility\Formatting::price($dataTypeContent->journalItems->sum('debit'))}}
@endif