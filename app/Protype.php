<?php

namespace App;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Protype extends Model
{
    protected $table = "protypes";
    //
    public function getProtypeByTypeId($type_id) {
        $protype = DB::table('protypes')->where('type_id','=',$type_id)->get();
        return $protype;
    }
    //
    public function type() {
        return $this->belongsTo('App\Type','type_id','type_id');
    }
    //
    public function products() {
        return $this->hasMany('App\Product','id','protype_id');
    }
    //
    public function getProtypeNameById($protype_id) {
        $protype = DB::table('protypes')->where('id','=',$protype_id)->first();
        return $protype;
    }
}
