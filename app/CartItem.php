<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    //attributes
    private $product = null;
    private $price = 0;
    private $quantity = 0;
    private $size = "";
    private $subTotal = 0;
    //
    public function getProduct() {
        return $this->product;
    }
    public function setProduct($product){
        $this->product = $product;
    }
    public function getPrice() {
        return $this->price;
    }
    public function setPrice($price){
        $this->price = $price;
    }
    public function getQuantity() {
        return $this->quantity;
    }
    public function setQuantity($quantity){
        $this->quantity = $quantity;
    }
    public function getSize() {
        return $this->size;
    }
    public function setSize($size){
        $this->size = $size;
    }
    public function getSubTotal() {
        return $this->subTotal;
    }
    public function setSubTotal($subTotal){
        $this->subTotal = $subTotal;
    }
    //constructor with parameter
    public function __construct($product,$price,$quantity,$size,$subTotal) {
        $this->product = $product;
        $this->price = $price;
        $this->quantity = $quantity;
        $this->size = $size;
        $this->subTotal = $subTotal;
    }
}
