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

class SlideController extends Controller
{
    // get list slide page
    public function getList() {
        $list_slide = Slide::all();
        return view('admin.list-slide', compact('list_slide'));
    }
    //get add slide page 
    public function getAdd() {
        return view('admin.slide-add');
    }
    //post add slide
    public function postAdd(Request $request) {
        $request->validate([
            'slide_image' => 'required|image|mimes:jpg,png,jpeg|max:100000|unique:slides',
            // 'name' => 'required|unique',
        ]);
        $slide = new Slide();
        //check file exists
        if($request->hasFile('slide_image')) {
            $image = $request->file('slide_image');
            $image_name = $image->getClientOriginalName();
            $target_file = "images/" . $image_name;
            if(file_exists($target_file)) {
                return back()->with(['typeMsg'=>'danger','msg'=>'File already exists !']);
            } else {
                $image->move('images',$image_name);
                $slide->slide_image = $image_name;
                $slide->save();
                return back()->with(['typeMsg'=>'success','msg'=>'Add slide successfully !!!']);
            }
        }
    }
    //get edit slide page 
    public function getEdit($id) {
        $slide = Slide::where('id','=',$id)->first();
        return view('admin.slide-edit', compact('slide'));
    }
    //post edit slide 
    public function postEdit(Request $request) {
        $request->validate([
            'slide_image' => 'required|image|mimes:jpg,png,jpeg|max:100000',
        ]);
        $slide = Slide::find($request->slide_id);
        //check file exists
        if($request->hasFile('slide_image')) {
            $image = $request->file('slide_image');
            $image_name = $image->getClientOriginalName();
            $target_file = "images/" . $image_name;
            if(file_exists($target_file)) {
                return back()->with(['typeMsg'=>'danger','msg'=>'File already exists !']);
            } else {
                $image->move('images',$image_name);
                $slide->slide_image = $image_name;
            }
        }
        else {
            $oldProImage = $slide->slide_image;
            $slide->slide_image = $oldProImage;
        }
    	$slide->save();
    	return back()->with(['typeMsg'=>'success','msg'=>'Edit protype successfully !!!']);
    }
    //get delete slide
    public function getDelete($id) {
        Slide::destroy($id);
        return redirect(url('admin-page/slide/list-slide'))->with(['typeMsg'=>'success','msg'=>'Delete successfully !']); 
    }
}
