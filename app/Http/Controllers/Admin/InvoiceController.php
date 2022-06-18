<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\CreditNote;
use App\Models\Customer;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\InvoiceProduct;
use App\Models\Product;
use App\Models\Setting;
use App\Models\Transaction;
use App\Utility\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Controller;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;

class InvoiceController extends Controller
{
    use BreadRelationshipParser;

    public function json(Request $request)
    {
        if(!empty($request->id)){
            return Invoice::with(['customer','category'])->find($request->id);
        } else {
            return Invoice::get();
        }
    }

    public function index(Request $request)
    {
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchNames = $dataType->browseRows->mapWithKeys(function ($row) {
                return [$row['field'] => $row->getTranslatedAttribute('display_name')];
            });
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            $query = $model::select($dataType->name.'.*');

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query->{$dataType->scope}();
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%'.$search->value.'%';

                $searchField = $dataType->name.'.'.$search->key;
                if ($row = $this->findSearchableRelationshipRow($dataType->rows->where('type', 'relationship'), $search->key)) {
                    $query->whereIn(
                        $searchField,
                        $row->details->model::where($row->details->label, $search_filter, $search_value)->pluck('id')->toArray()
                    );
                } else {
                    if ($dataType->browseRows->pluck('field')->contains($search->key)) {
                        $query->where($searchField, $search_filter, $search_value);
                    }
                }
            }

