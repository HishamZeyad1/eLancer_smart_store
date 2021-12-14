import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewPassword extends StatefulWidget {
  // const NewPassword({Key? key}) : super(key: key);
late String phoneNumber;
late String code;
NewPassword({required this.phoneNumber, required this.code});

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> with Helpers {
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();

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
          // "Reset Password",
            AppLocalizations.of(context)!.resetpassword,
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

          Column(
            children: [
              LabelTextField(AppLocalizations.of(context)!.resetpassword /*"New Password"*/),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(controller: _passwordTextController,obsure: true,
                hintText:AppLocalizations.of(context)!.passwordhint, //'Enter new Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 15.h,//28.h,
              ),
              LabelTextField(AppLocalizations.of(context)!.confirmpassword /*"Confirm Password"*/),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(controller:_confirmPasswordTextController ,obsure: true,
                hintText: AppLocalizations.of(context)!.confirmpasswordhint,//'Enter confirm Password',
                keyboardType: TextInputType.visiblePassword,
                // obsure: true,
              ),

              SizedBox(
                height: 30.h, //40
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await performResetPassword();
              // checkData()?Navigator.push(context, MaterialPageRoute(builder: (context) =>)):"";
            },
            child: Container(
                width: double.infinity,
                child: Text(AppLocalizations.of(context)!.resetpassword,/*"Reset password",*/ style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),)),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(229, 69, 0, 0.81),
              padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 18.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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

  Future<void> performResetPassword() async {
    print("************");
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (/*checkCode() && */checkPassword()) {
      print("******checkData******");
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_passwordTextController.text.isNotEmpty &&
        _confirmPasswordTextController.text.isNotEmpty) {
      if (_passwordTextController.text ==
          _confirmPasswordTextController.text) {
        print("*****checkPassword*******");

        return true;
      }
      showSnackBar(
          context: context,
          // message: 'Password confirmation error!',
          message: SharedPrefController().language=='en'?'Password confirmation error!':'خطأ في تأكيد كلمة المرور',
          error: true);
      return false;
    }
    showSnackBar(context: context, message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة', error: true);

    // showSnackBar(context: context, message: 'Enter new password!', error: true);
    return false;
  }

  // bool checkCode() {
  //   if (_firstCodeTextController.text.isNotEmpty &&
  //       _secondCodeTextController.text.isNotEmpty &&
  //       _thirdCodeTextController.text.isNotEmpty &&
  //       _fourthCodeTextController.text.isNotEmpty) {
  //     getVerificationCode();
  //     return true;
  //   }
  //   showSnackBar(
  //     context: context,
  //     message: 'Enter verification code',
  //     error: true,
  //   );
  //   return false;
  // }

  // String getVerificationCode() {
  //   return _code = _firstCodeTextController.text +
  //       _secondCodeTextController.text +
  //       _thirdCodeTextController.text +
  //       _fourthCodeTextController.text;
  // }

//
  Future<void> resetPassword() async {
    bool status = await AuthApiController().resetPassword(
      context,PhoneNumber: widget.phoneNumber,
      code: widget.code,
      password: _passwordTextController.text,
      // email: widget.email,
      // code: _code!,
      // password: _newPasswordTextController.text,
    );
    print("*****resetPassword*******");

    if (status){
      bool statuslogin=await AuthApiController().login(context, phoneNumber: widget.phoneNumber, password:_passwordTextController.text);
      if(statuslogin){ Navigator.pushNamed(context, '/main_screen');}
      }
  }
}
