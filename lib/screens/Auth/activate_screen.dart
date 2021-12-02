import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
class ActivateScreen extends StatefulWidget {
  String? phoneNumber;

  ActivateScreen({this.phoneNumber}); // c
      // onst NewPassword({Key? key}) : super(key: key);

  @override
  _ActivateScreenState createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> with Helpers {
late TextEditingController _phoneTextController;

late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextController=TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneTextController.dispose();
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
          "Activate Account",
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
          LabelTextField(
              'Phone Number'),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(controller: _phoneTextController,
              hintText: widget.phoneNumber.toString(),
              enable: false,
              keyboardType: TextInputType.emailAddress),

          Column(
            children: [
              LabelTextField("New Password"),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(controller: _passwordTextController,obsure: true,
                hintText: 'Enter new Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 15.h,//28.h,
              ),
              LabelTextField("Confirm Password"),
              SizedBox(
                height: 12.h,
              ),
              AppTextField(controller:_confirmPasswordTextController ,obsure: true,
                hintText: 'Enter confirm Password',
                keyboardType: TextInputType.visiblePassword,
                // obsure: true,
              ),

              SizedBox(
                height: 30.h, //40
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              checkData()?Navigator.pushNamed(context, '/reset_password'):"";
            },
            child: Container(
                width: double.infinity,
                child: Text("Reset password", style: TextStyle(
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

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_passwordTextController.text.isNotEmpty &&
        _confirmPasswordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    // bool status = await AuthApiController().login(
    //   context,
    //   email: _emailTextController.text,
    //   password: _passwordTextController.text,
    // );
    // if (status) Navigator.pushReplacementNamed(context, '/categories_screen');
  }
}
