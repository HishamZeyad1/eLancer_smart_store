import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/faqs_api_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/base_api.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/LabelTextField.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with Helpers {
  late TextEditingController _subjectTextController;
  late TextEditingController _messageTextController;

  @override
  void initState() {
    // TODO: implement initState
    _subjectTextController = TextEditingController();
    _messageTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectTextController.dispose();
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "Contact",
          AppLocalizations.of(context)!.contact1,

          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          LabelTextField(AppLocalizations.of(context)!.subject, /*"Subject"*/),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            controller: _subjectTextController,
            hintText:AppLocalizations.of(context)!.subjecthint, //"Enter Subject",
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 20.h,
          ),
          LabelTextField(AppLocalizations.of(context)!.message, /*"Message"*/),
          SizedBox(
            height: 20.h,
          ),
          Container(
            child: AppTextField(
              controller: _messageTextController,
              hintText: AppLocalizations.of(context)!.messagehint,//"Enter message... ",
              keyboardType: TextInputType.text,
              maxline: 7,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: ElevatedButton(
              onPressed: () async {
                await performSend();
                // await performChangeProfile();
                // checkData()?Navigator.push(context, MaterialPageRoute(builder: (context) =>)):"";
              },
              child: Container(
                  width: double.infinity,
                  child: Text(
                    // "Send ",
                    AppLocalizations.of(context)!.send,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(229, 69, 0, 0.81),
                padding:
                    EdgeInsets.symmetric(horizontal: 110.w, vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performSend() async {
    if (checkData()) {
      await sendMessage();
      // ActivateScreen(phoneNumber: _phoneTextController.text,);
    }
  }

  bool checkData() {
    if (_messageTextController.text.isNotEmpty &&
        _subjectTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: SharedPrefController().language=='en'?'Enter required Field!':'ادخل الحقول المطلوبة',
      error: true,
    );
    return false;
  }

  Future<void> sendMessage() async {
    BaseApi bstatus = await FAQSApiController()
        .SendContact(_subjectTextController.text,_messageTextController.text);
    // if(bstatus!=null){
    //   if (bstatus.status) {
    //     showSnackBar(
    //       context: context,
    //       message: bstatus.message,
    //       error: bstatus==null,
    //     );
    //     cleanText();
    //   }
    // }
    // else{    showSnackBar(
    //   context: context,
    //   message:bstatus.message,
    //   error: bstatus==null,
    // );
    // }
    showSnackBar(
      context: context,
      message:bstatus.message,
      error: bstatus.status==null,
    );
  }
  void cleanText(){
    _messageTextController.text="";
    _subjectTextController.text="";
  }
}
