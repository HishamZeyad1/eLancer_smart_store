import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/api/controllers/city_api_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/models/user.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/Auth/activate_screen.dart';
import 'package:smart_store/screens/Auth/reset_password.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:smart_store/widgets/LoginAction.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with Helpers {
  late TextEditingController _fullNameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  String _gender = 'M';
  int? _selectedCity;
  // late List<City> cities=[];


  late Future<List<City>> _future;
  List<City> _cites = <City>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _future = CityApiController().getCities();

  }
  // void getCities() async{
  //   cities =await CityApiController().getCities();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameTextController.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;
    // getCities();
    return Scaffold(
      // backgroundColor: Color.fromRGBO(151, 151, 151, 1),

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
          // "Rgister",
          AppLocalizations.of(context)!.register,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // leadingWidth: 70,
        // titleSpacing: 60,
        // toolbarHeight: 36 + 16,
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => print('dd'),
      //       icon: Card(
      //         child: Icon(
      //           Icons.arrow_back_ios_sharp,
      //           color: Color.fromRGBO(49, 49, 49, 1),
      //         ),
      //       )),
      //   title: Text(
      //     "Register",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leadingWidth: 70,
      //   titleSpacing: 50,
      //   // toolbarHeight: 36 + 16,
      // ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
        children: [
          // SizedBox(
          //   height: 0.h,
          // ),

          // LoginAction(
          //   image: 'images/Google-icon.svg',
          //   title: 'Continue with Google',
          //   height: 52.h,
          // ),
          // SizedBox(
          //   height: 28.h,
          // ),
          // LoginAction(
          //   image: 'images/Facebook-icon.svg',
          //   title: 'Continue with Facebook',
          //   height: 52.h,
          // ),
          // SizedBox(
          //   height: 32.h,
          // ),
          // Row(children: <Widget>[
          //   Expanded(
          //       child: Divider(
          //         height: 20.h,
          //       )),
          //   Text(
          //     "  or  ",
          //     style: TextStyle(
          //         fontSize: 14, color: Color.fromRGBO(151, 151, 151, 1)),
          //   ),
          //   Expanded(
          //       child: Divider(
          //         height: 20.h,
          //       )),
          // ]),
          SizedBox(
            height: 22.h,
          ),
          LabelTextField(AppLocalizations.of(context)!.name, /*"Name"*/),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(
            hintText:AppLocalizations.of(context)!.namehint /*'Enter your name'*/, controller: _fullNameTextController,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: 20.h, //28.h,
          ),
          LabelTextField(AppLocalizations.of(context)!.phonenumber/*"Phone Number"*/),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(controller: _phoneTextController,
            hintText: AppLocalizations.of(context)!.phonenumberhint/*'Enter your Phone Number'*/,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 20.h, //28.h,
          ),
          LabelTextField(AppLocalizations.of(context)!.password/*"Password"*/),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(controller: _passwordTextController,
            hintText: AppLocalizations.of(context)!.passwordhint/*'Enter your password'*/,
            keyboardType: TextInputType.visiblePassword,
            obsure: true,
          ),
          SizedBox(
            height: 20.h, //28.h,
          ),
          LabelTextField(AppLocalizations.of(context)!.gender/*"Gender"*/),
          SizedBox(
            height: 12.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.white,
              // boxShadow: [
              //   BoxShadow(color: Colors.white, spreadRadius: 3),
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    value: 'M',
                    title: Text(AppLocalizations.of(context)!.male/*'Male'*/),
                    groupValue: _gender,
                    onChanged: (value) {
                      if (value != null && value != _gender) {
                        setState(() {
                          _gender = 'M';
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                    child: RadioListTile(
                      value: 'F',
                      title: Text(AppLocalizations.of(context)!.female/*'Female'*/),
                      groupValue: _gender,
                      onChanged: (value) {
                        if (value != null && value != _gender) {
                          setState(() {
                            _gender = 'F';
                          });
                        }
                      },
                    )),
              ],
            ),
          ),
          LabelTextField(AppLocalizations.of(context)!.city/*"City"*/),
          SizedBox(
            height: 12.h,
          ),
          FutureBuilder<List<City>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {return Container();}
              else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _cites = snapshot.data ?? [];
                print("cities: ${_cites}");
                return  DropdownButton(
                    isExpanded: true,
                    value: _selectedCity,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          _selectedCity = value;
                          print("selected Value:${_selectedCity}");
                        });
                      }
                    },
                    hint: Text(AppLocalizations.of(context)!.cityhint/*"select a City"*/),
                    items: _cites.map((e) =>DropdownMenuItem(
                      child: Text(lang=="en"?e.nameEn:e.nameAr),
                      value: e.id,
                      onTap: () {},
                    ),).toList()
                );
              }
              else{print(snapshot.data);return Container();}

            },
            // child: DropdownButton(
            //     isExpanded: true,
            //     value: _selectedCity,
            //     onChanged: (int? value) {
            //       if (value != null) {
            //         setState(() {
            //           _selectedCity = value;
            //           print("selected Value:${_selectedCity}");
            //         });
            //       }
            //     },
            //     hint: Text("select a City"),
            //     items: cities.map((e) =>DropdownMenuItem(
            //       child: Text(e.nameEn),
            //       value: e.id,
            //       onTap: () {},
            //     ),).toList()
            //         ),
          ),
          SizedBox(
            height: 30.h, //40
          ),
          ElevatedButton(
            onPressed: () {
              // checkData();
              performRegister();
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>
              //     ResetPassword(prviousPage: 1,phoneNumber: _phoneTextController.text,),));
            },
            child: Container(
                width: double.infinity, child: Center(child: Text(AppLocalizations.of(context)!.createaccount/*"Create Account"*/))),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(229, 69, 0, 0.81),
              padding: EdgeInsets.symmetric(/*horizontal: 111.w,*/ vertical: 18.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(
            height: 6.h, //40
          ),
          RichText(textAlign: TextAlign.end,
            text: TextSpan(
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  // fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  color: Color.fromRGBO(151, 151, 151, 1)),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.ploicy,//"By signing up,  agree to these ", /*'Contains variety of'*/
                ),
                // TextSpan(text: '   of '),
                TextSpan(
                    text:AppLocalizations.of(context)!.conditions, //"Conditions" /*'CHOICES'*/,
                    style: TextStyle(
                        color: Color.fromRGBO(229, 69, 0, 0.81))),
                TextSpan(
                  text: " "+AppLocalizations.of(context)!.and+" ",//" and " /*'CHOICES'*/,
                  // style: TextStyle(
                  //     color: Color.fromRGBO(229, 69, 0, 0.81)),
                ),
                TextSpan(
                    text:AppLocalizations.of(context)!.term, //"Terms of Use" /*'CHOICES'*/,
                    style: TextStyle(
                        color: Color.fromRGBO(229, 69, 0, 0.81))),

              ],
            ),
          ),
          SizedBox(
            height: 16.h, //40
          ),
          // Text("By signing up,agree to these Conditions and Terms of Use"),


        ],
      ),
    );
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
      // ActivateScreen(phoneNumber: _phoneTextController.text,);
    }
  }

  bool checkData() {
    if (_fullNameTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty && _gender != null &&
        _selectedCity != null) {
      return true;
    }
    showSnackBar(
      context: context,
      message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context,user: user);
    if(status){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ResetPassword(prviousPage: 1,phoneNumber: _phoneTextController.text,),));
    }
  }
  User get user {
    User user = User();
    user.name = _fullNameTextController.text;
    user.mobile = _phoneTextController.text;
    user.password = _passwordTextController.text;
    user.gender = _gender;
    user.city =_cites[_selectedCity!-1] ;
    return user;
  }

}
