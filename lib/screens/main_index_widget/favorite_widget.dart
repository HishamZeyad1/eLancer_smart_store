import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:smart_store/get/favorite_getx_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/screens/product_details_screen.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> with Helpers {
  late List<Product> products = [];
  late bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;

    return Container(
      child: GetX<FavoriteGetxController>(
        builder: (controller) {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.favorite.isNotEmpty) {
            // print("length: ${controller.favorite.length}");
            return ListView.builder(
                itemCount: controller.favorite.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                // physics: NeverScrollableScrollPhysics(),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisCount: 1,
                // mainAxisSpacing: 8, //16,
                // crossAxisSpacing: 8, //16,
                // // childAspectRatio: .75, //190 / 175,
                // ),
                itemBuilder: (context, index) {
                  isFavorite = controller.favorite[index].product.isFavorite;
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.red,
                            // clipBehavior:Clip.antiAlias,
                            // padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                            // padding: EdgeInsets.only(top: 12.h, right: 20.w),width: 5,height: 5,
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    // products[index].imageUrl,
                                    controller.favorite[index].product.imageUrl,
                                    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 35.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    // products[index].nameEn,textAlign: TextAlign.start,
                                    // "Strappy top with lace trim detail fkfkfkf fkfkfkf fkfkk",
                                    lang=='en'?controller.favorite[index].product.nameEn:controller.favorite[index].product.nameAr,

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: Color.fromRGBO(49, 49, 49, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp),
                                    // softWrap: false,
                                    // overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        // '\$20',
                                        '\$' +
                                            controller
                                                .favorite[index].product.price
                                                .toString(),

                                        // '\$'+products[index].price.toString(),
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                229, 69, 0, 0.81),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22.sp),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     CircleAvatar(
                                      //       radius: 7,
                                      //       backgroundColor: Colors.red,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 3.w,
                                      //     ),
                                      //     CircleAvatar(
                                      //       radius: 7,
                                      //       backgroundColor: Colors
                                      //           .grey,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 3.w,
                                      //     ),
                                      //     CircleAvatar(
                                      //       radius: 7,
                                      //       backgroundColor: Colors
                                      //           .green,
                                      //     ),
                                      //     SizedBox(
                                      //       width: 3.w,
                                      //     ),
                                      //     CircleAvatar(
                                      //       radius: 7,
                                      //       backgroundColor: Colors
                                      //           .blue,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 10.h,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Colors.grey,
                                  //       size: 18,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 0.8.w,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Colors.grey,
                                  //       size: 18.w,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 0.8.w,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Colors.grey,
                                  //       size: 18,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 0.8.w,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Colors.grey,
                                  //       size: 18,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 0.8.w,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Colors.grey,
                                  //       size: 18,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 0.8.w,
                                  //     ),
                                  //   ],
                                  // ),
                                  // Container(
                                  //   width: 0.w,
                                  //   height: 0.h,
                                  //   padding: EdgeInsets.all(0),
                                  //   // alignment: Alignment.center,
                                  //   color: Colors.white,
                                  //   child: IconButton(
                                  //       alignment: Alignment.center,
                                  //       onPressed: () async {
                                  //         print("object");
                                  //         await changeFavorite(
                                  //             controller.favorite[index].product);
                                  //         setState(() {
                                  //           //   isFavorite=!isFavorite;
                                  //         });
                                  //       },
                                  //       icon: isFavorite
                                  //           ? Icon(
                                  //         Icons.favorite,
                                  //         color: Colors.red,
                                  //       )
                                  //           : Icon(Icons.favorite_outline)),
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.star,
                                  //       color: Color.fromRGBO(254, 120, 37, 1),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 4.w,
                                  //     ),
                                  //     Text(
                                  //       // "4.9
                                  //       // productsDetails!.overalRate.toString(),
                                  //       controller.favorite[index].product.overalRate.toString(),
                                  //
                                  //       style: TextStyle(
                                  //           fontSize: 14.sp,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Color.fromRGBO(254, 120, 37, 1)),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 4.w,
                                  //     ),
                                  //     Text(
                                  //       "(12 reviews)",
                                  //       style: TextStyle(
                                  //           fontSize: 14.sp,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Color.fromRGBO(151, 151, 151, 1)),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () => changeFavorite(
                                  controller.favorite[index].product),
                              icon: Icon(
                                Icons.restore_from_trash_sharp,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                    // Positioned(
                    //   child: Container(
                    //     width: 40.w,
                    //     height: 40.h,
                    //     padding: EdgeInsets.all(0),
                    //     // alignment: Alignment.center,
                    //     color: Colors.white,
                    //     child: IconButton(
                    //         alignment: Alignment.center,
                    //         onPressed: () {},
                    //         icon: Icon(Icons.favorite_outline)),
                    //   ),
                    //   top: 2.h,
                    //   right: 2.w,
                    // )
                    /*]),*/
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                              controller.favorite[index].product.id),
                        )),
                  );
                });
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            );
          }
        },
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
}
