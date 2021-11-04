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

//ADMIN LAYOUT
//LOGIN Admin
//middleware CheckExistAdminLogin to return home when go to login-page while admin is in session
Route::group(['middleware' => 'CheckExistAdminLogin'],function(){	
	Route::get('admin-page/login',[
        'as' => 'loginAdmin',
        'uses' => 'AccountController@getLoginAdmin'
    ]);
    Route::post('admin-page/post-login',[
        'as' => 'postLoginAdmin',
        'uses' => 'AccountController@postLoginAdmin'
    ]);
});
//logout admin
Route::get('admin-page/logout',[
    'as' => 'logoutAdmin',
    'uses' => 'AccountController@logoutAdmin'
]);
// All function and route of admin-page => prefix admin-page
Route::group(['prefix' => 'admin-page', 'middleware' => 'CheckAdminLogin'], function () {
    //home page
    Route::get('', 'PageController@getAdminPage');
    Route::get('home',[
        'as' => 'admin-home',
        'uses' => 'PageController@getAdminPage'
    ]);
    // admin
    Route::group(['prefix' => 'admin'], function () {
        //profile page
        Route::get('profile',[
            'as' => 'adminProfile',
            'uses' => 'AdminController@getAdminProfilePage'
        ]);
        //get edit profile page
        Route::get('/edit-profile',[
            'as' => 'adminEditProfile',
            'uses' => 'AdminController@getEdit'
        ]);
        //post edit profile
        Route::post('/post-edit-profile',[
            'as' => 'postAdminEditProfile',
            'uses' => 'AdminController@postEdit'
        ]);
        //get edit password page
        Route::get('/edit-account',[
            'as' => 'adminEditAccount',
            'uses' => 'AdminController@getEditAccount'
        ]);
        //post edit password 
        Route::post('/post-edit-account',[
            'as' => 'postAdminEditAccount',
            'uses' => 'AdminController@postEditAccount'
        ]);
        //
        Route::group(['middleware' => 'CheckRoleAdmin'], function () { 
            //get list admin page
            Route::get('/list-admin',[
                'as' => 'getListAdmin',
                'uses' => 'AdminController@getList'
            ]);
            //post change role AJAX
            Route::get('change-role',[
                'as' => 'changeRole',
                'uses' => 'AdminController@postChange'
            ]);
            //get add admin 
            Route::get('/add-admin',[
                'as' => 'addAmin',
                'uses' => 'AdminController@getAdd'
            ]);
            //post add admin 
            Route::post('/post-add-admin',[
                'as' => 'postAddAmin',
                'uses' => 'AdminController@postAdd'
            ]);
            //get delete admin 
            Route::get('/delete-admin/{id}',[
                'as' => 'getDeleteAdmin',
                'uses' => 'AdminController@getDelete'
            ]);
        });
    });
    // product
    Route::group(['prefix' => 'product'], function () {
        //list
        Route::get('/list-product',[
            'as' => 'getListProduct',
            'uses' => 'ProductController@getList'
        ]);
        //add
        Route::get('add-product',[
            'as' => 'getAddProduct',
            'uses' => 'ProductController@getAdd'
        ]);
        //post add product 
        Route::post('/post-add-product',[
            'as' => 'postAddProduct',
            'uses' => 'ProductController@postAdd'
        ]);
        //edit
        Route::get('edit-product/{id}',[
            'as' => 'getEditProduct',
            'uses' => 'ProductController@getEdit'
        ]);
        //post edit product 
        Route::post('/post-edit-product',[
            'as' => 'postEditProduct',
            'uses' => 'ProductController@postEdit'
        ]);
        //get delete product 
        Route::get('/delete-product/{id}',[
            'as' => 'getDeleteProduct',
            'uses' => 'ProductController@getDelete'
        ]);
    }); 
    //protype
    Route::group(['prefix' => 'protype'], function () {
        //list
        Route::get('/list-protype',[
            'as' => 'getListProtype',
            'uses' => 'ProtypeController@getList'
        ]);
        //add
        Route::get('add-protype',[
            'as' => 'getAddProtype',
            'uses' => 'ProtypeController@getAdd'
        ]);
        //post add product 
        Route::post('/post-add-protype',[
            'as' => 'postAddProtype',
            'uses' => 'ProtypeController@postAdd'
        ]);
        //edit
        Route::get('edit-protype/{id}',[
            'as' => 'getEditProtype',
            'uses' => 'ProtypeController@getEdit'
        ]);
        //post edit product 
        Route::post('/post-edit-protype',[
            'as' => 'postEditProtype',
            'uses' => 'ProtypeController@postEdit'
        ]);
        //get delete product 
        Route::get('/delete-protype/{id}',[
            'as' => 'getDeleteProtype',
            'uses' => 'ProtypeController@getDelete'
        ]);
    }); 
    //manufacture
    Route::group(['prefix' => 'manufacture'], function () {
        //list
        Route::get('/list-manufacture',[
            'as' => 'getListManufacture',
            'uses' => 'ManufactureController@getList'
        ]);
        //add
        Route::get('add-manufacture',[
            'as' => 'getAddManufacture',
            'uses' => 'ManufactureController@getAdd'
        ]);
        //post add product 
        Route::post('/post-add-manufacture',[
            'as' => 'postAddManufacture',
            'uses' => 'ManufactureController@postAdd'
        ]);
        //edit
        Route::get('edit-manufacture/{id}',[
            'as' => 'getEditManufacture',
            'uses' => 'ManufactureController@getEdit'
        ]);
        //post edit product 
        Route::post('/post-edit-manufacture',[
            'as' => 'postEditManufacture',
            'uses' => 'ManufactureController@postEdit'
        ]);
        //get delete product 
        Route::get('/delete-manufacture/{id}',[
            'as' => 'getDeleteManufacture',
            'uses' => 'ManufactureController@getDelete'
        ]);
    }); 
    //slide 
    Route::group(['prefix' => 'slide'], function () {
        //list
        Route::get('/list-slide',[
            'as' => 'getListSlide',
            'uses' => 'SlideController@getList'
        ]);
        //add
        Route::get('add-slide',[
            'as' => 'getAddSlide',
            'uses' => 'SlideController@getAdd'
        ]);
        //post add product 
        Route::post('/post-add-slide',[
            'as' => 'postAddSlide',
            'uses' => 'SlideController@postAdd'
        ]);
        //edit
        Route::get('edit-slide/{id}',[
            'as' => 'getEditSlide',
            'uses' => 'SlideController@getEdit'
        ]);
        //post edit product 
        Route::post('/post-edit-slide',[
            'as' => 'postEditSlide',
            'uses' => 'SlideController@postEdit'
        ]);
        //get delete product 
        Route::get('/delete-slide/{id}',[
            'as' => 'getDeleteSlide',
            'uses' => 'SlideController@getDelete'
        ]);
    }); 
    //order
    Route::group(['prefix' => 'order'], function () {
        //list
        Route::get('/list',[
            'as' => 'getListOrder',
            'uses' => 'OrderController@getList'
        ]);
        //get detail 
        Route::get('detail/{id}',[
            'as' => 'getOrderDetail',
            'uses' => 'OrderController@getDetail'
        ]);
        //post change order status admin ajax
        Route::get('/change-status',[
            'as' => 'changeStatus',
            'uses' => 'OrderController@postStatus'
        ]);
    });
    //customer
    Route::group(['prefix' => 'customer'], function () {
        //list
        Route::get('/list-customer',[
            'as' => 'getListCustomer',
            'uses' => 'CustomerController@getList'
        ]);
        //post change role AJAX
        Route::get('change-type',[
            'as' => 'changeType',
            'uses' => 'CustomerController@postChange'
        ]);
    }); 
});