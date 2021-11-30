<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    //
    protected $table = 'comments';
    //
    public function product() {
        return $this->belongsTo('App\Product','id','pro_id');
    }
    //
    public function account() {
        return $this->belongsTo('App\Account','id','account_id');
    }
}
