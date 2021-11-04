<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order_Item extends Model
{
    //
    protected $table = 'order_items';
    //
    public function order() {
        return $this->belongsTo('App\Order','id','order_id');
    }
    //
    public function product() {
        return $this->hasMany('App\Product','id','product_id');
    }
}
