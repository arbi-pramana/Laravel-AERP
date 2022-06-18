<div class="page-content edit-add container-fluid">
    <form action="store" method="post">
        @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <b>Vendor</b>
                        <select name="vendor_id" class="form-control select2" required>
                            <option value="" selected disabled>-- Select Vendor --</option>
                            @foreach($vendors as $vendor)
                                <option value="{{$vendor->id}}">{{$vendor->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <b> Bill Date </b>
                                <input type="date" name="bill_date" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <b> Due Date </b>
                                <input type="date" name="due_date" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b> Bill Number </b>
                                <input type="text" class="form-control" value="{{$bill_prefix.str_pad($c_bills,5,0,STR_PAD_LEFT)}}" readonly>
                            </div>
                            <div class="col-md-6">
                                <b> Category </b>
                                <select name="category_id" class="form-control select2" required>
                                    <option value="" selected disabled>-- Select Category --</option>
                                    @foreach($categories as $category)
                                        <option value="{{$category->id}}">{{$category->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <b> Order Number </b>
                                <input type="text" name="order_number" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <b> Shipping Display </b>
                                <select name="shipping_display" class="form-control" required>
                                    <option value="0">No</option>
                                    <option value="1">Yes</option>
                                </select>
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
                <label class="btn btn-success" style="float:right;" onclick="addItem()">+ Add Item</label>
                <table class="table table-striped table-hover" style="margin-top:60px;">
                    <thead>
                        <th>ITEMS</th>
                        <th>QUANTITY</th>
                        <th>PRICE</th>
                        <th>TAX(%)</th>
                        <th>DISCOUNT</th>
                        <th>AMOUNT</th>
                        <th></th>
                    </thead>
                    <tbody id="appendTr">
                    </tbody>
                    <tbody>
                        <tr>
                            <td colspan="4"></td>
                            <td><b>Sub Total</b></td>
                            <td>
                                <input type="text" name="subtotal" id="subtotal" class="form-control" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                            <td><b>Discount</b></td>
                            <td>
                                <input type="text" name="total_discount" id="total_discount" class="form-control" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                            <td><b>Tax</b></td>
                            <td>
                                <input type="text" name="total_taxes" id="total_taxes" class="form-control" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                            <td><b>Total Amount</b></td>
                            <td>
                                <input type="text" name="total_amount" id="total_amount" class="form-control" readonly>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div style="margin-top:20px;float:right;">
            <button class="btn btn-light">Cancel</button>
            <button class="btn btn-success">Create</button>
        </div>
    </form>    
</div>
<script>
    var trId = 0
    function addItem(){
        $("#appendTr").append(`
            <tr id="tr_`+trId+`">
                <td>
                    <select name="product_id[]" id="product_`+trId+`" class="form-control" onchange="changeProduct(`+trId+`)">
                        <option value="" selected disabled>--Select Product--</option>
                        @foreach($products as $product)
                            <option value="{{$product->id}}">{{$product->name}}</option>
                        @endforeach
                    </select>
                </td>
                <td>
                    <input type="number" name="quantity[]" id="quantity_`+trId+`" class="form-control" onkeyup="changeData(`+trId+`)" value="0" required>
                </td>
                <td>
                    <input type="number" name="price[]" id="price_`+trId+`" class="form-control" onkeyup="changeData(`+trId+`)" value="0" required>
                </td>
                <td>
                    <input type="number" name="tax[]" id="tax_`+trId+`" class="form-control tax" value="0" onkeyup="changeData(`+trId+`)" required>
                </td>
                <td>
                    <input type="number" name="discount[]" id="discount_`+trId+`" class="form-control discount" value="0" onkeyup="changeData(`+trId+`)" required>
                </td>
                <td>
                    <input type="number" name="amount[]" id="amount_`+trId+`" class="form-control amount" value="0" readonly required>
                    <input type="hidden" class="subtotals" id="subtotal_`+trId+`">
                    <input type="hidden" class="taxes" id="tax_total_`+trId+`">
                </td>
                <td><label onclick="deleteProduct(`+trId+`)" class="btn btn-sm btn-danger"><i class="voyager-trash"></i></label></td>
            </tr>
            <tr id="trtextarea_`+trId+`">
                <td colspan="2">
                    <textarea name="description[]" id="description_`+trId+`" class="form-control" cols="30" rows="2" required></textarea>
                </td>
            </tr>
        `)
        trId++
    }

    function deleteProduct(id){
        $("#tr_"+id).remove()
        $("#trtextarea_"+id).remove()
        changeData(id)
    }

    function changeProduct(id){
        var product_id = $("#product_"+id).val()
        $.ajax({
            url:"{{url('admin/products.json?id=')}}"+product_id,
            type:"get",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success: function(res){
                console.log(res)
                $("#price_"+id).val(res.purchase_price)
                $("#tax_"+id).val(res.tax.rate)
                amount(id)
                $("#total_discount").val(discount())
                $("#subtotal").val(subtotals())
                $("#total_taxes").val(taxes())
                $("#total_amount").val(total_amount())
            },  
            error: function(err){
                console.log(err)
            }
        })
    }

    function changeData(id){
        amount(id)
        $("#total_discount").val(discount())
        $("#subtotal").val(subtotals())
        $("#total_taxes").val(taxes())
        $("#total_amount").val(total_amount())
    }

    function amount(id){
        var quantity = $("#quantity_"+id).val()
        var price = $("#price_"+id).val()
        var tax = $("#tax_"+id).val()
        var discount = $("#discount_"+id).val()
        var amount = (quantity*price)+(((quantity*price)*tax)/100)-discount 
        $("#subtotal_"+id).val(quantity*price)
        $("#amount_"+id).val(amount)
        $("#tax_total_"+id).val(((quantity*price)*tax)/100)
    }

    function discount(){
        var discount = 0;
        $(".discount").each(function (){
            discount += parseFloat( $(this).val());
        });
        return discount;
    }

    function subtotals(){
        var subtotal = 0;
        $(".subtotals").each(function (){
            subtotal += parseFloat( $(this).val());
        });
        return subtotal;
    }

    function taxes(){
        var taxes = 0;
        $(".taxes").each(function (){
            taxes += parseFloat( $(this).val());
        });
        return taxes;
    }

    function total_amount(){
        var total_amount = 0;
        $(".amount").each(function (){
            total_amount += parseFloat( $(this).val());
        });
        return total_amount;
    }
</script>