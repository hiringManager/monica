<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Deal extends Model
{
    protected $fillable = ['title', 'company_id', 'contact_id', 'stage', 'amount', 'notes'];
}
