<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Size extends Model
{
    //
    protected $table = "sizes";
    //relationships
    public function product() {
        return $this->belongsToMany('App\Product','products_sizes','pro_id','size_id');
    }
}
