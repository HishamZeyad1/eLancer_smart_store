import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/models/product_details.dart';

class ProductDetailsScreen extends StatefulWidget {
  // const ProductDetailsScreen({Key? key}) : super(key: key);
  late int id;

  ProductDetailsScreen(this.id);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late TapGestureRecognizer _recognizer;
  late Future<ProductDetails?> _future;
  late ProductDetails productsDetails = ProductDetails();

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Jacket",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () => print(""),
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.red,
              )),
        ],
      ),
      body: Container(
        child: FutureBuilder<ProductDetails?>(
            future: _future,
            builder: (context, snapshot) {
              print("===============snapshot.data========================");
              // print(snapshot.data!);
              // print(snapshot.hasData && snapshot.data! !=null);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    width: double.infinity,
                    height: 600.h,
                    child: CircularProgressIndicator());
              } 
              else if (snapshot.hasData && snapshot.data! != null) {
                productsDetails = snapshot.data!;
                return ListView(
                  children: [
                    Container(
                      height: 480.h,
                      // width: 300.w,
                      // constraints:BoxConstraints(
                      //   minHeight: 0,
                      //   maxHeight: 700.h,
                      // ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            // image: ExactAssetImage(
                            //   'images/jacket.jpeg',
                            // ),
                            image: NetworkImage(
                                productsDetails.imageUrl
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // 'Chequered overshirt',
                              productsDetails.nameEn,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              // '\$30',
                              '\$'+productsDetails.price.toString(),
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
                                    // "4.9
                                    productsDetails.overalRate.toString(),

                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(254, 120, 37, 1)),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "(12 reviews)",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(151, 151, 151, 1)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 23,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                ],
                              ),
                            ]),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Color",
                                  style: TextStyle(
                                      color: Color.fromRGBO(151, 151, 151, 1)),
                                ),
                                SizedBox(height: 6.h,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
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
                                text:
                                  productsDetails.infoEn,
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
                );
              } else {
                return Container(
                    width: double.infinity,
                    height: 600.h,
                    child: Text("No Data"));
              }
            }),
      ),
    );
  }
}
