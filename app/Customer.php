<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Customer extends Model
{
    protected $table = 'customers';
    //
    private static $_instance;
    //
    public static function getInstance() {
        if (!isset(self::$_instance)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    //
    public function person() {
        return $this->belongsTo('App\Person','id','person_id');
    }
    //
    public function order() {
        return $this->hasMany('App\Order','id','customer_id');
    }
    //
    public function getCustomerByPersonId($id) {
        $customer = DB::table('customers')->where('person_id','=',$id)->first();
        return $customer;
    }
}
