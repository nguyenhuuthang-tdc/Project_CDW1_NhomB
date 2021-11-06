<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FactoryModel extends Model
{
    public function make($model) {
        if ($model == 'product') {
            $product = new Product();
            return $product;
        } else if ($model == 'manufacture') {
            $manufacture = new Manufacture();
            return $manufacture;
        } else if ($model == 'account') {
            $account = new Account();
            return $account;
        } else if ($model == 'admin') {
            $admin = new Admin();
            return $admin;
        } else if ($model == 'customer') {
            $customer = new Customer();
            return $customer;
        } else if ($model == 'order_Item') {
            $order_Item = new Order_Item();
            return $order_Item;
        } else if ($model == 'order') {
            $order = new Order();
            return $order;
        } else if ($model == 'person') {
            $person = new Person();
            return $person;
        }else if ($model == 'product_size') {
            $product_size = new Product_Size();
            return $product_size;
        }else if ($model == 'product') {
            $product = new Product();
            return $product;
        }else if ($model == 'protype') {
            $protype = new Protype();
            return $protype;
        }else if ($model == 'size') {
            $size = new Size();
            return $size;
        }else if ($model == 'slide') {
            $slide = new Slide();
            return $slide;
        }else if ($model == 'type') {
            $type = new Type();
            return $type;
        }
        
    }
}
