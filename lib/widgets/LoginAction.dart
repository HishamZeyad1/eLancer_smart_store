import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginAction extends StatelessWidget {
  late String image;
  late String title;

  LoginAction({required this.image,required  this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      // margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 2, color: Color.fromRGBO(255, 255, 255, 1))
        // shape: BoxShape.rectangle,
        // shape: RoundedRectangle(borderRadius:BorderRadius.circular(16),side:BorderSide(width: 2)  )
        //   Shape:RoundedRectangle(borderRaduis:BorderRaduis.circular(1),side:BorderSide(color:Colors.yellow,width:2),)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(image,width: 20,height: 20,),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(title))),
        ],
      ),
    );
  }
}
