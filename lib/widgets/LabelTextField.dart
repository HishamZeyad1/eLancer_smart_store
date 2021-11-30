import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelTextField extends StatelessWidget {
  late String title;

  LabelTextField(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 20.h,
        child: Text(
          title,
          style: TextStyle(color: Color.fromRGBO(151, 151, 151, 1),fontSize: 14,fontWeight: FontWeight.w700),
        ));
  }
}
