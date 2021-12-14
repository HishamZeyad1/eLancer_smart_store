import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/api/controllers/home_api_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/models/category_type.dart';
import 'package:smart_store/models/home.dart';
import 'package:smart_store/models/product.dart';
import 'package:smart_store/models/slider.dart';
import 'package:smart_store/screens/Home/categories.dart';
import 'package:smart_store/screens/Home/image_slider.dart';
import 'package:smart_store/screens/latestfamous_product_screen.dart';
import 'package:smart_store/widgets/AppListTile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>with Helpers{
  List<CategoryType> _categoriesType = [];
  int selectedCategory = 1;
  int _currentIndex = 0;

  late Future<Home?> _future;
  Home? _homes = null;
  List<Sliders> sliders = <Sliders>[];
  List<Category> categories = <Category>[];
  List<Product> latestProducts = <Product>[];
  List<Product> famousProducts = <Product>[];

  void addCategories() {
    _categoriesType.add(CategoryType(id: 1, name: "Women"));
    _categoriesType.add(CategoryType(id: 2, name: "Men"));
    _categoriesType.add(CategoryType(id: 3, name: "Kid"));
    _categoriesType.add(CategoryType(id: 4, name: "Home"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addCategories();
    _future = HomeApiController().getHome();
  }

  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1,horizontal: 1),
      child: FutureBuilder<Home?>(
          future: _future,
          builder: (context, snapshot) {
            print("============snapshot==============");
            print(snapshot.hasData);
            print(ConnectionState.waiting);
            if (snapshot.connectionState == ConnectionState.waiting) {
              // return Container(
              //     width: double.infinity,
              //     height: 600.h,
              //     child: CircularProgressIndicator());
              return Loading();
            }
            else if (snapshot.hasData && snapshot.data! != null) {
              print("==============snapshot.hasData=============");
              _homes = snapshot.data!;
              sliders = _homes!.sliders;
              categories = _homes!.categories;
              latestProducts = _homes!.latestProducts;
              famousProducts = _homes!.famousProducts;
              // print(sliders[0].imageUrl);
              return ListView(
                padding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //           prefixIcon: Icon(
                  //             Icons.search,
                  //             color: Colors.deepOrange,
                  //           ),
                  //           hintText: 'Search',
                  //           contentPadding: EdgeInsets.symmetric(
                  //               vertical: 16.h, horizontal: 20.w),
                  //           border: OutlineInputBorder(
                  //               borderSide:
                  //               BorderSide(color: Colors.white, width: 2),
                  //               borderRadius: BorderRadius.circular(15)),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 12.w,
                  //     ),
                  //     Container(
                  //         child: Icon(
                  //           Icons.filter_list_rounded,
                  //           color: Colors.deepOrange,
                  //           size: 40.sp,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           //color: Colors.red,
                  //             border:
                  //             Border.all(width: 2, color: Colors.white))),
                  //   ],
                  // ),
                  SizedBox(
                    height: 12.h,
                  ),
                  // Container(
                  //     width: double.infinity,
                  //     height: 148,
                  //     child: Image.asset('images/banner.png')),
                  // FutureBuilder(
                  //   future: _future,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Container();
                      // }
                      // else if (snapshot.hasData && snapshot.data! != null) {
                      //return
                      sliders!=<Sliders>[]?imageSlider(sliders,scale:2 ,):NoData(context),
                      // Center(child: Container(child: Text("No Data"),)),

                      // }
                      // else {
                      //   return Center(
                      //       child: Container(child: Text("No Data"),));
                      // }
                  //   },
                  // ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            // "Categories",
                            AppLocalizations.of(context)!.categories,

                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w600),
                          )),
                      GestureDetector(
                        child: Text(AppLocalizations.of(context)!.seeall, //"see all",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(229, 69, 0, 0.81))),
                        onTap: () =>
                            Navigator.pushNamed(context, '/category_screen'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  // FutureBuilder(
                  //   future: _future,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Container();
                  //     }
                  //     else if (snapshot.hasData && snapshot.data! != null) {
                        categories!=<Category>[]?Categories(categories):NoData(context),
                  //     }
                  //     else {
                  //       return Center(
                  //           child: Container(child: Text("No Data"),));
                  //     }
                  //   },
                  // ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            // "Latest Products",AppLocalizations
                         AppLocalizations.of(context)!.latestproduct,
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w600),
                          )),
                      GestureDetector(
                        child: Text(AppLocalizations.of(context)!.seeall,//"see all",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(229, 69, 0, 0.81))),
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LatestFamousProductScreen(1, latestProducts),));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  // GridView(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         mainAxisSpacing: 16,
                  //         crossAxisSpacing: 16,
                  //         childAspectRatio: 272 / 175),
                  //     children: [
                  //       Container(
                  //         width: 50.w,
                  //         height: 50.h,
                  //         // color: Colors.red,
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10)),
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                  //               ),
                  //               fit: BoxFit.cover),
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 50.w,
                  //         height: 50.h,
                  //         // color: Colors.black,
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10)),
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                  //               ),
                  //               fit: BoxFit.cover),
                  //         ),
                  //       ),
                  //     ]),

                  // FutureBuilder(
                  //   future: _future,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Container();
                  //     }
                  //     else if (snapshot.hasData && snapshot.data! != null) {
                  latestProducts!=<Product>[]?Categories(latestProducts):NoData(context),
                  //     }
                  //     else {
                  //       return Center(
                  //           child: Container(child: Text("No Data"),));
                  //     }
                  //   },
                  // ),

                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            // "Famous Products",
                      AppLocalizations.of(context)!.famousproduct,
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w600),
                          )),
                      GestureDetector(
                        child: Text(AppLocalizations.of(context)!.seeall,//"see all",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(229, 69, 0, 0.81))),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LatestFamousProductScreen(2, famousProducts),));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  // GridView(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2,
                  //         mainAxisSpacing: 16,
                  //         crossAxisSpacing: 16,
                  //         childAspectRatio: 272 / 175),
                  //     children: [
                  //       Container(
                  //         width: 50.w,
                  //         height: 50.h,
                  //         // color: Colors.red,
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10)),
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                  //               ),
                  //               fit: BoxFit.cover),
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 50.w,
                  //         height: 50.h,
                  //         // color: Colors.black,
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10)),
                  //           image: DecorationImage(
                  //               image: NetworkImage(
                  //                   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
                  //               fit: BoxFit.cover),
                  //         ),
                  //       ),
                  //       // Container(
                  //       //   width: 50,
                  //       //   height: 50,
                  //       //   color: Colors.red,
                  //       // ),
                  //       // Container(width: 50, height: 50, color: Colors.green)
                  //     ]),
                  // FutureBuilder(
                  //   future: _future,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Container();
                  //     }
                  //     else if (snapshot.hasData && snapshot.data! != null) {
                  famousProducts!=<Product>[]? Categories(famousProducts):NoData(context),
                  //     }
                  //     else {
                  //       return Center(
                  //           child: Container(child: Text("No Data"),));
                  //     }
                  //   },
                  // ),
                ],
              );
            }
            else {
              // return Container(
              //     width: double.infinity,
              //     height: 600.h,
              //     child: Text("No Data"));
              return NoData(context);
            }
          }),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login');
  }
}
