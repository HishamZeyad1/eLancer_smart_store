import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget Loading() {
    return Center(
      child: Container(
          width: 200.w, height: 200.h, child: CircularProgressIndicator()),
    );
  }

  Widget NoData(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.h,
      width:MediaQuery.of(context).size.width/2.w,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 120,
              color: Colors.grey.shade400,
            ),
            Text(
              'NO DATA',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
