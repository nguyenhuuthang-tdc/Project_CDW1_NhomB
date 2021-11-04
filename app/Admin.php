<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    protected $table = 'admins';
    //
    public function person() {
        return $this->belongsTo('App\Person','id','person_id');
    }
}
