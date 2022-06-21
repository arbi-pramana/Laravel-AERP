<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChartOfAccount;
use App\Models\JournalEntry;
use App\Models\JournalItem;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function ledger(Request $request)
    {
        if(!empty($request->account)){
            $data['selected_account'] = ChartOfAccount::where('id', $request->account)->first();
        }

        if(!empty($request->account)){
            $from = $request->start_date;
            $to = $request->end_date;
            $data['journal_items'] = JournalEntry::join('journal_items', 'journal_entries.id', '=', 'journal_items.journal_id')
                ->whereBetween('journal_entries.date', [$from, $to])
                ->where('journal_items.account', $request->account)
                ->get();
            
            $data['total_debit'] = $data['journal_items']->sum('debit');
            $data['total_credit'] = $data['journal_items']->sum('credit');
            $data['total_balance'] = $data['total_debit']-$data['total_credit'];
        }

        $data['accounts'] = ChartOfAccount::get();
        return view('vendor.voyager.report.ledger',$data);
    }
}
