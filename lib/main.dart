import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/screens/login.dart';
import 'package:smart_store/screens/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () =>MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes:{
          "/on_boarding":(Context)=>OnBoarding(),
          "/login":(Context)=>Login(),
        } ,
      ),
    );
  }
}

