import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/forget_password.dart';
import 'package:smart_store/screens/home_screen.dart';
import 'package:smart_store/screens/Auth/login.dart';
import 'package:smart_store/screens/Auth/new_password.dart';
import 'package:smart_store/screens/on_boarding.dart';
import 'package:smart_store/screens/Auth/register.dart';
import 'package:smart_store/screens/Auth/reset_password.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
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
        initialRoute: '/on_boarding',
        routes:{
          "/on_boarding":(Context)=>OnBoarding(),
          "/login":(Context)=>Login(),
          "/register":(Context)=>Register(),
          "/forget_password":(Context)=>ForgetPassword(),
          // "/reset_password":(Context)=>ResetPassword(),
          // "/new_password":(Context)=>NewPassword(),
          "/home":(Context)=>HomeScreen(),

        } ,
      ),
    );
  }
}

