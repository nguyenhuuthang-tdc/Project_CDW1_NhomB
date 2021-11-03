<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Account;
use App\Product;
use App\Person;
use App\Customer;
use App\Order;
use App\Order_Item;
use Auth;

class OrderController extends Controller
{
    //CUSTOMER 
    // get order detail customer page
    public function getOrderDetail($id) {
        if(Auth::guard('account_customer')->check()) {
            $product = new Product();
            $account = Auth::guard('account_customer')->user();
            $person = Person::where('account_id','=',$account->id)->first();
            $customer = Customer::where('person_id','=',$person->id)->first();
            $order = Order::where('id','=',$id)->where('customer_id','=',$customer->id)->first();
            if($order == null) {
                return back()->with(['typeMsg' => 'danger','msg' => 'You dont have this order !!!']);
            } else {
                $order_detail = Order_Item::where('order_id','=',$id)->get();
                return view('customer.order_detail', compact('person','order','order_detail','product'));
            }
        }
    }
    // post cancel order customer
    public function getCancelOrder($id) {
        if(Auth::guard('account_customer')->check()) {
            $order = Order::where('id','=',$id)->first();
            $order->status = 'cancel';
            $order->save();
            return redirect('customer/my-account')->with(['typeMsg' => 'success','msg' => 'Cancel order successfully !!!']);
        }
    }
    // ADMIN
    //get list order page
    public function getList() {
        if(Auth::guard('account_admin')->check()) {
            $order = Order::all();
            return view('admin.list-order',compact('order'));
        } 
    }
    //get detail order 
    public function getDetail($id) {
        if(Auth::guard('account_admin')->check()) {
            $product = new Product();
            $order = Order::where('id','=',$id)->first();
            $customer = Customer::where('id','=',$order->customer_id)->first();
            $person = Person::where('id','=',$customer->person_id)->first();
            $account = Account::where('id','=',$person->account_id)->first();
            if($order == null) {
                return back()->with(['typeMsg' => 'danger','msg' => 'You dont have this order !!!']);
            } else {
                $order_detail = Order_Item::where('order_id','=',$id)->get();
                return view('admin.order_detail', compact('order','order_detail','product','customer','person','account'));
            }
        }
    }
    //post change order status for admin 
    public function postStatus(Request $request) {
        $order_id = $request->order_id;
        $status = $request->status;
        $order = Order::find($order_id);
        $order->status = $status;
        $order->save();
        return response()->json(array('typeMsg' => 'success','msg' => 'Change status successfully !!!'));
    }
}
