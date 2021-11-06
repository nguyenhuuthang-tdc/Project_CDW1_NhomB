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

class CustomerController extends Controller
{
    //
    public function getRegisterCustomer() {
        return view('customer.register');
    }
    public function postRegisterCustomer(Request $request) {
        $this->validate($request,
			[
				'user_name'=>'required|unique:accounts',
				'email'=>'required|email|unique:persons',
				'password'=>'required|min:6|max:20',
				'repassword'=>'required|same:password',
                'phone'=>'required|unique:persons|digits:10'
			],
			[
				'user_name.required'=>'Please enter your name',
                'user_name.unique'=>'Username already exists',
				'email.required'=>'Please enter your email',
				'email.unique'=>'This email already exist',
                'email.email'=>'Incorrect email format',
				'password.required'=>'Please enter your password',
				'password.min'=>'Password must be more than 6 characters',
				'password.max'=>'Password must not exceed 20 characters',
				'repassword.same'=>'incorrect password',
                'phone.unique'=>'Number phone already exist',
                'phone.digits'=>'Number phone is invalid',
			]
		);
        // add account
        $account = Account::getInstance();
        $account->user_name = $request->user_name;
        $account->password = bcrypt($request->password);
        $account->role = 'customer';
        $account->save();
        // add person
        $person = Person::getInstance();
        $person->account_id = $account->id;
        $person->full_name = $request->fullname;
        $person->gender = ($request->gender == 1) ? 'Male' : 'Female';
        $person->address = $request->address;
        $person->date_of_birth = $request->date;
        $person->phone = $request->phone;
        $person->email = $request->email;
        $person->save();
        // add customer 
        $customer = Customer::getInstance();
        $customer->person_id = $person->id;
        $customer->type = "normal";
        $customer->save();
        return back()->with(['typeMsg'=>'success','msg'=>'Your account has been created !!!']);
    }
    // return myaccount page
    public function getMyAccount() {
        if(Auth::guard('account_customer')->check()) {
            $account = Auth::guard('account_customer')->user();
            $person = Person::where('account_id','=',$account->id)->first();
            $customer = Customer::where('person_id','=',$person->id)->first();
            $order = Order::where('customer_id','=',$customer->id)->get();
            return view('customer.my-account',compact('person','order','customer'));
        } 
    } 
    //get edit customer profile page
    public function getEdit() {
        if(Auth::guard('account_customer')->check()) {
            $account = Auth::guard('account_customer')->user();
            $person = Person::where('account_id','=',$account->id)->first();
            $customer = Customer::where('person_id','=',$person->id)->first();
            return view('customer.profile-edit', compact('person','customer'));
        }
    }
    //post edit customer profile page
    public function postEdit(Request $request) {
        $this->validate($request,
			[
                'fullname'=>'required',
                'address'=>'required',
                'gender'=> 'required',
                'date'=>'required',
				'email'=>'required|email',
                'phone'=>'required|digits:10'
			],
			[
                'fullname.required'=>'Please enter your full name',
                'address.required'=>'Please enter your address',
                'gender.required'=>'Please enter your gender',
                'date.required'=>'Please enter your date',
				'email.required'=>'Please enter your email',
                'email.email'=>'Incorrect email format',
                'phone.required'=>'Please enter your number phone',
                'phone.digits'=>'Number phone is invalid',
			]
		);
        $id = $request->id;
        $person = Person::find($id);
        $tablePerson = Person::where('id','!=',$id)->get();
        $flag = true;
        foreach($tablePerson as $key => $value) {
            if($request->phone == $value->phone || $request->email == $value->email) {
                $flag = false;
                break;
            }
        }
        if($flag == true) {
            $person->full_name = $request->fullname;
            $person->gender = ($request->gender == 1) ? 'Male' : 'Female';
            $person->address = $request->address;
            $person->date_of_birth = $request->date;
            $person->phone = $request->phone;
            $person->email = $request->email;
            $person->save();
            return redirect('customer/my-account')->with(['typeMsg' => 'success','msg' => 'Edit profile successfully !!!']);
        } else {
            return back()->with(['typeMsg'=>'danger','msg'=>'email or numberphone already exist']);
        }
    }
    // get edit customer password page
    public function getEditPassword() {
        return view('customer.password-edit');
    }
    //
    public function postEditPassword(Request $request) {
        $this->validate($request,
			[
                'oldpassword'=>'required|min:6|max:20',
                'newpassword'=>'required|min:6|max:20',
                'repassword'=>'required|same:newpassword|min:6|max:20'
			],
			[
                'oldpassword.required'=>'Please enter your old password',
                'newpassword.required'=>'Please enter your new password',
                'repassword.required'=>'Please enter re password',
                'repassword.same'=>'incorrect confrim password',
                'oldpassword.min'=>'Password must be more than 6 characters',
                'oldpassword.max'=>'Password must not exceed 20 characters',
                'newpassword.min'=>'Password must be more than 6 characters',
                'newpassword.max'=>'Password must not exceed 20 characters',
                'repassword.min'=>'Password must be more than 6 characters',
                'repassword.max'=>'Password must not exceed 20 characters',
			]
		);
        $account = Auth::guard('account_customer')->user();
        $user_name = $account->user_name;
        //     
        $data = [
            'user_name' => $user_name,
            'password' => $request->oldpassword,
        ];
        if(Auth::guard('account_customer')->attempt($data)) {
            $account->password = bcrypt($request->newpassword);
            $account->save();
            Auth::guard('account_customer')->logout();
            return redirect('/login-page')->with(['typeMsg' => 'success','msg' => 'Change password successfully !!!']);
        } else {
            return back()->with(['typeMsg' => 'danger','msg' => 'Incorrect old password !!!']);
        }
    }
    //ADMIN MANAGER

    //return list customer page
    public function getList() {
        $account = Account::where('role','=','customer')->get();
        $person = new Person();
        $customer = new Customer();
        return view('admin.list-customer', compact('account','person','customer'));
    }
    // post change role admin 
    public function postChange(Request $request) {
        $customer_id = $request->customer_id;
        $type = $request->type;
        $customer = Customer::find($customer_id);
        $customer->type = $type;
        $customer->save();
        return response()->json(array('typeMsg' => 'success','msg' => 'Edit successfully !!!'));
    }
}