            $row = $dataType->rows->where('field', $orderBy)->firstWhere('type', 'relationship');
            if ($orderBy && (in_array($orderBy, $dataType->fields()) || !empty($row))) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                if (!empty($row)) {
                    $query->select([
                        $dataType->name.'.*',
                        'joined.'.$row->details->label.' as '.$orderBy,
                    ])->leftJoin(
                        $row->details->table.' as joined',
                        $dataType->name.'.'.$row->details->column,
                        'joined.'.$row->details->key
                    );
                }

                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        // Define list of columns that can be sorted server side
        $sortableColumns = $this->getSortableColumns($dataType->browseRows);

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }

        return Voyager::view($view, compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortableColumns',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn'
        ));
    }

    public function create(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
                            ? new $dataType->model_name()
                            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        $customers = Customer::get();
        $categories = Category::where('type',2)->get();
        $c_invoices = Invoice::get()->count()+1;
        $inv_prefix = Setting::where('key','system-setting.invoice_prefix')->first()->value ?? '';
        $products = Product::get();
        
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','customers','categories','c_invoices','inv_prefix','products'
        ));
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $invoice = new Invoice;
            $invoice->customer_id = $request->customer_id;
            $invoice->issue_date = $request->issue_date;
            $invoice->due_date = $request->due_date;
            $invoice->category_id = $request->category_id;
            $invoice->ref_number = $request->ref_number;
            $invoice->shipping_display = $request->shipping_display;
            $invoice->status = 0;
            $invoice->created_by = $request->created_by;
            $invoice->save();
            
            foreach($request->product_id as $i => $product){
                $invoice_product = new InvoiceProduct;
                $invoice_product->invoice_id = $invoice->id;
                $invoice_product->product_id = $request->product_id[$i];
                $invoice_product->quantity = $request->quantity[$i];
                $invoice_product->price = $request->price[$i];
                $invoice_product->tax = $request->tax[$i];
                $invoice_product->discount = $request->discount[$i];
                $invoice_product->description = $request->description[$i];
                $invoice_product->save();
            }
            DB::commit();
            return redirect('admin/invoices')->with(
                [
                    'message'    => "Invoice created successfully",
                    'alert-type' => 'success',
                ]
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
        }
    }

    public function edit(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        $invoice = Invoice::find($dataTypeContent->id);
        $invoice_products = InvoiceProduct::where('invoice_id',$dataTypeContent->id)->get();
        $customers = Customer::get();
        $categories = Category::where('type',2)->get();
        $c_invoices = Invoice::get()->count()+1;
        $inv_prefix = Setting::where('key','system-setting.invoice_prefix')->first()->value ?? '';
        $products = Product::get();

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','invoice','invoice_products','customers','categories','c_invoices','inv_prefix','products'));
    }

    public function update(Request $request,$id)
    {
        DB::beginTransaction();
        try {
            $invoice = Invoice::find($id);
            $invoice->customer_id = $request->customer_id;
            $invoice->issue_date = $request->issue_date;
            $invoice->due_date = $request->due_date;
            $invoice->category_id = $request->category_id;
            $invoice->ref_number = $request->ref_number;
            $invoice->shipping_display = $request->shipping_display;
            $invoice->status = 0;
            $invoice->created_by = $request->created_by;
            $invoice->save();
            
            $this->destroyProduct($invoice->id);
            foreach($request->product_id as $i => $product){
                $invoice_product = new InvoiceProduct;
                $invoice_product->invoice_id = $invoice->id;
                $invoice_product->product_id = $request->product_id[$i];
                $invoice_product->quantity = $request->quantity[$i];
                $invoice_product->price = $request->price[$i];
                $invoice_product->tax = $request->tax[$i];
                $invoice_product->discount = $request->discount[$i];
                $invoice_product->description = $request->description[$i];
                $invoice_product->save();
            }
            DB::commit();
            return redirect('admin/invoices')->with( [
                'message'    => "Invoice updated successfully",
                'alert-type' => 'success',
            ]);
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
        }
    }

    public function show(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $query = $model->query();

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $query = $query->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $query->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$query, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.read";
        }

        $invoice = Invoice::find($dataTypeContent->id);
        $invoice_products = InvoiceProduct::where('invoice_id',$dataTypeContent->id)->get();
        $inv_prefix = Setting::where('key','system-setting.invoice_prefix')->first()->value ?? '';
        $invoice_payments = InvoicePayment::where('invoice_id',$invoice->id)->get();
        $credit_notes = CreditNote::where('invoice_id',$invoice->id)->get();
        
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted','invoice', 'invoice_products', 'inv_prefix', 'invoice_payments', 'credit_notes'));
    }

    public function updateStatus(Request $request, $id)
    {
        $invoice = Invoice::find($id);
        $invoice->status = $request->status;
        $invoice->save();

        return redirect('/admin/invoices/'.$id)->with([
            'message'    => "Invoice updated successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroy($id)
    {
        InvoiceProduct::where('invoice_id',$id)->delete();
        $invoice_payments = InvoicePayment::where('invoice_id',$id);
        if(!empty($invoice_payments->get())){
            foreach ($invoice_payments->get() as $invoice_payment) {
                Transaction::where('category','Invoice')->where('payment_id',$invoice_payment->id)->delete();
            }
        }
        $invoice_payments->delete();
        CreditNote::where('invoice_id',$id)->delete();
        Invoice::find($id)->delete();
        return redirect('/admin/invoices')->with([
            'message'    => "Invoice deleted successfully",
            'alert-type' => 'success',
        ]);
    }

    public function destroyProduct($id)
    {
        InvoiceProduct::where('invoice_id',$id)->delete();
    }

    public function destroyCreditNote($id)
    {
        $credit_note = CreditNote::find($id);
        $credit_note->delete();
        Status::salesInvoice($credit_note->invoice_id);
        return redirect()->back()->with([
            'message'    => "Credit note deleted successfully",
            'alert-type' => 'success',
        ]);
    }

    protected function getSortableColumns($rows)
    {
        return $rows->filter(function ($item) {
            if ($item->type != 'relationship') {
                return true;
            }
            if ($item->details->type != 'belongsTo') {
                return false;
            }

            return !$this->relationIsUsingAccessorAsLabel($item->details);
        })
        ->pluck('field')
        ->toArray();
    }

    protected function relationIsUsingAccessorAsLabel($details)
    {
        return in_array($details->label, app($details->model)->additional_attributes ?? []);
    }

}
