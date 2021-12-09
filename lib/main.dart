import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/forget_password.dart';
import 'package:smart_store/screens/category_screen.dart';
import 'package:smart_store/screens/launch_screen.dart';
import 'package:smart_store/screens/main_screen.dart';
import 'package:smart_store/screens/product_details_screen.dart';
import 'package:smart_store/screens/main_index_widget/home_widget.dart';
import 'package:smart_store/screens/Auth/login.dart';
import 'package:smart_store/screens/Auth/new_password.dart';
import 'package:smart_store/screens/on_boarding.dart';
import 'package:smart_store/screens/Auth/register.dart';
import 'package:smart_store/screens/Auth/reset_password.dart';
import 'package:smart_store/screens/product_screen.dart';
import 'package:smart_store/screens/sub_category_screen.dart';

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
        initialRoute: '/launch_screen',
        routes:{
          "/on_boarding":(Context)=>const OnBoarding(),
          "/login":(Context)=>const Login(),
          "/register":(Context)=>const Register(),
          "/forget_password":(Context)=>const ForgetPassword(),
          // "/reset_password":(Context)=>ResetPassword(),
          // "/new_password":(Context)=>NewPassword(),
          // "/home":(Context)=>const HomeScreen(),
          "/category_screen":(Context)=>const CategoryScreen(),
          // "/sub_category_screen":(Context)=>const SubCategoryScreen(),
          // "/product_screen":(Context)=>const ProductScreen(),
          // "/product_details_screen":(Context)=> ProductDetailsScreen(),
          "/launch_screen":(Context)=> LaunchScreen(),
          "/main_screen":(context)=>MainScreen(),

        } ,
      ),
    );
  }
}

