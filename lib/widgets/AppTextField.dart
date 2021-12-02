import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  late final String hintText;
  late bool enable;
  // late final IconData icon;
  late final TextInputType keyboardType;

  // late final IconData? lasticon;
  late final TextEditingController? controller;
  late bool obsure;

  AppTextField(
      {required this.hintText,
      required this.keyboardType,
      required this.controller,
      this.obsure = false,this.enable=true});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color.fromRGBO(151, 151, 151, 1),fontSize: 13,fontWeight: FontWeight.w500),
      keyboardType: keyboardType,enabled: enable,
      obscureText: obsure,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintText: hintText,
        focusColor: Colors.blue,
        enabled: enable,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
