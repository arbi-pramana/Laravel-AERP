@extends('voyager::master')

@section('css')
@stop

@section('page_title',"")

@section('page_header')
    <h1 class="page-title">
        Balance Sheet
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
                        <div class="col-md-4">
                            <label><b>Start Date</b></label><br>
                            <input type="date" name="start_date" class="form-control" value="{{request('start_date')}}" required>
                        </div>
                        <div class="col-md-4">
                            <label><b>End Date</b></label><br>
                            <input type="date" name="end_date" class="form-control" value="{{request('end_date')}}" required>
                        </div>
                        <div class="col-md-4">
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
                    <b>Balance Sheet</b>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <label><b>Duration :</b></label><br>
                    @if(!empty(request('start_date')) && !empty(request('end_date')))
                        <b>{{App\Utility\Formatting::date(request('start_date'))." - ".App\Utility\Formatting::date(request('end_date'))}}</b>
                    @else
                        <b>-</b>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <b>Total Assets :</b> <br>
                    <b> - </b>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <b>Total Liablities :</b> <br>
                    <b> - </b>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <b>Total Expenses :</b> <br>
                    <b> - </b>
                </div>
            </div>
            <br>
            <div class="card">
                <div class="card-body">
                    <b>Total Income :</b> <br>
                    <b> - </b>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <b>Total Equity :</b> <br>
                    <b> - </b>
                </div>
            </div>
        </div>
    </div>
    @foreach($chart_of_accounts->groupBy('type') as $chart_of_account)
        <div class="row">
            <div class="col-md-12">
                <h3>{{$chart_of_account[0]->ChartOfAccountType->name}}</h3> <br>
            </div>
            @foreach($chart_of_account->groupBy('sub_type') as $accounts)
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4>{{$accounts[0]->ChartOfAccountSubType->name}}</h4> <br>
                            <table class="table table-striped">
                                <thead>
                                    <th>Account</th>
                                    <th>Amount</th>
                                </thead>
                                <tbody>
                                    @foreach($accounts as $account)
                                    <tr>
                                        <td>{{$account->name}}</td>
                                        <td>{{$account->journals}}</td>
                                    </tr>
                                    @endforeach
                                    <tr>
                                        <td><b>Total {{$accounts[0]->ChartOfAccountSubType->name}}</b></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endforeach
</div>
@stop