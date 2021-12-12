import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class changePassword extends StatefulWidget {
  // const NewPassword({Key? key}) : super(key: key);
  late String oldPassword;
  late String newPassword;
  late String confirmPassword;

  changePassword(/*
      {required this.oldPassword, required this.newPassword, required this.confirmPassword}*/);

  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> with Helpers {
  late TextEditingController _oldPasswordTextController;
  late TextEditingController _newPasswordTextController;
  late TextEditingController _confirmPasswordTextController;

  void initState() {
    // TODO: implement initState
    super.initState();
    _oldPasswordTextController = TextEditingController();
    _newPasswordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _oldPasswordTextController.dispose();
    _newPasswordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     icon: Card(
        //       child: Icon(
        //         Icons.arrow_back_ios_sharp,
        //         color: Color.fromRGBO(49, 49, 49, 1),
        //       ),
        //     )),
        title: Text(
          // "Change Password",
          AppLocalizations.of(context)!.changepassword,

          style: TextStyle(color: Colors.white),
        ),
        // backgroundColor: Colors.transparent,
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),

        centerTitle: true,
        // elevation: 0,
        // leadingWidth: 70,
        // titleSpacing: 50,
        // toolbarHeight: 36 + 16,
      ),

      body: ListView(
        padding: EdgeInsets.only(left: 21.w, right: 24.w),
        children: [
          SizedBox(
            height: 30.h, //93.h,
          ),
          // SvgPicture.asset('images/Lock-logo.svg'),
          Column(
            children: [
              LabelTextField(AppLocalizations.of(context)!.currentpassword, /*"Current Password"*/),
              SizedBox(
                height: 20.h,
              ),
              AppTextField(controller: _oldPasswordTextController, obsure: true,
                hintText:AppLocalizations.of(context)!.currentpasswordhint, /*'Enter Current Password'*/
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 20.h, //28.h,
              ),
              LabelTextField(AppLocalizations.of(context)!.newpassword, /*"New Password"*/),
              SizedBox(
                height: 20.h,
              ),
              AppTextField(controller: _newPasswordTextController, obsure: true,
                hintText:AppLocalizations.of(context)!.newpasswordhint, /*'Enter New Password',*/
                keyboardType: TextInputType.visiblePassword,
                // obsure: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              LabelTextField(AppLocalizations.of(context)!.confirmpassword, /*"Confirm Password"*/),
              SizedBox(
                height: 20.h,
              ),
              AppTextField(
                controller: _confirmPasswordTextController, obsure: true,
                hintText:AppLocalizations.of(context)!.confirmpasswordhint, //'Enter confirm Password',
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
              await performChangePassword();
              // checkData()?Navigator.push(context, MaterialPageRoute(builder: (context) =>)):"";
            },
            child: Container(
                width: double.infinity,
                child: Text(AppLocalizations.of(context)!.changepassword,/*"Change password"*/ style: TextStyle(
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

  Future<void> performChangePassword() async {
    print("************");
    if (checkData()) {
      await changePassword();
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
    if (_oldPasswordTextController.text.isNotEmpty &&
        _newPasswordTextController.text.isNotEmpty &&
        _confirmPasswordTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _confirmPasswordTextController.text) {
        print("*****checkPassword*******");
        return true;
      }
      showSnackBar(
          context: context,
          message: SharedPrefController().language=='en'?'Password confirmation error!':'خطأ في تأكيد كلمة المرور',
          error: true);
      return false;
    }
    showSnackBar(context: context, message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة', error: true);
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
  Future<void> changePassword() async {
    bool status = await AuthApiController().changePassword(
        context, oldPassword: _oldPasswordTextController.text,//widget.oldPassword,
        newPassword: _newPasswordTextController.text,//widget.newPassword,
        confirmPassword: _confirmPasswordTextController.text);
    print("*****resetPassword*******");
    // if (status) Navigator.pop(context);
  }
}
