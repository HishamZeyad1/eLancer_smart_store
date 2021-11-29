import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LabelTextField extends StatelessWidget {
  late String title;

  LabelTextField(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 20.h, child: Text(title));
  }
}
