import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/reset_password.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with Helpers {
  late TextEditingController _phoneTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Card(
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color.fromRGBO(49, 49, 49, 1),
              ),
            )),
        title: Text(
          // "Forget Password",
            AppLocalizations.of(context)!.forget,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        titleSpacing: 50,
        // toolbarHeight: 36 + 16,
      ),

      body: ListView(
        padding: EdgeInsets.only(left: 21.w, right: 24.w),
        children: [
          SizedBox(
            height: 30.h, //93.h,
          ),
          // SvgPicture.asset('images/Lock-logo.svg'),
          Container(margin: EdgeInsets.only(left: 78.w, right: 78.w),
              height: 224.h,
              child: Image.asset('images/Lock.png',)),
          SizedBox(
            height: 110.h,
          ),

          // Text('Enter the email address or associated with your account'),
          LabelTextField(AppLocalizations.of(context)!.forgethint
              /*'Enter the mobile phone or associated with your account'*/),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(controller: _phoneTextController,
              hintText: AppLocalizations.of(context)!.phonenumberhint/*'Enter your mobile'*/,
              keyboardType: TextInputType.phone),
          SizedBox(
            height: 4.h,
          ),

          GestureDetector(
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Text(
                // "Try another way",
                  AppLocalizations.of(context)!.tryanother,
                style: TextStyle(color: Color.fromRGBO(229, 69, 0, 0.81)),
              ),
            ), onTap: () => print("object"),),
          SizedBox(
            height: 100.h,//141
          ),
          Container(
            margin:EdgeInsets.symmetric(horizontal:30.w),
            child: ElevatedButton(
              onPressed: ()async {
                await performForgetPassword();
                // checkData()?Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(prviousPage: 2,phoneNumber:_phoneTextController.text ),)):"";
              },
              child: Container(
                  width:double.infinity,//margin: EdgeInsets.symmetric(horizontal:100.w),
                  child: Text(/*"Next"*/AppLocalizations.of(context)!.next, textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),)),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(229, 69, 0, 0.81),
                padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6.h, //40
          ),
        ],
      ),
    );
  }

  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_phoneTextController.text.isNotEmpty) {
      return true;
    }
    // showSnackBar(
    //   context: context,
    //   message: 'Enter required data!',
    //   error: true,
    // );
    showSnackBar(context: context, message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة', error: true);

    return false;
  }

  Future<void> forgetPassword() async {
    print("*******************************");
      Map<int,String> statusMap = await AuthApiController().forgetPassword(
        context,
        PhoneNumber: _phoneTextController.text,
      );
    print("*******************************");
    // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
      if (statusMap[1]=="true") {
        print("*******************************");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResetPassword(prviousPage: 2, phoneNumber: _phoneTextController.text,correctedCode:statusMap[2]),
          ),
        );
      }
    }
  }