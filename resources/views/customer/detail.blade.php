@extends('customer.shared.master')
@section('content')
    <!-- End Top Search -->
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop Detail</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Shop Detail</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">              
                        <div class="carousel-item active"> <img class="d-block w-100" src="{{ asset('images/' . $detail_pro->pro_image) }}" alt="First slide"> </div>
                        <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h2>{{ $detail_pro->name }}</h2>
                        @if($detail_pro->promotion_price != 0)
                        <h5> <del>{{ number_format($detail_pro->price,0) }}</del> {{ number_format($detail_pro->promotion_price,0)}}</h5>                        
                        @else 
                        <h5>{{ number_format($detail_pro->price,0) }}</h5>
                        @endif
                        <p>
                        <h4>Short Description:</h4>
                        <p>{{ $detail_pro->description }}</p>
                        <ul>
                            <li>
                                <div class="form-group size-st">
                                    <label class="size-label">Size</label>
                                    <select id="basic" class="selectpicker show-tick form-control size">
                                    @foreach($sizes as $item)
                                    <?php
                                    $permitted_chars = '123456789';
                                    $string1 = substr(str_shuffle($permitted_chars), 0, 36);
                                    $string2 = substr(str_shuffle($permitted_chars), 0, 5);
                                    $result1 = $string1 . $item->id . $string2;
                                    ?>
                                    <option value="{{ $result1 }}">{{ $item->name }}<label></label></option>
                                    @endforeach
                                    </select>
                                    <?php
                                    $permitted_chars = '+-=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                                    $string3 = substr(str_shuffle($permitted_chars), 0, 36);
                                    $string4 = substr(str_shuffle($permitted_chars), 0, 36);
                                    $result2 = $string3 . base64_encode($detail_pro->id) . $string4;
                                    ?>
                                    <input class="form-control product-id" value="{{ $result2 }}" type="hidden">
                                </div>
                            </li>
                        </ul>
                        <div class="price-box-bar">
                            <div class="cart-and-bay-btn">
                                <a class="btn hvr-hover add-to-cart">Add to cart</a>
                                <a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Add to wishlist</a>
                            </div>
                        </div>

                        <div class="add-to-btn">
                            <div class="share-bar">
                                <a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Featured Products</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        @foreach($lienquan_pro as $item)
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="{{ asset('images/' . $item->pro_image) }}" class="img-fluid" alt="Image">
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="{{ route('detail',$item->id) }}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>                                       
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <a class="cart" href="#">Add to Cart</a>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4>{{ $item->name }}</h4>
                                    <h5>
                                        @if($item->promotion_price > 0)
                                        <del>{{ number_format($item->promotion_price) }}</del> {{ number_format($item->promotion_price) }}
                                        @else
                                        {{ number_format($item->price) }}
                                        @endif
                                    </h5>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->
    <!-- Start Instagram Feed  -->
@endsection