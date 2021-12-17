import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/api/controllers/rate_api_controller.dart';
import 'package:smart_store/get/favorite_getx_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/get/product_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProductScreen extends StatefulWidget {
  // const ProductScreen({Key? key}) : super(key: key);
  late int id;

  ProductScreen(this.id);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with Helpers {
  int _currentIndex = 0;
  late Future<List<Product>> _future;
  // late List<Product> products = [];
  // late bool isFavorite;
  // late List<Product> products = [];
  late bool isFavorite = true;
  ProductGetxController productcontroller =Get.put<ProductGetxController>(ProductGetxController());

  @override
  void initState() {
    // TODO: implement initState
    _future = CategoryApiController().products(widget.id.toString());
    // ProductGetxController.to.readProduct(widget.id);
    ss();
    // isFavorite = false;
    super.initState();
  }
  void ss() async{
    await ProductGetxController.to.readProduct(widget.id);
  }



  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;
    // ProductGetxController.to.ChangeId(widget.id);//Get.put<ProductGetxController>(ProductGetxController(widget.id.toString()));
    print("Build");
    print(isFavorite);
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 243, 1),
      appBar: AppBar(
        // backgroundColor: Colors.grey.shade900,
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
        elevation: 5,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            // setState(() {
            //   isFavorite=!isFavorite;
            //   print("isFavorite:$isFavorite");
            // });
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        //SvgPicture.asset('images/personlogo.svg')),
        // titleSpacing: 0,
        centerTitle: true,
        // leadingWidth: 1,
        // title:Text("dlldl "),
        title: Text(/*'products'*/AppLocalizations.of(context)!.product,),
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
              SizedBox(
                height: 12.h,
              ),
              Obx((){
              //   GetX<FavoriteGetxController>(builder: (controller) {
                  if (ProductGetxController.to.loading.value) {
                    return Loading();
                    // return const Center(child: CircularProgressIndicator());
                  }
                  else if (ProductGetxController.to.products.isNotEmpty) {
                    return GridView.builder(
                        itemCount: ProductGetxController.to.products.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8, //16,
                          crossAxisSpacing: 8, //16,
                          childAspectRatio: .75, //190 / 175,
                        ),
                        itemBuilder: (context, index) {

                          print("=================productScreen========================");
                          return GestureDetector(
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 210.h,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.white, width: 4),
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  ProductGetxController.to.products[index].imageUrl
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(color:Colors.deepOrange.shade300 ,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        // decoration: BoxDecoration(
                                        //   // border: Border.all(color: Colors.white, width: 4),
                                        //   borderRadius: BorderRadius.vertical(
                                        //       top: Radius.circular(10)),
                                        // ),

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    lang=='en'?
                                                    ProductGetxController.to.products[index].nameEn:
                                                    ProductGetxController.to.products[index].nameAr,
                                                    // products[index].nameEn,
                                                    textAlign: TextAlign.start,
                                                    // "Strappy top with lace trim detail",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            49, 49, 49, 1),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16.sp),
                                                  ),
                                                  Text(
                                                    // '\$20',
                                                    '\$' +
                                                        // products[index].price.toString(),
                                                        ProductGetxController.to.products[index].price.toString(),


                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            229, 69, 0, 0.81),
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 22.sp),
                                                  ),
                                                ],
                                              ),

                                              // SizedBox(
                                              //   height: 14.h,
                                              // ),
                                              // Row(
                                              //   // mainAxisAlignment:
                                              //   // MainAxisAlignment
                                              //   //     .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //       // '\$20',
                                              //       '\$' +
                                              //           // products[index].price.toString(),
                                              //           ProductGetxController.to.products[index].price.toString(),
                                              //
                                              //
                                              //       style: TextStyle(
                                              //           color: Color.fromRGBO(
                                              //               229, 69, 0, 0.81),
                                              //           fontWeight:
                                              //           FontWeight.w600,
                                              //           fontSize: 22.sp),
                                              //     ),
                                              //     RatingBar.builder(
                                              //       initialRating:ProductGetxController.to.products[index].productRate,//FavoriteGetxController.to.productRate(ProductGetxController.to.products[index]),//ProductGetxController.to.products[index].productRate, //products[index].productRate+0.0,
                                              //       minRating: 0,
                                              //       direction: Axis.horizontal,
                                              //       allowHalfRating: true,
                                              //       itemCount: 5,
                                              //       itemSize: 20.sp,
                                              //       itemPadding:
                                              //       EdgeInsets.symmetric(
                                              //           horizontal: 1),
                                              //       itemBuilder: (context, _) =>
                                              //           Icon(
                                              //             Icons.star,
                                              //             color: Colors.amber,
                                              //           ),
                                              //       onRatingUpdate: (rating) async{
                                              //
                                              //         await rateProduct(/*ProductGetxController.to.products[index]*/ProductGetxController.to.products[index].id, rating);
                                              //         setState(() {});
                                              //       },
                                              //     ),
                                              //     Row(
                                              //       children: [
                                              //         Icon(
                                              //           Icons.star,
                                              //           color: Colors.grey,
                                              //           size: 18,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 0.8.w,
                                              //         ),
                                              //         Icon(
                                              //           Icons.star,
                                              //           color: Colors.grey,
                                              //           size: 18.w,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 0.8.w,
                                              //         ),
                                              //         Icon(
                                              //           Icons.star,
                                              //           color: Colors.grey,
                                              //           size: 18,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 0.8.w,
                                              //         ),
                                              //         Icon(
                                              //           Icons.star,
                                              //           color: Colors.grey,
                                              //           size: 18,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 0.8.w,
                                              //         ),
                                              //         Icon(
                                              //           Icons.star,
                                              //           color: Colors.grey,
                                              //           size: 18,
                                              //         ),
                                              //         SizedBox(
                                              //           width: 0.8.w,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ),
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
                                        onPressed: () async {
                                          await changeFavorite(ProductGetxController.to.products[index]/*products[index]*/);
                                          setState(() {//controller.isFavorite(productcontroller.products.value[])
                                            //   isFavorite=!isFavorite;
                                          });
                                        },
                                        icon: FavoriteGetxController.to.isFavorite(ProductGetxController.to.products[index])//ProductGetxController.to.products[index].isFavorite
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(Icons.favorite_outline)),
                                  ),
                                  top: 2.h,
                                  right: 2.w,
                                )
                              ]),
                              onTap: () async{
                                print("beforesetState");
                                print(isFavorite);
                                print("===================================================");
                                double detailsRate=await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(ProductGetxController.to.products[index].id
                                            /* products[index].id*/),
                                    ));
                               print("detailsRate:$detailsRate");
                               setState(() {
                                  ProductGetxController.to.products[index].isFavorite=FavoriteGetxController.to.isFavorite(ProductGetxController.to.products[index]);
                                  ProductGetxController.to.products[index].productRate=detailsRate;

                                });
                              });
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
                  }
                  else{
                    return NoData(context);
                    // return Center(
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Icon(
                    //         Icons.warning,
                    //         size: 80,
                    //         color: Colors.grey.shade400,
                    //       ),
                    //       Text(
                    //         'NO DATA',
                    //         style: TextStyle(
                    //           color: Colors.grey.shade400,
                    //           fontSize: 22,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // );
                  }
                // },),
                // controller.to.loading.value


              }),

              // GetX<ProductGetxController>(
              //   // child:
              //   builder: (controller) {
              //     // controller.to.loading.value 
              //     if (ProductGetxController.to.loading.value) {
              //     return const Center(child: CircularProgressIndicator());
              //     }
              //     else if (ProductGetxController.to.products.isNotEmpty) {
              //     return GridView.builder(
              //         itemCount: controller.products.length,
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         gridDelegate:
              //         SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           mainAxisSpacing: 8, //16,
              //           crossAxisSpacing: 8, //16,
              //           childAspectRatio: .75, //190 / 175,
              //         ),
              //         itemBuilder: (context, index) {
              //           // print("===========products[index].isFavorite===========");
              //           // print("before: $isFavorite");
              //           // isFavorite = controller.products[index].isFavorite;//products[index].isFavorite;
              //           // print("============isFavorite================");
              //           // print("after:$isFavorite");
              //           print("=================productScreen========================");
              //           // ProductGetxController.to.products.value[]
              //           print(controller.products[index].isFavorite);
              //           return GestureDetector(
              //               child: Stack(children: [
              //                 Container(
              //                   decoration: BoxDecoration(
              //                     border: Border.all(
              //                         color: Colors.white, width: 4),
              //                     borderRadius:
              //                     BorderRadius.all(Radius.circular(10)),
              //                   ),
              //                   child: Column(
              //                     children: [
              //                       Container(
              //                         // color: Colors.red,
              //                         // clipBehavior:Clip.antiAlias,
              //                         // padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //                         // padding: EdgeInsets.only(top: 12.h, right: 20.w),width: 5,height: 5,
              //                         height: 195.h,
              //                         decoration: BoxDecoration(
              //                           // border: Border.all(color: Colors.white, width: 4),
              //                           borderRadius: BorderRadius.vertical(
              //                               top: Radius.circular(10)),
              //                           image: DecorationImage(
              //                               image: NetworkImage(
              //                                   controller.products[index].imageUrl
              //                                 // products[index].imageUrl,
              //                                 // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //                               ),
              //                               fit: BoxFit.cover),
              //                         ),
              //                       ),
              //                       Container(
              //                         padding: EdgeInsets.symmetric(
              //                             horizontal: 8.w),
              //                         child: Column(
              //                           children: [
              //                             SizedBox(
              //                               height: 4.h,
              //                             ),
              //                             Text(
              //                               lang=='en'?
              //                               controller.products[index].nameEn:
              //                               controller.products[index].nameAr,
              //                               // products[index].nameEn,
              //                               textAlign: TextAlign.start,
              //                               // "Strappy top with lace trim detail",
              //                               style: TextStyle(
              //                                   color: Color.fromRGBO(
              //                                       49, 49, 49, 1),
              //                                   fontWeight: FontWeight.w500,
              //                                   fontSize: 16.sp),
              //                             ),
              //                             SizedBox(
              //                               height: 14.h,
              //                             ),
              //                             Row(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment
              //                                   .spaceBetween,
              //                               children: [
              //                                 Text(
              //                                   // '\$20',
              //                                   '\$' +
              //                                       // products[index].price.toString(),
              //                             controller.products[index].price.toString(),
              //
              //
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           229, 69, 0, 0.81),
              //                                       fontWeight:
              //                                       FontWeight.w600,
              //                                       fontSize: 22.sp),
              //                                 ),
              //                                 // Row(
              //                                 //   children: [
              //                                 //     CircleAvatar(
              //                                 //       radius: 7,
              //                                 //       backgroundColor: Colors.red,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 3.w,
              //                                 //     ),
              //                                 //     CircleAvatar(
              //                                 //       radius: 7,
              //                                 //       backgroundColor: Colors
              //                                 //           .grey,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 3.w,
              //                                 //     ),
              //                                 //     CircleAvatar(
              //                                 //       radius: 7,
              //                                 //       backgroundColor: Colors
              //                                 //           .green,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 3.w,
              //                                 //     ),
              //                                 //     CircleAvatar(
              //                                 //       radius: 7,
              //                                 //       backgroundColor: Colors
              //                                 //           .blue,
              //                                 //     ),
              //                                 //   ],
              //                                 // )
              //                                 RatingBar.builder(
              //                                   initialRating:controller.products[index].productRate, //products[index].productRate+0.0,
              //                                   minRating: 0,
              //                                   direction: Axis.horizontal,
              //                                   allowHalfRating: true,
              //                                   itemCount: 5,
              //                                   itemSize: 20.sp,
              //                                   itemPadding:
              //                                   EdgeInsets.symmetric(
              //                                       horizontal: 1),
              //                                   itemBuilder: (context, _) =>
              //                                       Icon(
              //                                         Icons.star,
              //                                         color: Colors.amber,
              //                                       ),
              //                                   onRatingUpdate: (rating) async{
              //                                     await rateProduct(controller.products[index].id/*products[index].id*/, rating);
              //                                     setState(() {});
              //                                   },
              //                                 ),
              //                                 // Row(
              //                                 //   children: [
              //                                 //     Icon(
              //                                 //       Icons.star,
              //                                 //       color: Colors.grey,
              //                                 //       size: 18,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 0.8.w,
              //                                 //     ),
              //                                 //     Icon(
              //                                 //       Icons.star,
              //                                 //       color: Colors.grey,
              //                                 //       size: 18.w,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 0.8.w,
              //                                 //     ),
              //                                 //     Icon(
              //                                 //       Icons.star,
              //                                 //       color: Colors.grey,
              //                                 //       size: 18,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 0.8.w,
              //                                 //     ),
              //                                 //     Icon(
              //                                 //       Icons.star,
              //                                 //       color: Colors.grey,
              //                                 //       size: 18,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 0.8.w,
              //                                 //     ),
              //                                 //     Icon(
              //                                 //       Icons.star,
              //                                 //       color: Colors.grey,
              //                                 //       size: 18,
              //                                 //     ),
              //                                 //     SizedBox(
              //                                 //       width: 0.8.w,
              //                                 //     ),
              //                                 //   ],
              //                                 // ),
              //                               ],
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Positioned(
              //                   child: Container(
              //                     width: 40.w,
              //                     height: 40.h,
              //                     padding: EdgeInsets.all(0),
              //                     // alignment: Alignment.center,
              //                     color: Colors.white,
              //                     child: IconButton(
              //                         alignment: Alignment.center,
              //                         onPressed: () async {
              //                           await changeFavorite(controller.products[index]/*products[index]*/);
              //                           setState(() {
              //                             //   isFavorite=!isFavorite;
              //                           });
              //                         },
              //                         icon: controller.products[index].isFavorite
              //                             ? Icon(
              //                           Icons.favorite,
              //                           color: Colors.red,
              //                         )
              //                             : Icon(Icons.favorite_outline)),
              //                   ),
              //                   top: 2.h,
              //                   right: 2.w,
              //                 )
              //               ]),
              //               onTap: () {
              //                 print("beforesetState");
              //                 print(isFavorite);
              //                 // print("product: ${products[index].id}");
              //                 // setState(() {
              //                 //   isFavorite=!isFavorite;
              //                 //   print("After setState:$isFavorite");
              //                 // });
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) =>
              //                           ProductDetailsScreen(controller.products[index].id
              //                              /* products[index].id*/),
              //                     ));
              //               });
              //         }
              //       // children: [
              //       //
              //       //   // Container(
              //       //   //   // color: Colors.red,
              //       //   //   // clipBehavior:Clip.antiAlias,
              //       //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //       //   //   decoration: BoxDecoration(
              //       //   //     border: Border.all(color: Colors.white, width: 4),
              //       //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //       //   //     image: DecorationImage(
              //       //   //         image: NetworkImage(
              //       //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //       //   //         fit: BoxFit.cover),
              //       //   //   ),
              //       //   //   child: Container(
              //       //   //     alignment: Alignment.bottomLeft,
              //       //   //     child: Text(
              //       //   //       "Jacket",
              //       //   //       style: TextStyle(
              //       //   //         fontSize: 18.sp,
              //       //   //         color: Colors.white,
              //       //   //         fontWeight: FontWeight.w600,
              //       //   //       ),
              //       //   //       // textAlign: TextAlign.justify,
              //       //   //     ),
              //       //   //   ),
              //       //   // ),
              //       //   // Container(
              //       //   //   // color: Colors.red,
              //       //   //   // clipBehavior:Clip.antiAlias,
              //       //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //       //   //   decoration: BoxDecoration(
              //       //   //     border: Border.all(color: Colors.white, width: 4),
              //       //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //       //   //     image: DecorationImage(
              //       //   //         image: NetworkImage(
              //       //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //       //   //         ),
              //       //   //         fit: BoxFit.cover),
              //       //   //   ),
              //       //   //   child: Container(
              //       //   //     alignment: Alignment.bottomLeft,
              //       //   //     child: Text(
              //       //   //       "Tops",
              //       //   //       style: TextStyle(
              //       //   //         fontSize: 18.sp,
              //       //   //         color: Colors.white,
              //       //   //         fontWeight: FontWeight.w600,
              //       //   //       ),
              //       //   //       // textAlign: TextAlign.justify,
              //       //   //     ),
              //       //   //   ),
              //       //   // ),
              //       //   // Container(
              //       //   //   // color: Colors.red,
              //       //   //   // clipBehavior:Clip.antiAlias,
              //       //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //       //   //   decoration: BoxDecoration(
              //       //   //     border: Border.all(color: Colors.white, width: 4),
              //       //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //       //   //     image: DecorationImage(
              //       //   //         image: NetworkImage(
              //       //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //       //   //         fit: BoxFit.cover),
              //       //   //   ),
              //       //   //   child: Container(
              //       //   //     alignment: Alignment.bottomLeft,
              //       //   //     child: Text(
              //       //   //       "Jacket",
              //       //   //       style: TextStyle(
              //       //   //         fontSize: 18.sp,
              //       //   //         color: Colors.white,
              //       //   //         fontWeight: FontWeight.w600,
              //       //   //       ),
              //       //   //       // textAlign: TextAlign.justify,
              //       //   //     ),
              //       //   //   ),
              //       //   // ),
              //       //   // Container(
              //       //   //   // color: Colors.red,
              //       //   //   // clipBehavior:Clip.antiAlias,
              //       //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //       //   //   decoration: BoxDecoration(
              //       //   //     border: Border.all(color: Colors.white, width: 4),
              //       //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //       //   //     image: DecorationImage(
              //       //   //         image: NetworkImage(
              //       //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //       //   //         ),
              //       //   //         fit: BoxFit.cover),
              //       //   //   ),
              //       //   //   child: Container(
              //       //   //     alignment: Alignment.bottomLeft,
              //       //   //     child: Text(
              //       //   //       "Tops",
              //       //   //       style: TextStyle(
              //       //   //         fontSize: 18.sp,
              //       //   //         color: Colors.white,
              //       //   //         fontWeight: FontWeight.w600,
              //       //   //       ),
              //       //   //       // textAlign: TextAlign.justify,
              //       //   //     ),
              //       //   //   ),
              //       //   // ),
              //       //   // Container(
              //       //   //   // color: Colors.red,
              //       //   //   // clipBehavior:Clip.antiAlias,
              //       //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //       //   //   decoration: BoxDecoration(
              //       //   //     border: Border.all(color: Colors.white, width: 4),
              //       //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //       //   //     image: DecorationImage(
              //       //   //         image: NetworkImage(
              //       //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //       //   //         fit: BoxFit.cover),
              //       //   //   ),
              //       //   //   child: Container(
              //       //   //     alignment: Alignment.bottomLeft,
              //       //   //     child: Text(
              //       //   //       "Jacket",
              //       //   //       style: TextStyle(
              //       //   //         fontSize: 18.sp,
              //       //   //         color: Colors.white,
              //       //   //         fontWeight: FontWeight.w600,
              //       //   //       ),
              //       //   //       // textAlign: TextAlign.justify,
              //       //   //     ),
              //       //   //   ),
              //       //   // ),
              //       // ]),
              //       // SizedBox(
              //       //   height: 24.h,
              //       // ),
              //     );
              //   }else{
              //       return Center(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Icon(
              //               Icons.warning,
              //               size: 80,
              //               color: Colors.grey.shade400,
              //             ),
              //             Text(
              //               'NO DATA',
              //               style: TextStyle(
              //                 color: Colors.grey.shade400,
              //                 fontSize: 22,
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     }
              //   }
              // ),
              
              // FutureBuilder<List<Product>>(
              //     future: _future,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Container(
              //             width: double.infinity,
              //             height: 600.h,
              //             child: CircularProgressIndicator());
              //       } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              //         products = snapshot.data ?? [];
              //         return GridView.builder(
              //             itemCount: products.length,
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               mainAxisSpacing: 8, //16,
              //               crossAxisSpacing: 8, //16,
              //               childAspectRatio: .75, //190 / 175,
              //             ),
              //             itemBuilder: (context, index) {
              //               print("===========products[index].isFavorite===========");
              //               print("before: $isFavorite");
              //               isFavorite = products[index].isFavorite;
              //               print("============isFavorite================");
              //               print("after:$isFavorite");
              //               return GestureDetector(
              //                   child: Stack(children: [
              //                     Container(
              //                       decoration: BoxDecoration(
              //                         border: Border.all(
              //                             color: Colors.white, width: 4),
              //                         borderRadius:
              //                             BorderRadius.all(Radius.circular(10)),
              //                       ),
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             // color: Colors.red,
              //                             // clipBehavior:Clip.antiAlias,
              //                             // padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //                             // padding: EdgeInsets.only(top: 12.h, right: 20.w),width: 5,height: 5,
              //                             height: 195.h,
              //                             decoration: BoxDecoration(
              //                               // border: Border.all(color: Colors.white, width: 4),
              //                               borderRadius: BorderRadius.vertical(
              //                                   top: Radius.circular(10)),
              //                               image: DecorationImage(
              //                                   image: NetworkImage(
              //                                     products[index].imageUrl,
              //                                     // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //                                   ),
              //                                   fit: BoxFit.cover),
              //                             ),
              //                           ),
              //                           Container(
              //                             padding: EdgeInsets.symmetric(
              //                                 horizontal: 8.w),
              //                             child: Column(
              //                               children: [
              //                                 SizedBox(
              //                                   height: 4.h,
              //                                 ),
              //                                 Text(
              //                                   products[index].nameEn,
              //                                   textAlign: TextAlign.start,
              //                                   // "Strappy top with lace trim detail",
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           49, 49, 49, 1),
              //                                       fontWeight: FontWeight.w500,
              //                                       fontSize: 16.sp),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 14.h,
              //                                 ),
              //                                 Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment
              //                                           .spaceBetween,
              //                                   children: [
              //                                     Text(
              //                                       // '\$20',
              //                                       '\$' +
              //                                           products[index]
              //                                               .price
              //                                               .toString(),
              //                                       style: TextStyle(
              //                                           color: Color.fromRGBO(
              //                                               229, 69, 0, 0.81),
              //                                           fontWeight:
              //                                               FontWeight.w600,
              //                                           fontSize: 22.sp),
              //                                     ),
              //                                     // Row(
              //                                     //   children: [
              //                                     //     CircleAvatar(
              //                                     //       radius: 7,
              //                                     //       backgroundColor: Colors.red,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 3.w,
              //                                     //     ),
              //                                     //     CircleAvatar(
              //                                     //       radius: 7,
              //                                     //       backgroundColor: Colors
              //                                     //           .grey,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 3.w,
              //                                     //     ),
              //                                     //     CircleAvatar(
              //                                     //       radius: 7,
              //                                     //       backgroundColor: Colors
              //                                     //           .green,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 3.w,
              //                                     //     ),
              //                                     //     CircleAvatar(
              //                                     //       radius: 7,
              //                                     //       backgroundColor: Colors
              //                                     //           .blue,
              //                                     //     ),
              //                                     //   ],
              //                                     // )
              //                                     RatingBar.builder(
              //                                       initialRating: products[index].productRate+0.0,
              //                                       minRating: 0,
              //                                       direction: Axis.horizontal,
              //                                       allowHalfRating: true,
              //                                       itemCount: 5,
              //                                       itemSize: 20.sp,
              //                                       itemPadding:
              //                                           EdgeInsets.symmetric(
              //                                               horizontal: 1),
              //                                       itemBuilder: (context, _) =>
              //                                           Icon(
              //                                         Icons.star,
              //                                         color: Colors.amber,
              //                                       ),
              //                                       onRatingUpdate: (rating) async{
              //                                         await rateProduct(products[index].id, rating);
              //                                         setState(() {});
              //                                       },
              //                                     ),
              //                                     // Row(
              //                                     //   children: [
              //                                     //     Icon(
              //                                     //       Icons.star,
              //                                     //       color: Colors.grey,
              //                                     //       size: 18,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 0.8.w,
              //                                     //     ),
              //                                     //     Icon(
              //                                     //       Icons.star,
              //                                     //       color: Colors.grey,
              //                                     //       size: 18.w,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 0.8.w,
              //                                     //     ),
              //                                     //     Icon(
              //                                     //       Icons.star,
              //                                     //       color: Colors.grey,
              //                                     //       size: 18,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 0.8.w,
              //                                     //     ),
              //                                     //     Icon(
              //                                     //       Icons.star,
              //                                     //       color: Colors.grey,
              //                                     //       size: 18,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 0.8.w,
              //                                     //     ),
              //                                     //     Icon(
              //                                     //       Icons.star,
              //                                     //       color: Colors.grey,
              //                                     //       size: 18,
              //                                     //     ),
              //                                     //     SizedBox(
              //                                     //       width: 0.8.w,
              //                                     //     ),
              //                                     //   ],
              //                                     // ),
              //                                   ],
              //                                 )
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Positioned(
              //                       child: Container(
              //                         width: 40.w,
              //                         height: 40.h,
              //                         padding: EdgeInsets.all(0),
              //                         // alignment: Alignment.center,
              //                         color: Colors.white,
              //                         child: IconButton(
              //                             alignment: Alignment.center,
              //                             onPressed: () async {
              //                               await changeFavorite(products[index]);
              //                               setState(() {
              //                                 //   isFavorite=!isFavorite;
              //                               });
              //                             },
              //                             icon: isFavorite
              //                                 ? Icon(
              //                                     Icons.favorite,
              //                                     color: Colors.red,
              //                                   )
              //                                 : Icon(Icons.favorite_outline)),
              //                       ),
              //                       top: 2.h,
              //                       right: 2.w,
              //                     )
              //                   ]),
              //                   onTap: () {
              //                     print("beforesetState");
              //                     print(isFavorite);
              //                     print("product: ${products[index].id}");
              //                     // setState(() {
              //                     //   isFavorite=!isFavorite;
              //                     //   print("After setState:$isFavorite");
              //                     // });
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                           builder: (context) =>
              //                               ProductDetailsScreen(
              //                                   products[index].id),
              //                         ));
              //                   });
              //             }
              //             // children: [
              //             //
              //             //   // Container(
              //             //   //   // color: Colors.red,
              //             //   //   // clipBehavior:Clip.antiAlias,
              //             //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //             //   //   decoration: BoxDecoration(
              //             //   //     border: Border.all(color: Colors.white, width: 4),
              //             //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //             //   //     image: DecorationImage(
              //             //   //         image: NetworkImage(
              //             //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //             //   //         fit: BoxFit.cover),
              //             //   //   ),
              //             //   //   child: Container(
              //             //   //     alignment: Alignment.bottomLeft,
              //             //   //     child: Text(
              //             //   //       "Jacket",
              //             //   //       style: TextStyle(
              //             //   //         fontSize: 18.sp,
              //             //   //         color: Colors.white,
              //             //   //         fontWeight: FontWeight.w600,
              //             //   //       ),
              //             //   //       // textAlign: TextAlign.justify,
              //             //   //     ),
              //             //   //   ),
              //             //   // ),
              //             //   // Container(
              //             //   //   // color: Colors.red,
              //             //   //   // clipBehavior:Clip.antiAlias,
              //             //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //             //   //   decoration: BoxDecoration(
              //             //   //     border: Border.all(color: Colors.white, width: 4),
              //             //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //             //   //     image: DecorationImage(
              //             //   //         image: NetworkImage(
              //             //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //             //   //         ),
              //             //   //         fit: BoxFit.cover),
              //             //   //   ),
              //             //   //   child: Container(
              //             //   //     alignment: Alignment.bottomLeft,
              //             //   //     child: Text(
              //             //   //       "Tops",
              //             //   //       style: TextStyle(
              //             //   //         fontSize: 18.sp,
              //             //   //         color: Colors.white,
              //             //   //         fontWeight: FontWeight.w600,
              //             //   //       ),
              //             //   //       // textAlign: TextAlign.justify,
              //             //   //     ),
              //             //   //   ),
              //             //   // ),
              //             //   // Container(
              //             //   //   // color: Colors.red,
              //             //   //   // clipBehavior:Clip.antiAlias,
              //             //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //             //   //   decoration: BoxDecoration(
              //             //   //     border: Border.all(color: Colors.white, width: 4),
              //             //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //             //   //     image: DecorationImage(
              //             //   //         image: NetworkImage(
              //             //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //             //   //         fit: BoxFit.cover),
              //             //   //   ),
              //             //   //   child: Container(
              //             //   //     alignment: Alignment.bottomLeft,
              //             //   //     child: Text(
              //             //   //       "Jacket",
              //             //   //       style: TextStyle(
              //             //   //         fontSize: 18.sp,
              //             //   //         color: Colors.white,
              //             //   //         fontWeight: FontWeight.w600,
              //             //   //       ),
              //             //   //       // textAlign: TextAlign.justify,
              //             //   //     ),
              //             //   //   ),
              //             //   // ),
              //             //   // Container(
              //             //   //   // color: Colors.red,
              //             //   //   // clipBehavior:Clip.antiAlias,
              //             //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //             //   //   decoration: BoxDecoration(
              //             //   //     border: Border.all(color: Colors.white, width: 4),
              //             //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //             //   //     image: DecorationImage(
              //             //   //         image: NetworkImage(
              //             //   //           'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
              //             //   //         ),
              //             //   //         fit: BoxFit.cover),
              //             //   //   ),
              //             //   //   child: Container(
              //             //   //     alignment: Alignment.bottomLeft,
              //             //   //     child: Text(
              //             //   //       "Tops",
              //             //   //       style: TextStyle(
              //             //   //         fontSize: 18.sp,
              //             //   //         color: Colors.white,
              //             //   //         fontWeight: FontWeight.w600,
              //             //   //       ),
              //             //   //       // textAlign: TextAlign.justify,
              //             //   //     ),
              //             //   //   ),
              //             //   // ),
              //             //   // Container(
              //             //   //   // color: Colors.red,
              //             //   //   // clipBehavior:Clip.antiAlias,
              //             //   //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
              //             //   //   decoration: BoxDecoration(
              //             //   //     border: Border.all(color: Colors.white, width: 4),
              //             //   //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //             //   //     image: DecorationImage(
              //             //   //         image: NetworkImage(
              //             //   //             'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
              //             //   //         fit: BoxFit.cover),
              //             //   //   ),
              //             //   //   child: Container(
              //             //   //     alignment: Alignment.bottomLeft,
              //             //   //     child: Text(
              //             //   //       "Jacket",
              //             //   //       style: TextStyle(
              //             //   //         fontSize: 18.sp,
              //             //   //         color: Colors.white,
              //             //   //         fontWeight: FontWeight.w600,
              //             //   //       ),
              //             //   //       // textAlign: TextAlign.justify,
              //             //   //     ),
              //             //   //   ),
              //             //   // ),
              //             // ]),
              //             // SizedBox(
              //             //   height: 24.h,
              //             // ),
              //             );
              //       } else {
              //         return Container(
              //             width: double.infinity,
              //             height: 600.h,
              //             child: Text("No Data"));
              //       }
              //     }),
            ]),
      ),
    );
  }
  Future<void> changeFavorite(Product product) async {
    BaseApi? bstatus = await FavoriteGetxController.to.ChangeFavorite(product);
    String message;
    if (bstatus != null) {
      message = bstatus.message;
    } else {
      message = 'not don';
    }
    showSnackBar(context: context, message: message, error: !(bstatus != null));
  }
  // Future<void> rateProduct(Product product, double rate) async {
  //   BaseApi? bstatus = await FavoriteGetxController.to.ChangeRate(product, rate);
  //   String message;
  //   if (bstatus != null) {
  //     message = bstatus.message;
  //   } else {
  //     message = 'not don';
  //   }
  //   showSnackBar(context: context, message: message, error: !(bstatus != null));
  // }

  Future<void> rateProduct(int productId,double rate) async {
    BaseApi? bstatus = await RateApiController().RateProduct(productId, rate);
    String message="";
    if (bstatus != null) {
      message = bstatus.message;
    } else {
      message = 'not don';
    }
    showSnackBar(context: context, message: message, error: !(bstatus != null));
  }

}
