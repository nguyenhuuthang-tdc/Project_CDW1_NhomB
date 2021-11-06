<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Person extends Model
{
    //
    protected $table = 'persons';
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
    public function account() {
        return $this->belongsTo('App\Account','id','account_id');
    }
    //
    public function customer() {
        return $this->hasOne('App\Customer','id','person_id');
    }
    //
    public function admin() {
        return $this->hasOne('App\Admin','id','person_id');
    }
    //
    public function getPersonByAccountId($id) {
        $person = DB::table('persons')->where('account_id','=',$id)->first();
        return $person;
    }
}
