@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('edit', $dataTypeContent)
            <a href="{{ route('voyager.'.$dataType->slug.'.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
                <i class="glyphicon glyphicon-pencil"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.edit') }}</span>
            </a>
        @endcan
        @can('delete', $dataTypeContent)
            @if($isSoftDeleted)
                <a href="{{ route('voyager.'.$dataType->slug.'.restore', $dataTypeContent->getKey()) }}" title="{{ __('voyager::generic.restore') }}" class="btn btn-default restore" data-id="{{ $dataTypeContent->getKey() }}" id="restore-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.restore') }}</span>
                </a>
            @else
                <a href="javascript:;" title="{{ __('voyager::generic.delete') }}" class="btn btn-danger delete" data-id="{{ $dataTypeContent->getKey() }}" id="delete-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.delete') }}</span>
                </a>
            @endif
        @endcan
        @can('browse', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <i class="glyphicon glyphicon-list"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.return_to_list') }}</span>
        </a>
        @endcan
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
<div class="page-content edit-add container-fluid">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label for="">Journal Number</label>
                    <input type="text" class="form-control" value="{{setting('system-setting.journal_prefix').str_pad($dataTypeContent->id,5,'0',STR_PAD_LEFT)}}" readonly>
                </div>
                <div class="col-md-4">
                    <label for="">Date</label>
                    <input type="date" name="date" class="form-control" value="{{$dataTypeContent->date}}" readonly>
                </div>
                <div class="col-md-4">
                    <label for="">Reference</label>
                    <input type="text" name="reference" class="form-control" value="{{$dataTypeContent->reference}}" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <label for="">Description</label>
                    <textarea name="descriptions" class="form-control" readonly>{{$dataTypeContent->descriptions}}</textarea>
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
                    </thead>
                    <tbody id="trAppend">
                        @foreach($journal_items as $i => $journal_item)
                        <tr id="tr_{{$i}}">
                            <td>
                                {{$journal_item->chartOfAccount->code." - ".$journal_item->chartOfAccount->name}}
                            </td>
                            <td> <input type="number" name="debit[]" class="form-control debit" onkeyup="debitChange()" value="{{$journal_item->debit}}" readonly> </td>
                            <td> <input type="number" name="credit[]" class="form-control credit" onkeyup="creditChange()" value="{{$journal_item->credit}}" readonly> </td>
                            <td> <input type="text" name="description[]" class="form-control" value="{{$journal_item->description}}" readonly> </td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tbody>
                        <tr>
                            <td colspan="2"></td>
                            <td>Total Credit</td>
                            <td id="totalCredit">{{App\Utility\Formatting::price($journal_items->sum('credit'))}}</td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td>Total Debit</td>
                            <td id="totalDebit">{{App\Utility\Formatting::price($journal_items->sum('debit'))}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('javascript')
    @if ($isModelTranslatable)
        <script>
            $(document).ready(function () {
                $('.side-body').multilingual();
            });
        </script>
    @endif
    <script>
        var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });

    </script>
@stop
