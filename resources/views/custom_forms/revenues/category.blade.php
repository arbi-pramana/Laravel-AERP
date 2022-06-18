@php
use App\Models\Category;
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$categories = Category::where('type',2)->get();
$categoryFind = Category::find($id);
@endphp

@if($url == "create")
<select name="category_id" class="form-control select2" required>
    @foreach($categories as $category)
        <option value="{{$category->id}}">{{$category->name}}</option>
    @endforeach
</select>
@elseif($url == "edit")
<select name="category_id" class="form-control select2" required>
    @foreach($categories as $category)
        <option @if($category->id == $categoryFind->id) selected="selected" @endif value="{{$category->id}}">{{$category->name}}</option>
    @endforeach
</select>
@else
    @if(!empty($data))
        {{$data->category->name}}
    @else
        {{$dataTypeContent->category->name}}
    @endif
@endif