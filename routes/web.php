<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// CUSTOMER LAYOUT
//LOGIN CUSTOMER
Route::group(['middleware' => 'CheckExistCustomerLogin'],function(){	
	Route::get('login-page',[
        'as' => 'login',
        'uses' => 'AccountController@getLoginCustomer'
    ]);
    Route::post('post-login',[
        'as' => 'postLogin',
        'uses' => 'AccountController@postLoginCustomer'
    ]);
    //REGISTER
    Route::get('register-page',[
        'as' => 'register',
        'uses' => 'CustomerController@getRegisterCustomer'
    ]);
    Route::post('post-register',[
        'as' => 'postRegister',
        'uses' => 'CustomerController@postRegisterCustomer'
    ]);
});
//Logout
Route::get('logout-customer',[
    'as' => 'logoutCustomer',
    'uses' => 'AccountController@logoutCustomer'
]);
//
// return homepage
Route::get('/',[
    'as' => 'home',
    'uses' => 'PageController@getIndex'
]);
Route::get('/home','PageController@getIndex');
// return about page
Route::get('/about',[
    'as' => 'about',
    'uses' => 'PageController@getAbout'
]);
// return cart page
Route::get('/cart',[
    'as' => 'cart',
    'uses' => 'PageController@getCart'
]);
// return wishlist page
Route::get('/wishlist',[
    'as' => 'wishlist',
    'uses' => 'PageController@getWishList'
]);
// return detail page
Route::get('/detail/{id}',[
    'as' => 'detail',
    'uses' => 'ProductController@getDetail'
]);
// return service page
Route::get('/service',[
    'as' => 'service',
    'uses' => 'PageController@getService'
]);
// return contact page
Route::get('/contact',[
    'as' => 'contact',
    'uses' => 'PageController@getContact'
]);
// return shop page
Route::get('/shop/{name?}',[
    'as' => 'shop',
    'uses' => 'ProductController@getListProduct'
]);
// CART 
Route::group(['middleware' => 'CheckCustomerLogin'],function(){	
    //add cart
	Route::get('add-cart',[
        'as' => 'addCart',
        'uses' => 'CartController@addCart'
    ]);
    Route::get('detail/add-cart/{pro_id}/{size_id}', 'CartController@addCart');
    // sửa gio hang 
    Route::get('update-cart',[
        'as' => 'updateCart',
        'uses' => 'CartController@updateCart'
    ]);
    // xóa 1 sp trong giỏ hàng
    Route::get('delete-cart',[
        'as' => 'deleteCart',
        'uses' => 'CartController@deleteCart'
    ]);
    // xóa toàn bộ sp trong giỏ hàng
    Route::get('delete-all-cart',[
        'as' => 'deleteAllCart',
        'uses' => 'CartController@deleteAllCart'
    ]);
    // return checkout page
    Route::get('/checkout',[
        'as' => 'checkout',
        'uses' => 'CheckoutController@getCheckout'
    ]);
    // return checkout page
    Route::post('/post-checkout',[
        'as' => 'postCheckout',
        'uses' => 'CheckoutController@postCheckout'
    ]);
    //CUSTOMER
    Route::group(['prefix' => 'customer'],function() {	
        // return my-account page
        Route::get('/my-account',[
            'as' => 'my_account',
            'uses' => 'CustomerController@getMyAccount'
        ]);
        //get edit profile page
        Route::get('/edit-profile',[
            'as' => 'customerEditProfile',
            'uses' => 'CustomerController@getEdit'
        ]);
        //post customer edit profile
        Route::post('/post-edit-profile',[
            'as' => 'postCustomerEditProfile',
            'uses' => 'CustomerController@postEdit'
        ]);
        //get customer edit password
        Route::get('/get-edit-password',[
            'as' => 'getCustomerEditPassword',
            'uses' => 'CustomerController@getEditPassword'
        ]);
        //post customer edit profile
        Route::post('/post-edit-password',[
            'as' => 'postCustomerEditPassword',
            'uses' => 'CustomerController@postEditPassword'
        ]);
        //get customer detail order page
        Route::get('/order-detail/{id}',[
            'as' => 'getCustomerOrderDetail',
            'uses' => 'OrderController@getOrderDetail'
        ]);
        //get customer cancel order
        Route::get('/cancel/{id}',[
            'as' => 'getCustomerCancelOrder',
            'uses' => 'OrderController@getCancelOrder'
        ]);
    });
});
//error customer
Route::get('/error-system',[
    'as' => 'getErrorCustomer',
    'uses' => 'PageController@getErrorCustomer'
]);
