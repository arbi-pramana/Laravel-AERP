@if($url == "create")
    <input type="number" name="amount" class="form-control" required>
@elseif($url == "edit")
    <input type="number" name="amount" class="form-control" value="{{$dataTypeContent->amount}}">
@else
    @if(!empty($data))
        {{App\Utility\Formatting::price($data->amount)}}
    @else
        {{App\Utility\Formatting::price($dataTypeContent->amount)}}
    @endif
@endif