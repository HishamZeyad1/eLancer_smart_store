// import 'package:daily_expense/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      SharedPrefController().loggedIn
          ? Navigator.pushReplacementNamed(context, '/main_screen')
          : Navigator.pushReplacementNamed(context, '/login');
    });

  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().designWidth(375).designHeight(812);
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade900, Colors.orange.shade900],
          ),
        ),
        child: Text(
          // "Smart Store",
          AppLocalizations.of(context)!.introduction,

          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
