@if($url == "create")
<select name="category_id" class="form-control select2" required>
    @foreach($categories as $category)
        <option value="{{$category->id}}">{{$category->name}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select name="category_id" class="form-control select2" required>
    @foreach($categories as $category)
        <option @if($category->id == $dataTypeContent->id) selected="selected" @endif value="{{$category->id}}">{{$category->name}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$data->category->name}}
    @else
        {{$dataTypeContent->category->name}}
    @endif
@endif