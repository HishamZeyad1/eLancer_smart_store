import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  late final String hintText;

  // late final IconData icon;
  late final TextInputType keyboardType;

  // late final IconData? lasticon;
  late final TextEditingController? controller;
  late bool obsure;

  AppTextField(
      {required this.hintText,
      required this.keyboardType,
      this.controller,
      this.obsure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obsure,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintText: hintText,
        focusColor: Colors.blue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
