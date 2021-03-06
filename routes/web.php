<?php

use App\Http\Controllers\Admin\BillController;
use App\Http\Controllers\Admin\ChartOfAccountController;
use App\Http\Controllers\Admin\InvoiceController;
use App\Http\Controllers\Admin\JournalEntryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ReportController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Route::get('chart-of-accounts/sub-type.json',ChartOfAccountController::class.'@subTypeJson');
    Route::get('products.json',ProductController::class.'@json');
    Route::get('invoices.json',InvoiceController::class.'@json');
    Route::get('bills.json',BillController::class.'@json');
    Route::post('invoices/store',InvoiceController::class.'@store');
    Route::put('invoices/{id}/update',InvoiceController::class.'@update');
    Route::get('invoices/{id}/update-status',InvoiceController::class.'@updateStatus');
    Route::delete('invoices/{id}/credit-note',InvoiceController::class.'@destroyCreditNote');
    Route::post('bills/store',BillController::class.'@store');
    Route::put('bills/{id}/update',BillController::class.'@update');
    Route::get('bills/{id}/update-status',BillController::class.'@updateStatus');
    Route::delete('bills/{id}/debit-note',BillController::class.'@destroyDebitNote');
    Route::group(['prefix'=>'report'],function(){
        Route::get('ledger',ReportController::class.'@ledger');
        Route::get('balance-sheet',ReportController::class.'@balanceSheet');
        Route::get('trial-balance',ReportController::class.'@trialBalance');
    });
    Voyager::routes();
    Route::delete('invoices/{id}',InvoiceController::class.'@destroy')->name('voyager.invoices.destroy');
    Route::delete('bills/{id}',BillController::class.'@destroy')->name('voyager.bills.destroy');
});
