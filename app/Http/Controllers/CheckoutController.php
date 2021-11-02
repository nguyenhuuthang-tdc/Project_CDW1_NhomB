<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\DB;
use App\Account;
use App\Person;
use App\Customer;
use App\Product;
use App\Seller;
use App\Order;
use App\Order_Item;
use App\Cart;
use App\Size;
use Auth;

class CheckoutController extends Controller
{
    // return checkout page  
    public function getCheckout() {
        $user = Auth::guard('account_customer')->check() ? Auth::guard('account_customer')->user() : null;
        $cart = session()->has('cart') ? session()->get('cart') : null;
        if($user != null) {
            $user_id = $user->id;
            $person = Person::find($user_id);
            $customer = Customer::where('person_id','=',$person->id)->first();
            if(count($cart) <= 0) {
                return back()->with(['typeMsg' => 'danger','msg' => 'Your cart is null !!!']);  
            } 
            else {
                return view('customer.checkout', compact('cart','user','person','customer'));
            }
        }
    } 
    //post checkout
    public function postCheckout(Request $request) {
        $account = (Auth::guard('account_customer')->check()) ? Auth::guard('account_customer')->user() : null;
        $cart = session()->has('cart') ? session()->get('cart') : null;
        if($account != null && $cart != null) {
            $grand_price = 0;
            $grand_total = 0;
            foreach($cart as $key => $value) {
                foreach($value as $key => $item) {
                    $grand_price += $item['price']*$item['quantity'];
                    $grand_total += $item['quantity'];
                }
            }
            $person = Person::where('account_id','=',$account->id)->first();
            $customer = Customer::where('person_id','=',$person->id)->first();
            if($customer->type == 'vip') {
                $grand_price += 20000;
            }
            $order = new Order();
            $order->customer_id = $customer->id;
            $order->total_quantity = $grand_total;
            $order->grand_price = $grand_price;
            $order->note = ($request->note == null) ? '' : $request->note;
            $order->status = "progress";
            $order->save();
            // thêm chi tiết đơn hàng
            $order_id = $order->id;
            foreach($cart as $key => $value) {
                $product_id = $key;
                foreach($value as $key => $item) {
                    $order_item = new Order_Item();
                    $order_item->order_id = $order_id;
                    $order_item->product_id = $product_id;
                    $order_item->price_sell = $item['price'];
                    $order_item->size = $item['size_name'];
                    $order_item->quantity = $item['quantity'];
                    $sub_price = $item['price'] * $item['quantity'];
                    $order_item->sub_price = $sub_price;
                    $order_item->save();
                }
            }
            session()->forget('cart');
            return redirect(url('/home'))->with(['typeMsg'=>'success','msg'=>'Your order is being processed !']);
        }
    }
}
