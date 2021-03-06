<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JournalItem extends Model
{
    use HasFactory;

    public function chartOfAccount()
    {
        return $this->belongsTo(ChartOfAccount::class,'account','id');
    }

    public function journal()
    {
        return $this->belongsTo(JournalEntry::class,'journal_id','id');
    }
}
