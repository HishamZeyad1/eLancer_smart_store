import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/auth_api_controller.dart';
import 'package:smart_store/api/controllers/city_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/city.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';

class changeProfile extends StatefulWidget {
  // const NewPassword({Key? key}) : super(key: key);
  late String oldPassword;
  late String newPassword;
  late String confirmPassword;

  changeProfile(/*
      {required this.oldPassword, required this.newPassword, required this.confirmPassword}*/);

  @override
  _changeProfileState createState() => _changeProfileState();
}

class _changeProfileState extends State<changeProfile> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _city_idTextController;
  late TextEditingController _genderTextController;
  late Future<List<City>> _future;
  List<City> _cites = <City>[];
  late int _selectedCity;
  late String _gender ;
  late String _name;

  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _city_idTextController = TextEditingController();
    _genderTextController = TextEditingController();
    _future = CityApiController().getCities();

    _selectedCity=SharedPrefController().cityId;
    _gender = SharedPrefController().gender;
    _name=SharedPrefController().fullName;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _city_idTextController.dispose();
    _genderTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () => Navigator.pop(context),
        //     // icon: Card(
        //     //   child: Icon(
        //     //     Icons.arrow_back_ios_sharp,
        //     //     color: Color.fromRGBO(49, 49, 49, 1),
        //     //   ),
        //     )),
        title: Text(
          "Change Profile",
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
              LabelTextField("User's Name"),
              SizedBox(
                height: 20.h,
              ),
              AppTextField(controller: _nameTextController,
                hintText: _name,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 20.h, //28.h,
              ),
              LabelTextField("User's Gender"),
              SizedBox(
                height: 20.h,
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
                        title: Text('Male'),
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
                          title: Text('Female'),
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

              LabelTextField("City"),
              SizedBox(
                height: 20.h,
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
                        hint: Text("select a City"),
                        items: _cites.map((e) =>DropdownMenuItem(
                          child: Text(e.nameEn),
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
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await performChangeProfile();
              // checkData()?Navigator.push(context, MaterialPageRoute(builder: (context) =>)):"";
            },
            child: Container(
                width: double.infinity,
                child: Text("Change Profile", style: TextStyle(
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

  Future<void> performChangeProfile() async {
    print("************");
    if (checkData()) {
      await changeProfile();
    }
  }

  bool checkData() {
    if (checkProfile()) {
      print("******checkData******");
      return true;
    }
    return false;
  }

  bool checkProfile() {
    if (_nameTextController.text.isNotEmpty &&
        _selectedCity!=null &&
        _gender!=null) {
        return true;
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
  Future<void> changeProfile() async {
    // bool status = await AuthApiController().changePassword(
    //     context, oldPassword: widget.oldPassword,
    //     newPassword: widget.newPassword,
    //     confirmPassword: widget.confirmPassword);
    bool status =await AuthApiController().changeProfile(
        context, name: _nameTextController.text, city_id: _selectedCity, gender: _gender);
    print("*****resetPassword*******");
    print("status:$status");
    if (status){
      SharedPrefController().changeProfile(name:  _nameTextController.text, gender: _gender, cityId: _selectedCity);
      // Navigator.pop(context);
    }
  }
}
