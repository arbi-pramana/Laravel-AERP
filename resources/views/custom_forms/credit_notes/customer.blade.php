@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
$credit_note = App\Models\CreditNote::with('customer')->find($id);
@endphp

<div id="customer_id">
@if($url == "create")
@elseif($url == "edit")
<input type="text" name="customer_id" class="form-control" value="{{$credit_note->customer->name}}" readonly> 
<input type="hidden" name="customer_id" value="{{$credit_note->customer_id}}">
@else
    @if(!empty($data))
        {{$data->customer->name}}
    @else
        {{$credit_note->customer->name}}
    @endif
@endif
</div>

<script>
    function changeInvoice(){
        $.ajax({
            url: "{{url('admin/invoices.json?id=')}}"+$('#invoice_id').val(),
            type: 'GET',
            success: function(res) {
                $("#customer_id").html("")
                $("#customer_id").html(`
                    <input type="text" name="customer_id" class="form-control" value="`+res.customer.name+`" readonly> 
                    <input type="hidden" name="customer_id" value="`+res.customer.id+`">
                `)
            },
            error: function(err) {
                console.log(err);
            }
        });
    }
</script>