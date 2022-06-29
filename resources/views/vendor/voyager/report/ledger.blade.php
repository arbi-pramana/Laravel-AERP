@extends('voyager::master')

@section('css')
@stop

@section('page_title',"Ledger Summary Report")

@section('page_header')
    <h1 class="page-title">
        Ledger Summary
    </h1>
@stop

@section('content')
<div class="page-content edit-add container-fluid">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <form action="" method="get">
                    @csrf
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <label><b>Start Date</b></label><br>
                            <input type="date" name="start_date" class="form-control" value="{{request('start_date')}}" required>
                        </div>
                        <div class="col-md-3">
                            <label><b>End Date</b></label><br>
                            <input type="date" name="end_date" class="form-control" value="{{request('end_date')}}" required>
                        </div>
                        <div class="col-md-3">
                            <label><b>Account</b></label><br>
                            <select name="account" class="form-control select2" required>
                                @foreach($accounts as $account)
                                <option @if($account->id == request('account')) selected @endif value="{{$account->id}}">{{$account->code." - ".$account->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label><b>&nbsp;</b></label><br>
                            <button class="btn btn-primary"><i class="voyager-search"></i> Filter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <label><b>Report : </b></label><br>
                    Ledger Summary
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <label><b>Duration</b></label><br>
                    @if(request('start_date') || request('end_date'))
                        {{ App\Utility\Formatting::date(request('start_date')) }} - {{ App\Utility\Formatting::date(request('end_date')) }}
                    @else
                        -
                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <label><b>Account : </b></label><br>
                    @if(!empty($selected_account))
                        {{$selected_account->code." - ".$selected_account->name}}
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <label><b>Total Debit : </b></label><br>
                    @if(!empty($total_debit))
                        {{App\Utility\Formatting::price($total_debit)}}
                    @else
                        {{App\Utility\Formatting::price(0)}}
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <label><b>Total Credit : </b></label><br>
                    @if(!empty($total_credit))
                        {{App\Utility\Formatting::price($total_credit)}}
                    @else
                        {{App\Utility\Formatting::price(0)}}
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <label><b>Balance : </b></label><br>
                    @if(!empty($total_balance))
                        {{App\Utility\Formatting::price($total_balance)}}
                    @else
                        {{App\Utility\Formatting::price(0)}}
                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <table class="table table-hover table-striped">
                        <thead>
                            <th>#</th>
                            <th>Transaction Date</th>
                            <th>Create At</th>
                            <th>Description</th>
                            <th>Debit</th>
                            <th>Credit</th>
                            <th>Balance</th>
                        </thead>
                        <tbody>
                            @if(!empty($journal_items))
                                @foreach($journal_items as $journal_item)
                                    <tr>
                                        <td>{{setting('system-setting.journal_prefix').str_pad($journal_item->journal_id,5,0,STR_PAD_LEFT)}}</td>
                                        <td>{{$journal_item->date}}</td>
                                        <td>{{$journal_item->created_at}}</td>
                                        <td>{{$journal_item->descriptions}}</td>
                                        <td>{{App\Utility\Formatting::price($journal_item->debit)}}</td>
                                        <td>{{App\Utility\Formatting::price($journal_item->credit)}}</td>
                                        <td>{{App\Utility\Formatting::price(abs($journal_item->debit-$journal_item->credit))}}</td>
                                    </tr>
                                @endforeach
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('javascript')
    <script>
    </script>
@stop
