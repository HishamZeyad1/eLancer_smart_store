import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/screens/sub_category_screen.dart';

class CategoryWidget extends StatefulWidget {
  // late List<Category> categories;

  CategoryWidget(/*this.categories*/);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with Helpers {
  int _currentIndex = 0;
  // late List<Category> categories;
  late Future<List<Category>> _future;
  late List<Category> categories = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     // categories=widget.categories;
    _future = CategoryApiController().Categories();
}
  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;

    return FutureBuilder<List<Category>>(
        future: _future,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return Container(
            //     width: double.infinity,
            //     height: 600.h,
            //     child: CircularProgressIndicator());
            return Loading();
          }
          else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            categories=snapshot.data??[];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              // children: [
              child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8, //16,
                  crossAxisSpacing: 8, //16,
                  childAspectRatio: .8, //190 / 175,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  // child: Container(
                  //   // color: Colors.red,
                  //   // clipBehavior:Clip.antiAlias,
                  //   padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white, width: 4),
                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  //     image: DecorationImage(
                  //         image: NetworkImage(
                  //             categories[index].imageUrl
                  //           // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  //         ),
                  //         fit: BoxFit.cover),
                  //   ),
                  //   child: Container(
                  //     alignment: Alignment.bottomLeft,
                  //     child: Text(
                  //       // "Tops",
                  //       lang=='en'? categories[index].nameEn:categories[index].nameAr,
                  //
                  //       style: TextStyle(
                  //         fontSize: 18.sp,
                  //         // color: Colors.white,
                  //         color: Colors.orange.shade900,
                  //
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       // textAlign: TextAlign.justify,
                  //     ),
                  //   ),
                  // ),
                  child: Container(
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
                            height: 200.h,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      categories[index].imageUrl                                ),
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
                                  lang=='en'? categories[index].nameEn:categories[index].nameAr,

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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryScreen(categories[index].id),));

                  },
                ),
                itemCount: categories.length,
              ),
              // SizedBox(
              //   height: 24.h,
              // ),
              // ],
            );
          }else {
            return NoData(context);
            // return Container(
            //     width: double.infinity,
            //     height: 600.h,
            //     child: Text("No Data"));
          }
        });
    // return  Container(
    //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    //     // children: [
    //     child: GridView.builder(
    //       shrinkWrap: true,
    //       // physics: NeverScrollableScrollPhysics(),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 8, //16,
    //         crossAxisSpacing: 8, //16,
    //         childAspectRatio: .8, //190 / 175,
    //       ),
    //       itemBuilder: (context, index) => Container(
    //         // color: Colors.red,
    //         // clipBehavior:Clip.antiAlias,
    //         padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
    //         decoration: BoxDecoration(
    //           border: Border.all(color: Colors.white, width: 4),
    //           borderRadius: BorderRadius.all(Radius.circular(10)),
    //           image: DecorationImage(
    //               image: NetworkImage(
    //                   categories[index].imageUrl
    //                 // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //               ),
    //               fit: BoxFit.cover),
    //         ),
    //         child: Container(
    //           alignment: Alignment.bottomLeft,
    //           child: Text(
    //             // "Tops",
    //             categories[index].nameEn,
    //             style: TextStyle(
    //               fontSize: 18.sp,
    //               color: Colors.white,
    //               fontWeight: FontWeight.w600,
    //             ),
    //             // textAlign: TextAlign.justify,
    //           ),
    //         ),
    //       ),
    //       itemCount: categories.length,
    //     ),
    //     // SizedBox(
    //     //   height: 24.h,
    //     // ),
    //     // ],
    //   );
  }
}
