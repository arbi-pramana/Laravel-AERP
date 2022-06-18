@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$types = App\Models\ChartOfAccountType::all(); 
@endphp

@if($url == "create")
<div id="create">
    <select name="type" id="type" class="form-control select2" onchange="changeType()" required>
        <option value="" selected disabled>--Select Type--</option>
        @foreach($types as $type)
            <option value="{{ $type->id }}">{{ $type->name }}</option>
        @endforeach
    </select>
</div>
@elseif($url == "edit")
<div id="edit">
    <select name="type" id="type" class="form-control select2" onchange="changeType()" required>
        <option value="" selected disabled>--Select Type--</option>
        @foreach($types as $type)
            <option @if($dataTypeContent->type == $type->id) selected @endif value="{{ $type->id }}">{{ $type->name }}</option>
        @endforeach
    </select>
</div>
@else
    @if(!empty($data))
        {{$data->ChartOfAccountType->name}}
    @else
        {{$dataTypeContent->ChartOfAccountType->name}}
    @endif
@endif
