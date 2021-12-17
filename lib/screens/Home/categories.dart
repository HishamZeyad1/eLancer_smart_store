import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/screens/product_screen.dart';
import 'package:smart_store/screens/sub_category_screen.dart';
class Categories extends StatefulWidget {
  // late List<Category> categories=<Category>[];

  late List cp;
  Categories(this.cp);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late List<Category> categories=<Category>[];
  late List<Product> products=<Product>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // categories=widget.categories;
  }
  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;

    print("=====widget.cp is Category=======");
    int? type;
    print(widget.cp is List<Category>);
    if(widget.cp is List<Category>){
      print("==============Category==========");
      categories= widget.cp.cast<Category>() ;
      type=1;
      print("categories:$categories");
    }else if(widget.cp is List<Product>){
      products= widget.cp.cast<Product>() ;
      type=2;
      print("products:$products");
    }

    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio:1 //272 / 175
             ),
        itemBuilder: (context, index) =>GestureDetector(
          child:
          // Container(
          //   width: 50.w,
          //   height: 50.h,
          //   padding: EdgeInsets.only(bottom: 5.h, left: 5.w),
          //
          //   // color: Colors.red,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.white, width: 1),
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     image: DecorationImage(
          //         image: NetworkImage(
          //           type==1?categories[index].imageUrl:products[index].imageUrl,
          //           // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          //         ),
          //         fit: BoxFit.cover),
          //   ),
          //   child: Container(
          //     alignment: Alignment.bottomLeft,
          //     child: Text(
          //       // "Tops",
          //       // categories[index].nameEn,
          //       type==1?
          //       lang=="en"?categories[index].nameEn:categories[index].nameAr
          //       :lang=="en"?products[index].nameEn:products[index].nameAr,
          //
          //       style: TextStyle(
          //         fontSize: 16.sp,
          //         color: Colors.orange.shade900,
          //         fontWeight: FontWeight.w600,
          //       ),
          //       // textAlign: TextAlign.justify,
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, width: 4),
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                            type==1?categories[index].imageUrl:products[index].imageUrl,
                          ),
                          fit: BoxFit.cover),
                    ),


                  ),
                ),
                SizedBox(height: 2.h,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color:Colors.deepOrange.shade200 ,
                    // border: Border.all(
                    //     color: Colors.white, width: 1),
                    borderRadius:BorderRadius.vertical(bottom:Radius.circular(7)),
                  ),

                  // padding: EdgeInsets.symmetric(
                  //     horizontal: 8.w),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                                type==1?
                                lang=="en"?categories[index].nameEn:categories[index].nameAr
                                :lang=="en"?products[index].nameEn:products[index].nameAr,
                          // products[index].nameEn,
                          textAlign: TextAlign.center,
                          // "Strappy top with lace trim detail",
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  49, 49, 49, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
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
              ],
            ),
          ),

          // Column(
          //   children: [
          //     Container(color:Colors.deepOrange.shade300 ,
          //       padding: EdgeInsets.symmetric(
          //           horizontal: 0.w),
          //       child: Column(mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           Container(
          //             width: double.infinity,
          //             height: 100.h,
          //             padding: EdgeInsets.only(bottom: 5.h, left: 5.w),
          //
          //             // color: Colors.red,
          //             decoration: BoxDecoration(
          //               border: Border.all(color: Colors.white, width: 1),
          //               borderRadius: BorderRadius.all(Radius.circular(10)),
          //               image: DecorationImage(
          //                   image: NetworkImage(
          //                     type==1?categories[index].imageUrl:products[index].imageUrl,
          //                     // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          //                   ),
          //                   fit: BoxFit.cover),
          //             ),),
          //           SizedBox(
          //             height: 1.h,
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 type==1?categories[index].nameEn:products[index].nameEn,                          // ProductGetxController.to.products[index].nameEn:
          //                 // ProductGetxController.to.products[index].nameAr,
          //                 // products[index].nameEn,
          //                 textAlign: TextAlign.start,
          //                 // "Strappy top with lace trim detail",
          //                 style: TextStyle(
          //                     color: Color.fromRGBO(
          //                         49, 49, 49, 1),
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 16.sp),
          //               ),
          //               // Text(
          //               //   // '\$20',
          //               //   '\$' +
          //               //       // products[index].price.toString(),
          //               //       ProductGetxController.to.products[index].price.toString(),
          //               //
          //               //
          //               //   style: TextStyle(
          //               //       color: Color.fromRGBO(
          //               //           229, 69, 0, 0.81),
          //               //       fontWeight:
          //               //       FontWeight.w600,
          //               //       fontSize: 22.sp),
          //               // ),
          //             ],
          //           ),
          //
          //           // SizedBox(
          //           //   height: 14.h,
          //           // ),
          //           // Row(
          //           //   // mainAxisAlignment:
          //           //   // MainAxisAlignment
          //           //   //     .spaceBetween,
          //           //   children: [
          //           //     Text(
          //           //       // '\$20',
          //           //       '\$' +
          //           //           // products[index].price.toString(),
          //           //           ProductGetxController.to.products[index].price.toString(),
          //           //
          //           //
          //           //       style: TextStyle(
          //           //           color: Color.fromRGBO(
          //           //               229, 69, 0, 0.81),
          //           //           fontWeight:
          //           //           FontWeight.w600,
          //           //           fontSize: 22.sp),
          //           //     ),
          //           //     RatingBar.builder(
          //           //       initialRating:ProductGetxController.to.products[index].productRate,//FavoriteGetxController.to.productRate(ProductGetxController.to.products[index]),//ProductGetxController.to.products[index].productRate, //products[index].productRate+0.0,
          //           //       minRating: 0,
          //           //       direction: Axis.horizontal,
          //           //       allowHalfRating: true,
          //           //       itemCount: 5,
          //           //       itemSize: 20.sp,
          //           //       itemPadding:
          //           //       EdgeInsets.symmetric(
          //           //           horizontal: 1),
          //           //       itemBuilder: (context, _) =>
          //           //           Icon(
          //           //             Icons.star,
          //           //             color: Colors.amber,
          //           //           ),
          //           //       onRatingUpdate: (rating) async{
          //           //
          //           //         await rateProduct(/*ProductGetxController.to.products[index]*/ProductGetxController.to.products[index].id, rating);
          //           //         setState(() {});
          //           //       },
          //           //     ),
          //           //     Row(
          //           //       children: [
          //           //         Icon(
          //           //           Icons.star,
          //           //           color: Colors.grey,
          //           //           size: 18,
          //           //         ),
          //           //         SizedBox(
          //           //           width: 0.8.w,
          //           //         ),
          //           //         Icon(
          //           //           Icons.star,
          //           //           color: Colors.grey,
          //           //           size: 18.w,
          //           //         ),
          //           //         SizedBox(
          //           //           width: 0.8.w,
          //           //         ),
          //           //         Icon(
          //           //           Icons.star,
          //           //           color: Colors.grey,
          //           //           size: 18,
          //           //         ),
          //           //         SizedBox(
          //           //           width: 0.8.w,
          //           //         ),
          //           //         Icon(
          //           //           Icons.star,
          //           //           color: Colors.grey,
          //           //           size: 18,
          //           //         ),
          //           //         SizedBox(
          //           //           width: 0.8.w,
          //           //         ),
          //           //         Icon(
          //           //           Icons.star,
          //           //           color: Colors.grey,
          //           //           size: 18,
          //           //         ),
          //           //         SizedBox(
          //           //           width: 0.8.w,
          //           //         ),
          //           //       ],
          //           //     ),
          //           //   ],
          //           // )
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          onTap: () =>type==1?Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryScreen(categories[index].id),)):Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(products[index].id),)),

        ),
      itemCount:type==1?categories.length<4?categories.length:4:products.length<4?products.length:4,
    );
  }
}

