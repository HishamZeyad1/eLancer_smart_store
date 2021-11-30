
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:smart_store/widgets/LoginAction.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TapGestureRecognizer _recognizer;
  @override
  void initState() {
    // TODO: implement initState
    _recognizer=TapGestureRecognizer();
    _recognizer.onTap=nivgateToRegister;
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _recognizer.dispose();
    super.dispose();
  }
  void nivgateToRegister(){
    Navigator.pushNamed(context, '/register');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Transform.translate(
            offset: Offset(0,250.h),
            child: ListView(
              shrinkWrap: true,
              padding:
                  EdgeInsets.only(top: 0.h, left: 24.w, right: 24.w, bottom: 0),
              children: [
                LoginAction(
                    image: 'images/Google-icon.svg',
                    title: 'Continue with Google'),
                SizedBox(
                  height: 28.h,
                ),
                LoginAction(
                    image: 'images/Facebook-icon.svg',
                    title: 'Continue with Facebook'),
                SizedBox(
                  height: 20.h,
                ),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    height: 20.h,
                  )),
                  Text(
                    "  or  ",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(151, 151, 151, 1)),
                  ),
                  Expanded(
                      child: Divider(
                    height: 20.h,
                  )),
                ]),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    LabelTextField("Phone Number"),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppTextField(
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 15.h,//28.h,
                    ),
                    LabelTextField("Password"),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppTextField(
                      hintText: 'Enter your password',
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
                          "Forgot your password?",
                          style:
                              TextStyle(fontSize:12,fontWeight:FontWeight.w500,color: Color.fromRGBO(229, 69, 0, 0.81)),
                        ),
                      ),
                      onTap: () => print("object"),
                    ),
                    SizedBox(
                      height: 30.h, //40
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(width:double.infinity,child: Text("Log In")),
                      style: ElevatedButton.styleFrom(primary: Color.fromRGBO(151, 151, 151, 1),
                        padding: EdgeInsets.symmetric(horizontal: 156.w,vertical: 18.h),
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
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ", /*'Contains variety of'*/
                          ),
                          // TextSpan(text: '   of '),
                          TextSpan(
                              text: "Register" /*'CHOICES'*/,
                              recognizer:_recognizer ,
                              style: TextStyle(
                                  color: Color.fromRGBO(229, 69, 0, 0.81))),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
