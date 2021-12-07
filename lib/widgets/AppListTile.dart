import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppListTile extends StatelessWidget {
late String title;
late IconData leading;
late IconData trailing;
late VoidCallback? onclick;

AppListTile({required this.title,required  this.leading,required  this.trailing,required this.onclick,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ListTile(
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        title: Text(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),//"My Order"
        leading: Icon(leading),//Icons.card_giftcard_outlined
        trailing: Icon(trailing),//Icons.arrow_forward_ios
      ),
      onPressed:onclick,
    );
  }
}