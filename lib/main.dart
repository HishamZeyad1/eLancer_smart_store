import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_store/api/controllers/favorite_api_controller.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/change_password.dart';
import 'package:smart_store/screens/Auth/forget_password.dart';
import 'package:smart_store/screens/Contact.dart';
import 'package:smart_store/screens/about_developer.dart';
import 'package:smart_store/screens/faqs.dart';
import 'package:smart_store/screens/setting_screen.dart';
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
import 'package:smart_store/screens/profile.dart';
import 'package:smart_store/screens/sub_category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'get/language_getx_controller.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  print('sharedpref:${SharedPrefController().language}');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final LanguageGetxController _languageGetxController =
  Get.put<LanguageGetxController>(LanguageGetxController());
   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("langGetx: ${LanguageGetxController.to.language.value}");
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () =>Obx((){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales:AppLocalizations.supportedLocales,
      locale:Locale(LanguageGetxController.to.language.value),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('en', ''), // English, no country code
      //   Locale('ar', ''), // Spanish, no country code
      // ],
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
      "/change_profile":(context)=>changeProfile(),
      "/change_password":(context)=>changePassword(),
      "/setting":(context)=>Setting(),
      "/about_developer":(context)=>AboutDeveloperScreen(),
      "/faqs":(context)=>FAQSScreen(),
      "/contact":(context)=>Contact(),
      } ,
      );
      }
      ),
    );
  }
}

