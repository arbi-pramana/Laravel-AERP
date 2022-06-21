<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JournalEntry extends Model
{
    use HasFactory;

    public function journalItems()
    {
        return $this->hasMany(journalItem::class,'journal_id','id');
    }
}
