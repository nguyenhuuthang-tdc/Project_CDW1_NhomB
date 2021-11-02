<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    //
    protected $table = 'orders';
    //
    public function customer() {
        return $this->belongsTo('App\Customer','id','customer_id');
    }
    //
    public function order_item() {
        return $this->hasMany('App\Order_Item','id','order_id');
    }
}
