import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/widgets/LabelTextField.dart';

class ProductScreen extends StatefulWidget {
  // const ProductScreen({Key? key}) : super(key: key);
  late int id;

  ProductScreen(this.id);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentIndex = 0;
  late Future<List<Product>> _future;
  late List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryApiController().products(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 243, 1),
      appBar: AppBar(
        // backgroundColor: Colors.grey.shade900,
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
        elevation: 5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        //SvgPicture.asset('images/personlogo.svg')),
        // titleSpacing: 0,
        centerTitle: true,
        // leadingWidth: 1,
        // title:Text("dlldl "),
        title: Text('products'),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: SvgPicture.asset('images/settinglogo.svg')),
        // ],
      ),
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.symmetric(horizontal: 24.w),
      //   clipBehavior: Clip.antiAlias,
      //   decoration: BoxDecoration(
      //       borderRadius:
      //           BorderRadiusDirectional.vertical(top: Radius.circular(20))),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.white,
      //     type: BottomNavigationBarType.fixed,
      //     //fixedColor: Colors.green,
      //     selectedItemColor: Color.fromRGBO(229, 69, 0, 0.81),
      //     unselectedItemColor: Colors.grey.shade200,
      //     // selectedFontSize: 35,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: false,
      //     iconSize: 30,
      //     onTap: (int value) {
      //       setState(() {
      //         _currentIndex = value;
      //         print("$value");
      //       });
      //     },
      //     currentIndex: _currentIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //           activeIcon: Icon(
      //             Icons.home,
      //             size: 40.h,
      //           ),
      //           icon: Icon(
      //             Icons.home_outlined,
      //             size: 30.h,
      //           ),
      //           label: "Home"),
      //       BottomNavigationBarItem(
      //           activeIcon: Icon(
      //             Icons.category,
      //             size: 40.h,
      //           ),
      //           icon: Icon(
      //             Icons.category_outlined,
      //             size: 25.h,
      //           ),
      //           label: "Category"),
      //       BottomNavigationBarItem(
      //         activeIcon: Icon(
      //           Icons.favorite,
      //           size: 40.h,
      //         ),
      //         icon: Icon(
      //           Icons.favorite_outline,
      //           size: 30.h,
      //         ),
      //         label: "Favorit",
      //       ),
      //       BottomNavigationBarItem(
      //         activeIcon: Icon(
      //           Icons.shopping_bag,
      //           size: 40.h,
      //         ),
      //         icon: Icon(
      //           Icons.shopping_bag_outlined,
      //           size: 30.h,
      //         ),
      //         label: "setting",
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            children: [
              Container(
                height: 50,
                child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 1,mainAxisSpacing: 10.h,
                    //     // crossAxisSpacing: 10.w,
                    //     /*childAspectRatio: 0.8*/),
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: Color.fromRGBO(229, 69, 0, 0.81),
                          // shape:RoundedRectangle(borderRaduis:BorderRadius.all(Radius.circular(10)),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Short",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: Colors.grey,
                          // shape:RoundedRectangle(borderRaduis:BorderRadius.all(Radius.circular(10)),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Jacket",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: Colors.grey,
                          // shape:RoundedRectangle(borderRaduis:BorderRadius.all(Radius.circular(10)),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Bantalon Tawal",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          primary: Colors.grey,
                          // shape:RoundedRectangle(borderRaduis:BorderRadius.all(Radius.circular(10)),),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "200 items",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(151, 151, 151, 1)),
              ),
              SizedBox(
                height: 12.h,
              ),
              FutureBuilder<List<Product>>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: double.infinity,
                          height: 600.h,
                          child: CircularProgressIndicator());
                    }
                    else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      products=snapshot.data??[];
                      return GridView.builder(
                          itemCount: products.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8, //16,
                            crossAxisSpacing: 8, //16,
                            childAspectRatio: .75, //190 / 175,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        // clipBehavior:Clip.antiAlias,
                                        // padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                                        // padding: EdgeInsets.only(top: 12.h, right: 20.w),width: 5,height: 5,
                                        height: 195.h,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.white, width: 4),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  products[index].imageUrl,
                                                // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              products[index].nameEn,textAlign: TextAlign.start,
                                              // "Strappy top with lace trim detail",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      49, 49, 49, 1),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(
                                              height: 14.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  // '\$20',
                                                  products[index].price.toString(),
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          229, 69, 0, 0.81),
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 22.sp),
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: Colors
                                                          .grey,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: Colors
                                                          .green,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor: Colors
                                                          .blue,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    padding: EdgeInsets.all(0),
                                    // alignment: Alignment.center,
                                    color: Colors.white,
                                    child: IconButton(
                                        alignment: Alignment.center,
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_outline)),
                                  ),
                                  top: 2.h,
                                  right: 2.w,
                                )
                              ]),
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(products[index].id),)),
                            );
                          }
                        // children: [
                        //
                        //   // Container(
                        //   //   // color: Colors.red,
                        //   //   // clipBehavior:Clip.antiAlias,
                        //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                        //   //   decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.white, width: 4),
                        //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   //     image: DecorationImage(
                        //   //         image: NetworkImage(
                        //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
                        //   //         fit: BoxFit.cover),
                        //   //   ),
                        //   //   child: Container(
                        //   //     alignment: Alignment.bottomLeft,
                        //   //     child: Text(
                        //   //       "Jacket",
                        //   //       style: TextStyle(
                        //   //         fontSize: 18.sp,
                        //   //         color: Colors.white,
                        //   //         fontWeight: FontWeight.w600,
                        //   //       ),
                        //   //       // textAlign: TextAlign.justify,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   // Container(
                        //   //   // color: Colors.red,
                        //   //   // clipBehavior:Clip.antiAlias,
                        //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                        //   //   decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.white, width: 4),
                        //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   //     image: DecorationImage(
                        //   //         image: NetworkImage(
                        //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                        //   //         ),
                        //   //         fit: BoxFit.cover),
                        //   //   ),
                        //   //   child: Container(
                        //   //     alignment: Alignment.bottomLeft,
                        //   //     child: Text(
                        //   //       "Tops",
                        //   //       style: TextStyle(
                        //   //         fontSize: 18.sp,
                        //   //         color: Colors.white,
                        //   //         fontWeight: FontWeight.w600,
                        //   //       ),
                        //   //       // textAlign: TextAlign.justify,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   // Container(
                        //   //   // color: Colors.red,
                        //   //   // clipBehavior:Clip.antiAlias,
                        //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                        //   //   decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.white, width: 4),
                        //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   //     image: DecorationImage(
                        //   //         image: NetworkImage(
                        //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
                        //   //         fit: BoxFit.cover),
                        //   //   ),
                        //   //   child: Container(
                        //   //     alignment: Alignment.bottomLeft,
                        //   //     child: Text(
                        //   //       "Jacket",
                        //   //       style: TextStyle(
                        //   //         fontSize: 18.sp,
                        //   //         color: Colors.white,
                        //   //         fontWeight: FontWeight.w600,
                        //   //       ),
                        //   //       // textAlign: TextAlign.justify,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   // Container(
                        //   //   // color: Colors.red,
                        //   //   // clipBehavior:Clip.antiAlias,
                        //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                        //   //   decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.white, width: 4),
                        //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   //     image: DecorationImage(
                        //   //         image: NetworkImage(
                        //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                        //   //         ),
                        //   //         fit: BoxFit.cover),
                        //   //   ),
                        //   //   child: Container(
                        //   //     alignment: Alignment.bottomLeft,
                        //   //     child: Text(
                        //   //       "Tops",
                        //   //       style: TextStyle(
                        //   //         fontSize: 18.sp,
                        //   //         color: Colors.white,
                        //   //         fontWeight: FontWeight.w600,
                        //   //       ),
                        //   //       // textAlign: TextAlign.justify,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   // Container(
                        //   //   // color: Colors.red,
                        //   //   // clipBehavior:Clip.antiAlias,
                        //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                        //   //   decoration: BoxDecoration(
                        //   //     border: Border.all(color: Colors.white, width: 4),
                        //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   //     image: DecorationImage(
                        //   //         image: NetworkImage(
                        //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
                        //   //         fit: BoxFit.cover),
                        //   //   ),
                        //   //   child: Container(
                        //   //     alignment: Alignment.bottomLeft,
                        //   //     child: Text(
                        //   //       "Jacket",
                        //   //       style: TextStyle(
                        //   //         fontSize: 18.sp,
                        //   //         color: Colors.white,
                        //   //         fontWeight: FontWeight.w600,
                        //   //       ),
                        //   //       // textAlign: TextAlign.justify,
                        //   //     ),
                        //   //   ),
                        //   // ),
                        // ]),
                        // SizedBox(
                        //   height: 24.h,
                        // ),
                      );
                    }else{
                      return Container(
                          width: double.infinity,
                          height: 600.h,
                          child: Text("No Data"));
                    }
                  }
              ),
            ]),
      ),
    );
  }
}
