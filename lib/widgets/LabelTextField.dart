import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelTextField extends StatelessWidget {
  late String title;
  late Color? color;
  late TextAlign? textAlign;
  late double width;

  LabelTextField(this.title,{this.color=const Color.fromRGBO(151, 151, 151, 1),this.textAlign=TextAlign.start,this.width=double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        // height: 20,
        child: Text(
          title,textAlign:textAlign,
        style: TextStyle(color: color,fontSize: 14,fontWeight: FontWeight.w700),
        ));
  }
}
