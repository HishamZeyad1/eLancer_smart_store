
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';
import 'package:smart_store/widgets/LoginAction.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _gender = 'Male';
  late int _selectedRegion;
  List<RegionL> region = [
    RegionL(id: 1, region: "Alsa"),
    RegionL(id: 2, region: "bra")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(151, 151, 151, 1),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => print('dd'),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Rgister",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        titleSpacing: 60,
        toolbarHeight: 36 + 16,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
        children: [
          SizedBox(
            height: 72.h,
          ),
          LoginAction(
            image: 'images/Google-icon.svg',
            title: 'Continue with Google',
            height: 52.h,
          ),
          SizedBox(
            height: 28.h,
          ),
          LoginAction(
            image: 'images/Facebook-icon.svg',
            title: 'Continue with Facebook',
            height: 52.h,
          ),
          SizedBox(
            height: 32.h,
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
            height: 32.h,
          ),
          LabelTextField("Name"),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(
            hintText: 'Enter your name',
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: 28.h, //28.h,
          ),
          LabelTextField("Phone Number"),
          SizedBox(
            height: 12.h,
          ),
          AppTextField(
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 28.h, //28.h,
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
            height: 28.h, //28.h,
          ),
          LabelTextField("Gender"),
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
                    value: 'Male',
                    title: Text('Male'),
                    groupValue: _gender,
                    onChanged: (value) {
                      if (value != null && value != _gender) {
                        setState(() {
                          _gender = 'Male';
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                    child: RadioListTile(
                  value: 'Female',
                  title: Text('Female'),
                  groupValue: _gender,
                  onChanged: (value) {
                    if (value != null && value != _gender) {
                      setState(() {
                        _gender = 'Female';
                      });
                    }
                  },
                )),
              ],
            ),
          ),
          LabelTextField("Region"),
          SizedBox(
            height: 12.h,
          ),
          DropdownButton(
              isExpanded: true,
              value: _selectedRegion,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedRegion = value;
                    print("selected Value:${_selectedRegion}");
                  });
                }
              },
              hint: Text("select a region"),
              items: region
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e.region),
                      value: e.id,
                      onTap: () {},
                    ),
                  )
                  .toList()),
          SizedBox(
            height: 30.h, //40
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
                width: double.infinity, child: Text("Create Account")),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(229, 69, 0, 0.81),
              padding: EdgeInsets.symmetric(horizontal: 111.w, vertical: 18.h),
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
                  text: "By signing up,  agree to these ", /*'Contains variety of'*/
                ),
                // TextSpan(text: '   of '),
                TextSpan(
                    text: "Conditions" /*'CHOICES'*/,
                    style: TextStyle(
                        color: Color.fromRGBO(229, 69, 0, 0.81))),
                TextSpan(
                    text: " and " /*'CHOICES'*/,
                    // style: TextStyle(
                    //     color: Color.fromRGBO(229, 69, 0, 0.81)),
                ),
                TextSpan(
                    text: "Terms of Use" /*'CHOICES'*/,
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
}

class RegionL {
  late int id;
  late String region;

  RegionL({required this.id, required this.region});
}
