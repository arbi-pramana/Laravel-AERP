@if($url == "create")
    <input type="number" name="opening_balance" class="form-control" required>
@elseif($url == "edit")
    <input type="number" name="opening_balance" class="form-control" value="{{$dataTypeContent->opening_balance}}">
@else
    @if(!empty($data))
        {{App\Models\BankAccount::current_balance($data->id)}}
    @else
        {{App\Models\BankAccount::current_balance($dataTypeContent->id)}}
    @endif
@endif

<script>
    if(document.getElementById("current_balance") != null){
        document.getElementById("current_balance").getElementsByTagName("label")[0].innerHTML = "Opening Balance" 
    }
</script>