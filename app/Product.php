<?php

namespace App;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    private static $_instance;
    //
    public static function getInstance() {
        if (!isset(self::$_instance)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    //
    protected $table = "products";
    //
    public function protype() {
        return $this->belongsTo('App\Protype','id','protype_id');
    }
    //
    public function manufacture() {
        return $this->belongsTo('App\Manufacture','id','manu_id');
    }
    //
    public function size() {
        return $this->belongsToMany('App\Size','products_sizes','id','size_id');
    }
    //
    public function order_item() {
        return $this->hasMany('App\Order_Item','id','product_id');
    }
    //
    public function comment() {
        return $this->hasMany('App\Comment','id','pro_id');
    }
    //top-feature or best-seller
    public function featureOrSeller($item,$sell_q){
        if($item->feature == 1) {
            if($sell_q >= 10) {
                return 'top-featured best-seller';
            }
            else {
                return 'top-featured';
            }
        }
        else {
            if($sell_q >= 10) {
                return 'best-seller';
            }
            else {
                return '';
            }
        }
    }
    //count product by type id
    public function countProductByProtypeId($protype_id) {
        $quantity_product = DB::table('products')->where('protype_id','=',$protype_id)->count();
        return $quantity_product;
    }
    //get product by id
    public function getProductById($id) {
        $product = DB::table('products')->where('id','=',$id)->first();
        return $product;
    }
}
