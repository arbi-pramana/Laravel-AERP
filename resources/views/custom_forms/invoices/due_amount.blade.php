@php
$url = request()->segment(count(request()->segments()));
$id = request()->segment(3);
@endphp

<div id="invoice_payment">
@if($url == "create")
@elseif($url == "edit")
@else
    @if(!empty($data))
        {{$data->due_amount()}}
        <script>
            document.getElementById("bulk_delete_btn").style.visibility = "hidden";
        </script>
    @else
    @endif
@endif
</div>