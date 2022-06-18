@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$types = App\Models\ChartOfAccountType::all(); 
@endphp

@if($url == "create")
<select name="sub_type" class="form-control select2" id="sub_type" required></select>
@elseif($url == "edit")
<select name="sub_type" class="form-control select2" id="sub_type" required>
    <option value="{{$dataTypeContent->sub_type}}">{{$dataTypeContent->ChartOfAccountSubType->name}}</option>
</select>
@else
    @if(!empty($data))
        {{$data->ChartOfAccountSubType->name}}
    @else
        {{$dataTypeContent->ChartOfAccountSubType->name}}
    @endif
@endif
<script>
    document.addEventListener('DOMContentLoaded', function() {
        changeType();
    });
    function changeType(){
       $.ajax({
            url: "{{url('admin/chart-of-accounts/sub-type.json?type=')}}"+$('#type').val(),
            type: "GET",
            success: function(res){
                $('#sub_type').html('')
                $.each(res, function (i, item) {
                    $('#sub_type').append($('<option>', { 
                        value: item.id,
                        text : item.name 
                    }));
                });
            }, error: function(err){
                console.log(err);
            }
        });
    }
</script>