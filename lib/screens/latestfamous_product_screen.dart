import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/screens/main_index_widget/category_widget.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/screens/product_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LatestFamousProductScreen extends StatefulWidget {
  // const CategoryScreen({Key? key}) : super(key: key);
  late List<Product> products = [];
  late int type;
  LatestFamousProductScreen(this.type,this.products);

  @override
  _LatestFamousProductScreenState createState() => _LatestFamousProductScreenState();
}

class _LatestFamousProductScreenState extends State<LatestFamousProductScreen>  {
  int _currentIndex = 0;
  // late Future<List<Product>> _future;
  late List<Product> products = widget.products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _future = CategoryApiController().Categories();
  }

  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 243, 1),
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
        title: Text(widget.type==1?AppLocalizations.of(context)!.latestproduct:AppLocalizations.of(context)!.famousproduct,
/*,'Latest Product':'Famous Product'*/),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: SvgPicture.asset('images/settinglogo.svg')),
        // ],
      ),
      body:Container(
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
            //             products[index].imageUrl
            //           // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
            //         ),
            //         fit: BoxFit.cover),
            //   ),
            //   child: Container(
            //     alignment: Alignment.bottomLeft,
            //     child: Text(
            //       // "Tops",
            //       lang=='en'?products[index].nameEn:products[index].nameAr,
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
            // onTap: () => print("1"),
            child:Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.vertical(
                         top: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              products[index].imageUrl,                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 1.4.h,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color:Colors.deepOrange.shade200 ,
                      // border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(7)),),
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
                            lang=='en'?products[index].nameEn:products[index].nameAr,

                            // type==1?
                            // lang=="en"?categories[index].nameEn:categories[index].nameAr
                            //     :lang=="en"?products[index].nameEn:products[index].nameAr,
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

            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(products[index].id),)),
          ),
          itemCount: products.length,
        ),
        // SizedBox(
        //   height: 24.h,
        // ),
        // ],
      ),

    // body: FutureBuilder<List<Category>>(
      //     future: _future,
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Container(
      //             width: double.infinity,
      //             height: 600.h,
      //             child: CircularProgressIndicator());
      //       } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      //         categories=snapshot.data??[];
      //         return Container(
      //           padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      //           // children: [
      //           child: GridView.builder(
      //             shrinkWrap: true,
      //             // physics: NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 8, //16,
      //               crossAxisSpacing: 8, //16,
      //               childAspectRatio: .8, //190 / 175,
      //             ),
      //             itemBuilder: (context, index) => Container(
      //               // color: Colors.red,
      //               // clipBehavior:Clip.antiAlias,
      //               padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
      //               decoration: BoxDecoration(
      //                 border: Border.all(color: Colors.white, width: 4),
      //                 borderRadius: BorderRadius.all(Radius.circular(10)),
      //                 image: DecorationImage(
      //                     image: NetworkImage(
      //                         categories[index].imageUrl
      //                       // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      //                     ),
      //                     fit: BoxFit.cover),
      //               ),
      //               child: Container(
      //                 alignment: Alignment.bottomLeft,
      //                 child: Text(
      //                   // "Tops",
      //                   categories[index].nameEn,
      //                   style: TextStyle(
      //                     fontSize: 18.sp,
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                   // textAlign: TextAlign.justify,
      //                 ),
      //               ),
      //             ),
      //             itemCount: categories.length,
      //           ),
      //           // SizedBox(
      //           //   height: 24.h,
      //           // ),
      //           // ],
      //         );
      //       }else {
      //         return Container(
      //             width: double.infinity,
      //             height: 600.h,
      //             child: Text("No Data"));
      //       }
      //     }),
    );
  }
}
