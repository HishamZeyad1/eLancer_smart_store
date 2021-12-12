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
            childAspectRatio: 272 / 175),
        itemBuilder: (context, index) =>GestureDetector(
          child: Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.only(bottom: 5.h, left: 5.w),

            // color: Colors.red,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(
                    type==1?categories[index].imageUrl:products[index].imageUrl,
                    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                // "Tops",
                // categories[index].nameEn,
                type==1?
                lang=="en"?categories[index].nameEn:categories[index].nameAr
                :lang=="en"?products[index].nameEn:products[index].nameAr,

                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.orange.shade900,
                  fontWeight: FontWeight.w600,
                ),
                // textAlign: TextAlign.justify,
              ),
            ),
          ),
          onTap: () =>type==1?Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryScreen(categories[index].id),)):Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(products[index].id),)),

        ),
      itemCount:type==1?categories.length:products.length,
    );
  }
}

