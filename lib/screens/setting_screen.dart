import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String _language =LanguageGetxController.to.language.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(/*"Setting"*/AppLocalizations.of(context)!.setting),
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        children: [
          Text(
            // "Language",
            AppLocalizations.of(context)!.language,
            style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          RadioListTile<String>(
            title: Text(/*'en'*/AppLocalizations.of(context)!.english),
            value: 'en',
            groupValue: _language,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _language = value;
                  // Provider.of<LanguageProvider>(context, listen: false)
                  //     .changeLanguage();
                  LanguageGetxController.to.changeLanguage();
                  print("==============LanguageGetxController=====================");
                  print("lang:${LanguageGetxController.to.language}");
                });
              }
            },
          ),
          RadioListTile<String>(
            title: Text(/*'ar'*/AppLocalizations.of(context)!.arabic),
            value: 'ar',
            groupValue: _language,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _language = value;
                  // Provider.of<LanguageProvider>(context, listen: false)
                  //     .changeLanguage();
                  LanguageGetxController.to.changeLanguage();
                  print("==============LanguageGetxController=====================");
                  print("lang:${LanguageGetxController.to.language}");
                });
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            // "About App",
            AppLocalizations.of(context)!.aboutapp,
            style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              Text(
                // "The daily expense management application allows the user to track the sources of income and the financial value of each source of income as well as the categories that are consumed and the financial value that is consumed for each category.",
                AppLocalizations.of(context)!.appdescribtion1,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black45,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                // "It allows the user to add revenue sources with their financial value, consumption categories, and consumption value. The total revenue value, consumption value, savings value, and graphical charts are displayed.",
                AppLocalizations.of(context)!.appdescribtion2,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black45,
                    fontWeight: FontWeight.normal),
              ),
              // Text("In the end, a graphical chart is made showing the categories that are consumed, whether on food, health, etc., a graphical chart showing the sources of income or revenues, whether on a government job, educational tools and others."
              //   ,style: TextStyle(
              //    fontSize: 18.sp,
              //     color: Colors.black45,
              //     fontWeight: FontWeight.normal),
              // ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            // "About Devloper",
            AppLocalizations.of(context)!.aboutdeveloper,

            style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            shadowColor: Colors.deepPurple,
            child: ListTile(
                leading: Icon(Icons.developer_mode),
                title: Text(
                  // 'Hisham Zeyad',
                  AppLocalizations.of(context)!.developername,

                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    // letterSpacing: 1,
                  ),
                ),
                trailing: IconButton(padding: EdgeInsets.zero,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/about_developer'),
                    icon: Icon(
                      Icons.send_sharp,
                      color: Colors.blue,
                    ))),
          ),

          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/bio_screen');
          //     },
          //     child: Text("click")),
        ],
      ),
    );
  }
}