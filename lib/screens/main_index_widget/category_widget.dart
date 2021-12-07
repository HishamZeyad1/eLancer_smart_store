import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_store/api/controllers/category_api_controller.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/screens/sub_category_screen.dart';

class CategoryWidget extends StatefulWidget {
  // late List<Category> categories;

  CategoryWidget(/*this.categories*/);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
    return FutureBuilder<List<Category>>(
        future: _future,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                width: double.infinity,
                height: 600.h,
                child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                  child: Container(
                    // color: Colors.red,
                    // clipBehavior:Clip.antiAlias,
                    padding: EdgeInsets.only(bottom: 12.h, left: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              categories[index].imageUrl
                            // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        // "Tops",
                        categories[index].nameEn,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        // textAlign: TextAlign.justify,
                      ),
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
            return Container(
                width: double.infinity,
                height: 600.h,
                child: Text("No Data"));
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
