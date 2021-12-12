import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/new_password.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:smart_store/widgets/code_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ResetPassword extends StatefulWidget {
  // const ResetPassword({Key? key}) : super(key: key);
  late String phoneNumber;
  late int prviousPage;
  String? correctedCode;

  ResetPassword({required this.prviousPage, required this.phoneNumber,this.correctedCode});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with Helpers {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;
  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

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
          // "Verify Account",
            AppLocalizations.of(context)!.verifyaccount,
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
          Container(
              margin: EdgeInsets.only(left: 99.w, right: 99.w),
              height: 224.h,
              child: Image.asset(
                'images/Mailbox.png',
              )),
          SizedBox(
            height: 76.h,
          ),

          // Text('Enter the email address or associated with your account'),

          LabelTextField(
            // 'Please enter the 4 digit code sent to',
            AppLocalizations.of(context)!.verifyhint,
            textAlign: TextAlign.center,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelTextField(
                // 'your phone: ',
                AppLocalizations.of(context)!.yourphone,
                textAlign: TextAlign.end,
                width: 100.w,
              ),
              LabelTextField(
                widget.phoneNumber,
                width: 90.w,
                textAlign: TextAlign.start,
                /*'account@gmail.com'*/ color: Color.fromRGBO(49, 49, 49, 1),
              )
            ],
          ),

          // RichText(textAlign: TextAlign.end,
          //   text: TextSpan(
          //     style: TextStyle(
          //         fontStyle: FontStyle.normal,
          //         // fontWeight: FontWeight.w700,
          //         fontFamily: 'Poppins',
          //         fontSize: 10,
          //         color: Color.fromRGBO(151, 151, 151, 1)),
          //     children: [
          //       TextSpan(
          //         text: "By signing up,  agree to these ", /*'Contains variety of'*/
          //       ),
          //       // TextSpan(text: '   of '),
          //       TextSpan(
          //           text: "Conditions" /*'CHOICES'*/,
          //           style: TextStyle(
          //               color: Color.fromRGBO(229, 69, 0, 0.81))),
          //       TextSpan(
          //         text: " and " /*'CHOICES'*/,
          //         // style: TextStyle(
          //         //     color: Color.fromRGBO(229, 69, 0, 0.81)),
          //       ),
          //       TextSpan(
          //           text: "Terms of Use" /*'CHOICES'*/,
          //           style: TextStyle(
          //               color: Color.fromRGBO(229, 69, 0, 0.81))),
          //
          //     ],
          //   ),
          // ),
          //
          SizedBox(
            height: 28.h,
          ),
          Row(
            children: [
              Expanded(
                child: CodeTextField(
                  textEditingController: _firstCodeTextController,
                  focusNode: _firstFocusNode,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _secondCodeTextController,
                  focusNode: _secondFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _thirdFocusNode.requestFocus()
                        : _firstFocusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _thirdCodeTextController,
                  focusNode: _thirdFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _fourthFocusNode.requestFocus()
                        : _secondFocusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _fourthCodeTextController,
                  focusNode: _fourthFocusNode,
                  onChanged: (value) {
                    if (value.isEmpty) _thirdFocusNode.requestFocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          LabelTextField(
            // "Resend code",
              AppLocalizations.of(context)!.resend,
            color: Color.fromRGBO(229, 69, 0, 0.81),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70.h, //40
          ),
          ElevatedButton(
            onPressed: ()async {
              await performVerifyAccount();
              // widget.prviousPage == 1
              //     ? Navigator.pushReplacementNamed(context, '/login')
              //     : Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) =>
              //               NewPassword(number: widget.phoneNumber, code: ''),
              //         ));
            }, //checkData(),
            child: Container(
                width: double.infinity,
                child: Text(
                  widget.prviousPage == 1 ? AppLocalizations.of(context)!.verifyaccount:AppLocalizations.of(context)!.resetpassword,//"Verify Account" : "Reset password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
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

  Future<void> performVerifyAccount() async {
    if (checkData()) {
      await verifyAccount();
      // Navigator.pushNamed(context, '/new_password');
    }
  }

  bool checkData() {
    if (checkCode() /* && checkPassword()*/) {
      return true;
    }
    return false;
  }

  // bool checkPassword() {
  //   if (_newPasswordTextController.text.isNotEmpty &&
  //       _newPasswordConfirmationTextController.text.isNotEmpty) {
  //     if (_newPasswordTextController.text ==
  //         _newPasswordConfirmationTextController.text) {
  //       return true;
  //     }
  //     showSnackBar(
  //         context: context,
  //         message: 'Password confirmation error!',
  //         error: true);
  //     return false;
  //   }
  //   showSnackBar(context: context, message: 'Enter new password!', error: true);
  //   return false;
  // }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      // getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter verification code',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }

  Future<void> verifyAccount() async {
    // bool status = await AuthApiController().resetPassword(
    //   context,
    //   email: widget.email,
    //   code: _code!,
    //   password: _newPasswordTextController.text,
    // );
    if(widget.prviousPage==1){
      bool status = await AuthApiController().verifyAccount(
        context,
        phoneNumber: widget.phoneNumber,
        code: getVerificationCode(),
      );
      if (status){
        Navigator.pushReplacementNamed(context, '/login');
      }
    }else{
      //TODO:check code
      if(widget.correctedCode==getVerificationCode()){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewPassword(phoneNumber: widget.phoneNumber, code: getVerificationCode()),
            ));
      }else{
        // showSnackBar(
        //   context: context,
        //   message: "Check from verification code",
        //   error: true,
        // );
        showSnackBar(context: context, message: SharedPrefController().language=='en'?'Check from verification code':'تحقق من كود التفعيل', error: true);

      }
    }


  }

}
