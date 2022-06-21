<div class="page-content edit-add container-fluid">
    <form action="{{route('voyager.journal-entries.store')}}" method="post">
        @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label for="">Journal Number</label>
                        <input type="text" class="form-control" value="{{$c_journal}}" readonly>
                    </div>
                    <div class="col-md-4">
                        <label for="">Date</label>
                        <input type="date" name="date" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label for="">Reference</label>
                        <input type="text" name="reference" class="form-control" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label for="">Description</label>
                        <textarea name="descriptions" class="form-control" required></textarea>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="card">
            <div class="card-body">
                <label class="btn btn-success" style="float:right" onclick="addAccount()"> + Add Account </label>
                <div class="row" style="margin-top:60px">
                    <table class="table table-hover table-striped">
                        <thead>
                            <th>Account</th>
                            <th>Debit</th>
                            <th>Credit</th>
                            <th>Description</th>
                            <th></th>
                        </thead>
                        <tbody id="trAppend">
                            <tr id="tr_0">
                                <td>
                                    <select name="account[]" class="form-control select2" style="width:500px" required>
                                        @foreach($accounts as $account)
                                            <option value="{{ $account->id }}">{{ $account->code." - ".$account->name }}</option>
                                        @endforeach
                                    </select>
                                </td>
                                <td> <input type="number" name="debit[]" class="form-control debit" onkeyup="debitChange()" value="0" required> </td>
                                <td> <input type="number" name="credit[]" class="form-control credit" onkeyup="creditChange()" value="0" required> </td>
                                <td> <input type="text" name="description[]" class="form-control" required> </td>
                                <td> </td>
                            </tr>
                        </tbody>
                        <tbody>
                            <tr>
                                <td colspan="3"></td>
                                <td>Total Credit</td>
                                <td id="totalCredit">0</td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td>Total Debit</td>
                                <td id="totalDebit">0</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card-footer" style="margin-top:20px;float:right">
            <a href="{{url('admin/journal-entries')}}" class="btn btn-default">Cancel</a>
            <button type="submit" class="btn btn-primary">Create</button>
        </div>
    </form>
</div>

<script>
    function deleteTr(id){
        $('#tr_'+id).remove();
    }

    function addAccount(){
        var id = $('#trAppend tr').length;
        var html = '<tr id="tr_'+id+'">';
        html += '<td>';
        html += '<select name="account[]" class="form-control select2" style="width:500px" required>';
        @foreach($accounts as $account)
            html += '<option value="{{ $account->id }}">{{ $account->code." - ".$account->name }}</option>';
        @endforeach
        html += '</select>';
        html += '</td>';
        html += '<td> <input type="number" name="debit[]" class="form-control debit" onkeyup="debitChange()" value="0" required> </td>';
        html += '<td> <input type="number" name="credit[]" class="form-control credit" onkeyup="creditChange()" value="0" required> </td>';
        html += '<td> <input type="text" name="description[]" class="form-control" required> </td>';
        html += '<td> <label class="btn btn-sm btn-danger" onclick="deleteTr('+id+')"><i class="voyager-trash"></i> </label> </td>';
        html += '</tr>';
        $('#trAppend').append(html);
        $(".select2").select2();
    }

    function debitChange(){
        var totalDebit = 0;
        $('.debit').each(function(){
            var value = $(this).val();
            if(value != ''){
                totalDebit += parseFloat(value);
            }
        });
        $('#totalDebit').text(totalDebit);
    }

    function creditChange(){
        var totalCredit = 0;
        $('.credit').each(function(){
            var value = $(this).val();
            if(value != ''){
                totalCredit += parseFloat(value);
            }
        });
        $('#totalCredit').text(totalCredit);
    }
</script>