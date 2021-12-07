import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/sub-category.dart';
import 'package:smart_store/screens/product_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  late int id;

  SubCategoryScreen(this.id);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> with Helpers{
  int _currentIndex = 0;
  late Future<List<SubCategory>> _future;
  late List<SubCategory> subCategories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryApiController().subCategories(widget.id.toString());
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
        title: Text('Sub Categories'),
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
            FutureBuilder<List<SubCategory>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        width: double.infinity,
                        height: 600.h,
                        child: CircularProgressIndicator());
                  }
                  else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    subCategories=snapshot.data??[];
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8, //16,
                        crossAxisSpacing: 8, //16,
                        childAspectRatio: .8, //190 / 175,
                      ),
                      itemBuilder: (context, index) =>
                          GestureDetector(
                            child: Container(
                              // color: Colors.red,
                              // clipBehavior:Clip.antiAlias,
                              padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 4),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        subCategories[index].imageUrl
                                      // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  // "Tops",
                                  subCategories[index].nameEn,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(subCategories[index].id),)),
                          ),
                      itemCount: subCategories.length,
                      // SizedBox(
                      //   height: 24.h,
                      // ),
                    );
                  }else{
                    // return Container(
                    //     width: double.infinity,
                    //     height: 600.h,
                    //     child: Text("No Data"));
                    return NoData(context);
                  }

                }
            ),
          ],
        ),
      ),
    );
  }
}
