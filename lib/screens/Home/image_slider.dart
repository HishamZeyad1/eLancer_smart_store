import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/models/slider.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/screens/product_screen.dart';

class imageSlider extends StatefulWidget {
  late List<Sliders> sliders;
  late double scale;
  late bool disable;
  imageSlider(this.sliders,{this.scale=2.7,this.disable=false}); // const imageSlider({Key? key}) : super(key: key);
  @override
  _imageSliderState createState() => _imageSliderState();

}

class _imageSliderState extends State<imageSlider> {
  // final List<String> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  // ];
  late final List<Sliders> imgList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgList = widget.sliders;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 10.h),
        decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700, width:1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(0.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: double.infinity,
                                height: 800.h,
                                child: Image.network(item.imageUrl,
                                    fit: BoxFit.fill,/* width: 1000.0*/),
                              ),
                              onTap: () =>widget.disable?null:Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(item.objectId),)),
                            ),
                            // Positioned(
                            //   bottom: 0.0,
                            //   left: 0.0,
                            //   right: 0.0,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       gradient: LinearGradient(
                            //         colors: [
                            //           Color.fromARGB(200, 0, 0, 0),
                            //           Color.fromARGB(0, 0, 0, 0)
                            //         ],
                            //         begin: Alignment.bottomCenter,
                            //         end: Alignment.topCenter,
                            //       ),
                            //     ),
                            //     padding: EdgeInsets.symmetric(
                            //         vertical: 10.0, horizontal: 20.0),
                            //     child: Text(
                            //       'No. ${item} image',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 20.0,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                  ),
                ))
        .toList();
    // print("============================================");
      // print(widget.sliders[0].id.toString());
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 4.w,),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade900, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: widget.scale,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    ));
  }
}
