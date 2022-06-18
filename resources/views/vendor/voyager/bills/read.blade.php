@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;
        @if($bill->status==0)
        <a href="{{url('admin/bills/'.$bill->id.'/update-status?status=1')}}" class="btn btn-success" style="margin-right:20px;padding:7px">
            <i class="glyphicon glyphicon-check"></i> <span>Sent</span>
        </a>
        @elseif($bill->status==1)
        <a href="{{url('admin/bills/'.$bill->id.'/update-status?status=0')}}" class="btn btn-warning" style="padding:7px">
            <i class="voyager-alarm-clock"></i> <span>Draft</span>
        </a>
        @else
        @endif
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
                <div class="col-md-6">
                   <div class="row">
                    <div class="col-md-6">
                        <b>Billed To</b> <br>
                        {{$bill->vendor->name}} <br>
                        {{$bill->vendor->contact}} <br>
                        {{$bill->vendor->billing_country}} <br>
                        {{$bill->vendor->billing_zip}} <br>
                        {{$bill->vendor->billing_address}} <br>
                        <br><br>
                        <b>Status : </b> <br>
                        @if($bill->status == 3)
                            <span class="badge badge-success">Paid</span>
                        @elseif($bill->status == 2)
                        <span class="badge badge-primary">Partially Paid</span>
                        @elseif($bill->status == 1)
                            <span class="badge badge-info">Sent</span>
                        @else
                            <span class="badge badge-danger">Draft</span>
                        @endif
                    </div>
                    @if($bill->shipping_display == 1)
                        <div class="col-md-6">
                            <b>Shipped To</b> <br>
                            {{$bill->vendor->shipping_name}} <br>
                            {{$bill->vendor->shipping_phone}} <br>
                            {{$bill->vendor->shipping_country}} <br>
                            {{$bill->vendor->shipping_zip}} <br>
                            {{$bill->vendor->shipping_address}} <br>
                        </div>
                    @endif
                   </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <b> Issue Date </b><br>
                            {{App\Utility\Formatting::date($bill->issue_date)}}
                        </div>
                        <div class="col-md-6">
                            <b> Due Date </b><br>
                            {{App\Utility\Formatting::date($bill->due_date)}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <b> Invoice Number </b><br>
                            {{$bill_prefix.str_pad($bill->id,5,0,STR_PAD_LEFT)}}
                        </div>
                        <div class="col-md-6">
                            <b> Category </b><br>
                            {{$bill->category->name}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <b> Ref Number </b><br>
                            {{$bill->ref_number}}
                        </div>
                    </div>
                </div>        
            </div>
        </div>
        <input type="hidden" name="created_by" value="{{ Auth::id() }}">
    </div>
    <h4 style="margin-top:30px;">Product & Services</h4>
    <div class="card">
        <div class="card-body">
            <table class="table table-striped table-hover">
                <thead>
                    <th>ITEMS</th>
                    <th>QUANTITY</th>
                    <th>PRICE</th>
                    <th>TAX(%)</th>
                    <th>DISCOUNT</th>
                    <th>AMOUNT</th>
                </thead>
                <tbody id="appendTr">
                    @foreach($bill_products as $i => $bill_product)
                    @php
                        $amount = ($bill_product->quantity*$bill_product->price) + ((($bill_product->quantity*$bill_product->price)*$bill_product->tax)/100) - $bill_product->discount;
                        $tax[] = (($bill_product->quantity*$bill_product->price)*$bill_product->tax)/100;
                        $amounts[] = ($bill_product->quantity*$bill_product->price) + ((($bill_product->quantity*$bill_product->price)*$bill_product->tax)/100) - $bill_product->discount;
                        $subtotals[] = $bill_product->quantity*$bill_product->price;
                    @endphp
                    <tr id="tr_{{$i}}">
                        <td>
                            {{$bill_product->product->name}}
                        </td>
                        <td>
                            {{$bill_product->quantity}}
                        </td>
                        <td>
                            {{App\Utility\Formatting::price($bill_product->price)}}
                        </td>
                        <td>
                            {{$bill_product->tax}}
                        </td>
                        <td>
                            {{App\Utility\Formatting::price($bill_product->discount)}}
                        </td>
                        <td>
                            {{App\Utility\Formatting::price($amount)}}
                            <input type="hidden" class="taxes" id="tax_total_{{$i}}" value="{{$tax[$i]}}">
                            <input type="hidden" class="subtotals" id="subtotal_{{$i}}" value="{{$subtotals[$i]}}">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td id="trtextarea_{{$i}}" colspan="2">
                            <textarea name="description[]" id="description_{{$i}}" class="form-control" cols="30" rows="2" readonly>{{$bill_product->description}}</textarea>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tbody>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Sub Total</b></td>
                        <td>
                            {{App\Utility\Formatting::price(array_sum($subtotals))}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Discount</b></td>
                        <td>
                            {{App\Utility\Formatting::price($bill_products->sum('discount'))}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Tax</b></td>
                        <td>
                            {{App\Utility\Formatting::price(array_sum($tax))}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Paid</b></td>
                        <td>
                            {{App\Utility\Formatting::price($bill_payments->sum('amount'))}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Debit Note</b></td>
                        <td>
                            {{App\Utility\Formatting::price($debit_notes->sum('amount'))}}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><b>Total Amount</b></td>
                        <td>
                            {{App\Utility\Formatting::price(array_sum($amounts)-$debit_notes->sum('amount')-$bill_payments->sum('amount'))}}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h4 style="margin-top:30px;">Payment Summary <a href="{{url('admin/bill-payments/create?bill_id='.$bill->id)}}" class="btn btn-sm btn-success" style="float:right;" target="_blank"><i class="voyager-plus"></i> Make Payment</a></h4>
        </div>
    </div>
    <div class="card">
        <div class="card-body" style="overflow-x:scroll;">
            <table class="table table-hover table-striped">
                <thead>
                    <th> Payment Receipt </th>
                    <th> Date </th>
                    <th> Amount </th>
                    <th> Account </th>
                    <th> Reference </th>
                    <th> Description </th>
                    <th></th>
                </thead>
                <tbody>
                    @foreach($bill_payments as $bill_payment)
                    <tr>
                        @php
                            $receipt = json_decode($bill_payment->add_receipt);
                        @endphp
                        <td>
                            @if(!empty($receipt))
                                <a href="{{url('storage/'.$receipt[0]->download_link)}}" download>{{$receipt[0]->original_name}}</a>
                            @endif
                        </td>
                        <td>{{App\Utility\Formatting::date($bill_payment->date)}}</td>
                        <td>{{App\Utility\Formatting::price($bill_payment->amount)}}</td>
                        <td>{{$bill_payment->account->bank_name}}</td>
                        <td>{{$bill_payment->reference}}</td>
                        <td>{{$bill_payment->description}}</td>
                        <td><a class="btn btn-sm btn-danger" onclick="deletePayment('{{$bill_payment->id}}')" data-id="{{$bill_payment->id}}"><i class="voyager-trash"></i> </label></td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h4 style="margin-top:30px;">Debit Note Summary <a href="{{url('admin/debit-notes/create')}}" class="btn btn-sm btn-success" style="float:right;" target="_blank"><i class="voyager-plus"></i> Add Debit Note</a></h4>
        </div>
    </div>
    <div class="card">
        <div class="card-body" style="overflow-x:scroll;">
            <table class="table table-hover table-striped">
                <thead>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Description</th>
                    <th></th>
                </thead>
                <tbody>
                    @foreach($debit_notes as $debit_note)
                    <tr>
                        <td>{{App\Utility\Formatting::date($debit_note->date)}}</td>
                        <td>{{App\Utility\Formatting::price($debit_note->amount)}}</td>
                        <td>{{$debit_note->description}}</td>
                        <td>
                            <a href="{{url('admin/debit-notes/'.$debit_note->id.'/edit')}}" class="btn btn-sm btn-primary" target="_blank"><i class="voyager-edit"></i></a>
                            <a class="btn btn-sm btn-danger" onclick="deleteDebitNote('{{$debit_note->id}}')" data-id="{{$debit_note->id}}"><i class="voyager-trash"></i></a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
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

    <div class="modal modal-danger fade" tabindex="-1" id="delete_debit_note_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i>  Are you sure you want to delete this Debit note ?</h4>
                </div>
                <div class="modal-footer">
                    <form action="" id="delete_debit_note" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="Delete Debit Note">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal modal-danger fade" tabindex="-1" id="delete_payment_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i>  Are you sure you want to delete this Payment ?</h4>
                </div>
                <div class="modal-footer">
                    <form action="" id="delete_payment" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="Delete Payment">
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
    <script>
        function deleteDebitNote(id){
            $("#delete_debit_note_modal").modal('show');
            $("#delete_debit_note").attr('action', "{{url('admin/bills')}}"+"/"+id+"/debit-note");
        }
    </script>

<script>
        function deletePayment(id){
            $("#delete_payment_modal").modal('show');
            $("#delete_payment").attr('action', "{{url('admin/bill-payments')}}"+"/"+id+"?bill_id="+'{{$bill->id}}');
        }
    </script>
@stop
