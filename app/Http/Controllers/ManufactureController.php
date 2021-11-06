<?php

namespace App\Http\Controllers;
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Slide;
use App\Protype;
use App\Type;
use App\Product;
use App\Manufacture;
use App\Product_Size;
use App\Size;

class ManufactureController extends Controller
{
    // get list manufacture page
    public function getList() {
        $list_manu = Manufacture::all();
        return view('admin.list-manufacture', compact('list_manu'));
    }
    //get add manufacture page 
    public function getAdd() {
        return view('admin.manufacture-add');
    }
    //post add manufacture
    public function postAdd(Request $request) {
        $this->validate($request,
			[
                'manu_name' => 'required|unique:manufactures',
			],
			[
                'manu_name.required' => 'Please enter manu name',
                'manu_name.unique' => 'This name already exist',
			]
		);
        $manufacture = new Manufacture();
    	$manufacture->manu_name = $request->manu_name;
        $manufacture->version = 1;
    	$manufacture->save();
    	return back()->with(['typeMsg'=>'success','msg'=>'Add manufacture successfully !!!']);
    }
    //get edit manufacture page 
    public function getEdit($id) {
        $manufacture = Manufacture::where('id','=',$id)->first();
        return view('admin.manufacture-edit', compact('manufacture'));
    }
    //post edit manufacture 
    public function postEdit(Request $request) {
        $manu = Manufacture::find($request->input('manu_id'));
        $newVersion = $manu['version'];
        // var_dump($newVersion) ;
        // var_dump($request->input('version'));
        // die();
        if($newVersion == $request->input('version')){
            $this->validate($request,
                [
                    'manu_name' => 'required',
                ],
                [
                    'manu_name.required' => 'Please enter manu name',
                ]
            );
            $manufacture = Manufacture::find($request->manu_id);
            $tableManufacture = Manufacture::where('id','!=',$manufacture->id)->get();
            $flag = true;
            foreach($tableManufacture as $key => $item) {
                if($request->manu_name == $item->manu_name) {
                    $flag = false;
                    break;
                }
            }
            if($flag == false) {
                return back()->with(['typeMsg'=>'danger','msg'=>'This name already exist!!!']);
            }
            else {
                $manufacture->manu_name = $request->manu_name;
                $manufacture->version = $request->input('version')+1;
                $manufacture->save();
                return back()->with(['typeMsg'=>'success','msg'=>'Edit manufacture successfully !!!']);
            } 
        }
        else{
            return back()->with(['typeMsg'=>'danger','msg'=>'Update manufacture failed !!!']);
        }
        
    }
    //get Delete manufacture
    public function getDelete($id, Request $request) {
        //check if protype has product
        $manu = Manufacture::find($id);
    
        if(!empty($manu['id'])){
            $product = Product::where('manu_id','=',$id)->get();
            if(count($product) != 0) {
                return back()->with(['typeMsg'=>'danger','msg'=>'products still exist']);
            } else {
                Manufacture::destroy($id);
                return redirect(url('admin-page/manufacture/list-manufacture'))->with(['typeMsg'=>'success','msg'=>'Delete successfully !']);
            }    
        }
        else{
            return back()->with(['typeMsg'=>'danger','msg'=>'Delete manufacture failed !!! Data dose not exist!!!']);
        }
    }
}
