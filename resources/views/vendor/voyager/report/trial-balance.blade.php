@extends('voyager::master')

@section('css')
@stop

@section('page_title',"Trial Balance Summary Report")

@section('page_header')
    <h1 class="page-title">
        Trial Balance Summary
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
                    <b>Trial Balance Summary</b>
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
</div>
@stop