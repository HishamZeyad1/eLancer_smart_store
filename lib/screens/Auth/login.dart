
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:smart_store/widgets/LoginAction.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with Helpers{
  late TextEditingController _PhoneTextController;
  late TextEditingController _passwordTextController;
  late TapGestureRecognizer _recognizer;
  @override
  void initState() {
    // TODO: implement initState
    _PhoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _recognizer=TapGestureRecognizer()
    ..onTap = nivgateToRegister;
    // _recognizer.onTap=nivgateToRegister;
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _PhoneTextController.dispose();
    _passwordTextController.dispose();

    _recognizer.dispose();
    super.dispose();
  }
  void nivgateToRegister(){
    Navigator.pushNamed(context, '/register');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(242, 242, 243, 1),
      body: Container(
        width: double.infinity,
        // height: 900.h,
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            // padding: EdgeInsets.only(top: 84.h/*,bottom: 111.h,*/),
            constraints: BoxConstraints(
              minHeight: 0,
              minWidth: 0,
              maxWidth: double.infinity,
              maxHeight: 300.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  'images/login-background.png',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.shade50.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
            child: Column(
              children: [
                Container(
                  //color: Colors.grey,
                  // padding:EdgeInsets.zero,
                  // // margin:EdgeInsets.zero ,
                  width: 79.w,
                  height: 79.h,
                  margin: EdgeInsets.only(
                    top: 84.h,
                    left: 167.w,
                    right: 167.w, /**/
                  ),
                  child: Image.asset(
                    'images/logo.png',
                    width: double.infinity, height: double.infinity,
                    fit: BoxFit.cover,
                    // width: 79.w,
                    // height: 79.h,
                  ),
                ),
                // SizedBox(
                //   height: 12.h,
                // ),
                Container(
                  //color: Colors.grey,
                  // margin: EdgeInsets.only(bottom: 111.h),
                  child: Text("Spoon",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 25.sp,
                          color: Color.fromRGBO(254, 120, 37, 1))),
                ),
                // SizedBox(height: 100.h,),
              ],
            ),
            //84//111
          ),
          ListView(
            shrinkWrap: true,
            padding:
                EdgeInsets.only(top: 0.h, left: 24.w, right: 24.w, bottom: 0),
            children: [
              SizedBox(height: 380.h,),
              // LoginAction(
              //     image: 'images/Google-icon.svg',
              //     title: 'Continue with Google'),
              // SizedBox(
              //   height: 28.h,
              // ),
              // LoginAction(
              //     image: 'images/Facebook-icon.svg',
              //     title: 'Continue with Facebook'),
              // SizedBox(
              //   height: 20.h,
              // ),
              // Row(children: <Widget>[
              //   Expanded(
              //       child: Divider(
              //     height: 20.h,
              //   )),
              //   Text(
              //     "  or  ",
              //     style: TextStyle(
              //         fontSize: 14, color: Color.fromRGBO(151, 151, 151, 1)),
              //   ),
              //   Expanded(
              //       child: Divider(
              //     height: 20.h,
              //   )),
              // ]),
              // SizedBox(
              //   height: 20.h,
              // ),
              Column(
                children: [

                  LabelTextField(AppLocalizations.of(context)!.phonenumber/*"Phone Number"*/),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(controller: _PhoneTextController,
                    hintText: AppLocalizations.of(context)!.phonenumberhint,//'Enter your Phone Number',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15.h,//28.h,
                  ),
                  LabelTextField(AppLocalizations.of(context)!.password/*"Password"*/),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(controller:_passwordTextController ,
                    hintText: AppLocalizations.of(context)!.passwordhint,//'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    obsure: true,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: Text(
                        // "Forgot your password?",
                          AppLocalizations.of(context)!.forget,
                        style:
                            TextStyle(fontSize:12,fontWeight:FontWeight.w500,color: Color.fromRGBO(229, 69, 0, 0.81)),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/forget_password'),
                  ),
                  SizedBox(
                    height: 30.h, //40
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await performLogin();
                      // checkData()?Navigator.pushNamed(context, '/home'):'';
                    },
                    child: Container(width:double.infinity,child: Text(AppLocalizations.of(context)!.login/*"Log In"*/)),
                    style: ElevatedButton.styleFrom(primary: Color.fromRGBO(151, 151, 151, 1),
                      padding: EdgeInsets.symmetric(horizontal: 130.w,vertical: 18.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h, //40
                  ),
                  RichText(textAlign: TextAlign.end,
                    text: TextSpan(
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          // fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color.fromRGBO(49, 49, 49, 1)),
                      text: AppLocalizations.of(context)!.haveaccount,//"Don’t have an account?" ,
                      children: [
                        // TextSpan(
                        //   text: "Don’t have an account? ", /*'Contains variety of'*/
                        // ),
                        // TextSpan(text: '   of '),
                        TextSpan(
                            text: ' '+AppLocalizations.of(context)!.register,//"Register" /*'CHOICES'*/,
                            recognizer:_recognizer ,
                            style: TextStyle(
                                color: Color.fromRGBO(229, 69, 0, 0.81))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h,)

            ],
          ),
        ]),
      ),
    );
  }
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_PhoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(context, phoneNumber: _PhoneTextController.text, password: _passwordTextController.text);
    if (status) Navigator.pushReplacementNamed(context, '/main_screen');
  }
}
