<?php

namespace App\Http\Controllers;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Slide;
use App\Protype;
use App\Type;
use App\Product;
use App\Seller;
use App\Manufacture;
use App\Product_Size;
use App\Cart;
use App\Size;
use App\CartItem;
use Auth;
session_start();
class CartController extends Controller
{
    // add cart function
    public function addCart($pro_id,$size_id) {
        $product = Product::where('id','=',$pro_id)->first();
        $size = Size::where('id','=',$size_id)->first();
        $price_sell = ($product->promotion_price > 0) ? $product->promotion_price : $product->price;
        $cart = session()->get('cart');
        if(isset($cart[$pro_id])) {
            $check = false;
            for($i = 0;$i< count($cart[$pro_id]);$i++){
                if($cart[$pro_id][$i]['size_name'] == $size->name) {
                    $cart[$pro_id][$i]['quantity']++;
                    $check = true;
                    break;
                }
                else {
                    continue;
                    $check = false;
                }
            }
            if($check == false) {
                $cart[$pro_id][] = [
                    'image' => $product->pro_image,
                    'name' => $product->name,
                    'quantity' => 1,
                    'size_name' => $size->name,
                    'price' => $price_sell
                ];
            }
        }
        else {
            $cart[$pro_id][] = [
                'image' => $product->pro_image,
                'name' => $product->name,
                'quantity' => 1,
                'size_name' => $size->name,
                'price' => $price_sell
            ];
        }
        session()->put('cart',$cart);
        $cart = session()->get('cart');
        $result = "";
        $grand_price = 0;
        foreach($cart as $key => $value) {
            foreach($value as $key => $item) {
                $sub_price = $item['price'] * $item['quantity']; 
                $grand_price += $item['price']*$item['quantity'];
                $result .= '
                <li>
                <a href="#" class="photo"><img src="'. asset('images/' . $item['image']) .'" class="cart-thumb" alt="" /></a>
                <h6><a href="#">'.$item['name'].'</a></h6>
                <p>'.$item['quantity'].'x - '.$item['size_name'].' - <span class="price">'.number_format($sub_price,0).' Đ</span></p>
                </li>';
            }
        }

        return response()->json(array('grand_price' => $grand_price,'result' => $result, 'total' => count($cart), 'message' => 'Add cart successfully !!!'));
    }
    // update cart function
    public function updateCart(Request $req) {
        if(isset($req->id) && isset($req->sub_id) && isset($req->quantity)) {
            $id = $req->id;
            $sub_id = $req->sub_id;
            $quantity = $req->quantity;
    		$cart = session()->get('cart');
    		$cart[$id][$sub_id]['quantity'] = $quantity;
    		session()->put('cart',$cart);
    		$cart = session()->get('cart');
            //
            $result = "";
            $grand_price = 0;
            foreach($cart as $key => $value) {
                foreach($value as $key => $item) {
                    $sub_price = $item['price'] * $item['quantity']; 
                    $grand_price += $item['price']*$item['quantity'];
                    $result .= '
                    <li>
                    <a href="#" class="photo"><img src="'. asset('images/' . $item['image']) .'" class="cart-thumb" alt="" /></a>
                    <h6><a href="#">'.$item['name'].'</a></h6>
                    <p>'.$item['quantity'].'x - '.$item['size_name'].' - <span class="price">'.number_format($sub_price,0).' Đ</span></p>
                    </li>';
                }
            }
    		$cartComponents = view('customer.components.core-cart', compact('cart'))->render();
            return response()->json(array('grand_price' => $grand_price,'result' => $result, 'total' => count($cart),'cart' => $cartComponents, 'message' => 'Update cart successfully !!!', 'code' => 200));
    	}
    }
    // delete cart function
    public function deleteCart(Request $req) {
        if(isset($req->id) && isset($req->sub_id)) {
            $id = $req->id;
            $sub_id = $req->sub_id;
    		$cart = session()->get('cart');
            unset($cart[$id][$sub_id]);
            if(count($cart[$id]) == 0) {
                unset($cart[$id]);
            }
    		session()->put('cart',$cart);
    		$cart = session()->get('cart');
            //
            $result = "";
            $grand_price = 0;
            foreach($cart as $key => $value) {
                foreach($value as $key => $item) {
                    $sub_price = $item['price'] * $item['quantity']; 
                    $grand_price += $item['price']*$item['quantity'];
                    $result .= '
                    <li>
                    <a href="#" class="photo"><img src="'. asset('images/' . $item['image']) .'" class="cart-thumb" alt="" /></a>
                    <h6><a href="#">'.$item['name'].'</a></h6>
                    <p>'.$item['quantity'].'x - '.$item['size_name'].' - <span class="price">'.number_format($sub_price,0).' Đ</span></p>
                    </li>';
                }
            }
    		$cartComponents = view('customer.components.core-cart', compact('cart'))->render();
    		return response()->json(array('grand_price' => $grand_price,'result' => $result, 'total' => count($cart),'cart' => $cartComponents, 'message' => 'Delete cart successfully !!!', 'code' => 200));
    	}
    }
}
