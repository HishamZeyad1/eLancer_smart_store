import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/api/controllers/rate_api_controller.dart';
import 'package:smart_store/get/favorite_getx_controller.dart';
import 'package:smart_store/get/product_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/product_details.dart';
import 'package:smart_store/models/slider.dart';
import 'package:smart_store/screens/Home/image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  // const ProductDetailsScreen({Key? key}) : super(key: key);
  late int id;

  ProductDetailsScreen(this.id);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with Helpers {
  late TapGestureRecognizer _recognizer;
  late Future<ProductDetails?> _future;
  late ProductDetails? productsDetails = null;
  bool isFavorite = false;
  List<Sliders> sliders = <Sliders>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recognizer = TapGestureRecognizer();
    _recognizer.onTap = ReadMore;
    _future = CategoryApiController().productDetails(widget.id.toString());
  }

  void ReadMore() {}

  @override
  void dispose() {
    // TODO: implement dispose
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Navigator.pop(context),
      //       icon: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.grey,
      //       )),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     "Jacket",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () => print(""),
      //         icon: Icon(
      //           Icons.favorite_outline,
      //           color: Colors.red,
      //         )),
      //   ],
      // ),
      body:*/
    return Scaffold(
      body: FutureBuilder<ProductDetails?>(
          future: _future,
          builder: (context, snapshot) {
            print("===============snapshot.data========================");
            // print(snapshot.data!);
            print(snapshot.hasData /*&& snapshot.data! !=null*/);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  width: double.infinity,
                  height: 600.h,
                  child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data! != null) {
              productsDetails = snapshot.data!;

              print("productsDetails:${productsDetails!.product.id}");
              isFavorite = productsDetails!.product.isFavorite;
              print("==========isFavorite===============");
              print(isFavorite);
              sliders=productsDetails!.images.map((e) => Sliders(e.id, e.objectId, e.url, e.imageUrl)).toList();
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                      )),
                  backgroundColor: Colors.transparent,
                  // backgroundColor: Color.fromRGBO(229, 69, 0, 0.81).,

                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Jacket",
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        // await changeFavorite(productsDetails!);
                        // setState(() { });
                      },
                      icon: isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            ),enableFeedback: false,
                    ),
                  ],
                ),
                body: ListView(
                  children: [
                    // Container(
                    //   height: 480.h,
                    //   // width: 300.w,
                    //   // constraints:BoxConstraints(
                    //   //   minHeight: 0,
                    //   //   maxHeight: 700.h,
                    //   // ),
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: 10.w,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.white, width: 4),
                    //     borderRadius: BorderRadius.all(Radius.circular(10)),
                    //     image: DecorationImage(
                    //         // image: ExactAssetImage(
                    //         //   'images/jacket.jpeg',
                    //         // ),
                    //         image:
                    //             NetworkImage(productsDetails!.product.imageUrl),
                    //         fit: BoxFit.cover),
                    //   ),
                    // ),

                    imageSlider(sliders,scale: 1.2,disable:true),

                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // 'Chequered overshirt',
                              productsDetails!.product.nameEn,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              // '\$30',
                              '\$' + productsDetails!.product.price.toString(),
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(229, 69, 0, 0.81)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(254, 120, 37, 1),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    // "4.9",
                                    productsDetails!.product.overalRate
                                        .toString(),

                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(254, 120, 37, 1)),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  // Text(
                                  //   "(12 reviews)",
                                  //   style: TextStyle(
                                  //       fontSize: 14.sp,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Color.fromRGBO(151, 151, 151, 1)),
                                  // ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.grey,
                              //       size: 23,
                              //     ),
                              //     SizedBox(
                              //       width: 1.w,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.grey,
                              //     ),
                              //     SizedBox(
                              //       width: 1.w,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.grey,
                              //     ),
                              //     SizedBox(
                              //       width: 1.w,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.grey,
                              //     ),
                              //     SizedBox(
                              //       width: 1.w,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: Colors.grey,
                              //     ),
                              //     SizedBox(
                              //       width: 1.w,
                              //     ),
                              //   ],
                              // ),

                              Container(
                                child: RatingBar.builder(
                                  initialRating:
                                      productsDetails!.product.productRate + 0.0,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.sp,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate:(value) => null, /*(rating) *//*async*//* {
                                    // await rateProduct(productsDetails!.product.id, rating);
                                    // setState(() {});
                                  },*/
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Text(
                        //           "Color",
                        //           style: TextStyle(
                        //               color: Color.fromRGBO(151, 151, 151, 1)),
                        //         ),
                        //         SizedBox(height: 6.h,),
                        //         Row(
                        //           children: [
                        //             CircleAvatar(
                        //               radius: 7,
                        //               backgroundColor: Colors.red,
                        //             ),
                        //             SizedBox(
                        //               width: 6.w,
                        //             ),
                        //             CircleAvatar(
                        //               radius: 7,
                        //               backgroundColor: Colors.grey,
                        //             ),
                        //             SizedBox(
                        //               width: 6.w,
                        //             ),
                        //             CircleAvatar(
                        //               radius: 7,
                        //               backgroundColor: Colors.green,
                        //             ),
                        //             SizedBox(
                        //               width: 6.w,
                        //             ),
                        //             CircleAvatar(
                        //               radius: 7,
                        //               backgroundColor: Colors.blue,
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 16.h,
                        // ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(49, 49, 49, 1)),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // Text(
                        //   "Chequered overshirt with snap-button fastening, front pockets and long sleeves....",
                        //   style: TextStyle(
                        //       fontSize: 16.sp,
                        //       fontWeight: FontWeight.w600,
                        //       color: Color.fromRGBO(151, 151, 151, 1)),
                        // ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(151, 151, 151, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                text: productsDetails!.product.infoEn,
                                // "hequered overshirt with snap-button fastening, front pockets and long sleeves....",
                              ),
                              // TextSpan(
                              //     text: "Read more",
                              //     recognizer: _recognizer,
                              //     style: TextStyle(
                              //         fontSize: 16.sp,
                              //         fontWeight: FontWeight.w600,
                              //         color: Color.fromRGBO(254, 120, 37, 1))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(229, 69, 0, 0.81),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 129.w, vertical: 18.h),
                              // shape:RoundedRectangle(borderRaduis:BorderRadius.all(Radius.circular(10)),),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Container(
                    width: double.infinity,
                    height: 600.h,
                    child: Text("No Data")),
              );
            }
          }),
    )
        /*,
    )*/
        ;
  }

  Future<void> rateProduct(int productId, double rate) async {
    BaseApi? bstatus = await RateApiController().RateProduct(productId, rate);
    String message;
    if (bstatus != null) {
      message = bstatus.message;
    } else {
      message = 'not don';
    }
    showSnackBar(context: context, message: message, error: !(bstatus != null));
  }

  Future<void> changeFavorite(ProductDetails productDetails) async {
    Product p = productDetails
        .product; //Product(id: product.product.id, nameEn: product.product.nameEn, nameAr: product.product.nameAr, infoEn: product.product.infoEn, infoAr: product.product.infoAr, price: product.product.price, quantity: product.product.quantity, overalRate: product.product.overalRate, subCategoryId: product.product.subCategoryId, productRate: product.product.productRate, offerPrice: product.product.offerPrice, isFavorite: product.product.isFavorite, imageUrl: product.product.imageUrl);
    BaseApi? bstatus = await FavoriteGetxController.to.ChangeFavorite(p);
    String message;
    if (bstatus != null) {
      message = bstatus.message;
      await ProductGetxController(productDetails.subCategory.id.toString())
          .ChangeProductFavorite(p);
      // print("changeFavorite:${b}");
    } else {
      message = 'not don';
    }
    showSnackBar(context: context, message: message, error: !(bstatus != null));
  }
}
