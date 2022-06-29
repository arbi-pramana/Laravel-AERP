<?php
namespace App\Utility;

use App\Models\JournalItem;

class ChartOfAccount{
    public function balanceSheetValue($start_date = null,$end_date = null,$id)
    {
        $journal = JournalItem::join('journal_entries','journal_entries.id','journal_items.journal_id')
        ->when($start_date, function($q) use ($start_date,$end_date,$id){
            $q->whereBetween('date',[$start_date,$end_date]);
            $q->where('account',$id);
            return $q;
        })
        ->get();
        $value = $journal->sum('debit')-$journal->sum('credit');
        if($value > 0){
            return "Db. ".Formatting::price(abs($value));
        } elseif($value < 0){
            return "Cr. ".Formatting::price(abs($value));
        } else {
            return Formatting::price(abs($value));
        }
    }

    public function totalValue($start_date = null,$end_date = null,$id)
    {
        $journal = JournalItem::join('journal_entries','journal_entries.id','journal_items.journal_id')
        ->when($start_date, function($q) use ($start_date,$end_date,$id){
            $q->whereBetween('date',[$start_date,$end_date]);
            $q->where('account',$id);
            return $q;
        })
        ->get();
        $value = $journal->sum('debit')-$journal->sum('credit');
        return $value;
    }

    public function totalAccounts($price)
    {
        if($price > 0){
            return "Db. ".Formatting::price(abs($price));
        } elseif($price < 0){
            return "Cr. ".Formatting::price(abs($price));
        } else {
            return Formatting::price(abs($price));
        }
    }
}