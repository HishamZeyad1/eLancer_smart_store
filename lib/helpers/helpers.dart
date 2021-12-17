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
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget Loading() {
    return Center(
      child: Container(
          width: 120.w, height: 120.h, child: CircularProgressIndicator()),
    );
  }

  Widget NoData(BuildContext context) {
    return Container(
      height: 500.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning,
              size: 80,
              color: Colors.grey.shade400,
            ),
            Text(
              'NO DATA',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
    // return Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     // crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Icon(
    //         Icons.warning,
    //         size: 120,
    //         color: Colors.grey.shade400,
    //       ),
    //       Text(
    //         'NO DATA',
    //         style: TextStyle(
    //           color: Colors.grey.shade400,
    //           fontSize: 30,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
