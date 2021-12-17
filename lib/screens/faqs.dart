import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/api/controllers/faqs_api_controller.dart';
import 'package:smart_store/get/language_getx_controller.dart';
import 'package:smart_store/helpers/helpers.dart';
import 'package:smart_store/models/faqs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQSScreen extends StatefulWidget {
  @override
  _FAQSScreenState createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen>with Helpers {
  late Future<List<FAQS>> _future;
  late List<FAQS> faqs = [];
  @override
  void initState() {
    // TODO: implement initState
    _future=FAQSApiController().getFAQS();

    // initial();
    super.initState();
  }
  // void initial() async{
  //   _future=await FAQSApiController().getFAQS();
  // }
  @override
  Widget build(BuildContext context) {
    String lang=LanguageGetxController.to.language.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // "FAQS",
          AppLocalizations.of(context)!.faqs,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(229, 69, 0, 0.81),
        centerTitle: true,
      ),
      body: FutureBuilder<List<FAQS>>(
        future:_future,
        builder:(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    // return Container(
    // width: double.infinity,
    // height: 600.h,
    // child: CircularProgressIndicator());
      return Loading();
    }
    else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        faqs=snapshot.data!;
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.question_answer),
                  horizontalTitleGap: 0,

                  // minVerticalPadding: 20.h,
                  title: Text(lang=='en'?faqs[index].questionEn:faqs[index].questionAr/*"How can use app in flutter in single child? "*/),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                    lang=='en'?faqs[index].answerEn:faqs[index].answerAr,
                        // "f you wrap any widget in Flutter with the AbsorbPointer Widget, you can enable or disable that widget. That means if you wrap your whole UI f you wrap any widget in Flutter with the AbsorbPointer Widget, you can enable or disable that widget. That means if you wrap your whole UI "
                 ),
                  ),
                );
              },
              itemCount: faqs.length);
        }else {
      return NoData(context);
      // return Container(
      //     width: double.infinity,
      //     height: 600.h,
      //     child: Text("No Data"));
    }
        }
      ),
    );
  }
}
