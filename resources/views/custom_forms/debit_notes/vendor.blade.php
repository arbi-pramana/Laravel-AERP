@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$debit_note = App\Models\DebitNote::with('vendor')->find($id);
@endphp

<div id="vendor_id">
@if($url == "create")
@elseif($url == "edit")
<input type="text" name="vendor_id" class="form-control" value="{{$debit_note->vendor->name}}" readonly> 
<input type="hidden" name="vendor_id" value="{{$debit_note->vendor_id}}">
@else
    @if(!empty($data))
        {{$data->vendor->name}}
    @else
        {{$debit_note->vendor->name}}
    @endif
@endif
</div>

<script>
    function changeBill(){
        $.ajax({
            url: "{{url('admin/bills.json?id=')}}"+$('#bill_id').val(),
            type: 'GET',
            success: function(res) {
                $("#vendor_id").html("")
                $("#vendor_id").html(`
                    <input type="text" name="vendor_id" class="form-control" value="`+res.vendor.name+`" readonly> 
                    <input type="hidden" name="vendor_id" value="`+res.vendor.id+`">
                `)
            },
            error: function(err) {
                console.log(err);
            }
        });
    }
</script>