import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AboutDeveloperScreen extends StatelessWidget {
  const AboutDeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.blue,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade300,
              Colors.orangeAccent,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 90,
              //   backgroundImage: AssetImage('images/karam.jpeg'),
              // ),
              const SizedBox(height: 90,),
              // SvgPicture.asset('images/Logo2.svg'),
              CircleAvatar(
                // Icon(Icons.add),
                radius: 60,
                backgroundColor: Colors.purpleAccent.shade200,

                child:  CircleAvatar(
                  backgroundImage: AssetImage('images/hisham.png'),
                  radius: 55,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                // 'Hisham Al Belbeisi',
                AppLocalizations.of(context)!.fullnamedeveloper,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                // ' Flutter Develoer',
                AppLocalizations.of(context)!.developerJob,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                height: 10,
                color: Colors.white30,
                thickness: 0.8,
                indent: 10,
                endIndent: 10,
              ),
              GestureDetector(
                onTap: ()async => {
                  await launch(
                      "mailto:hishamzeyad98@gmail.com")
                },
                child: Card(
                  margin:EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  shadowColor: Colors.deepPurple,
                  child: ListTile(minLeadingWidth: 0,
                    leading: Icon(Icons.email_sharp),
                    title: Text(AppLocalizations.of(context)!.email,//"Email",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text('hishamzeyad98@gmail.com',style: TextStyle(fontSize: 15),),
                    trailing: Icon(
                      Icons.send_sharp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3,),
              GestureDetector(
                onTap: () async => {
                  await launch(
                      "tel:+9722132855")
                },
                child: Card(
                  margin:  EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  shadowColor: Colors.deepPurple,
                  child:  ListTile(minLeadingWidth: 0,
                    leading: Icon(Icons.call),
                    title: Text(AppLocalizations.of(context)!.developerphonenumber,//'Phone Number',
                      style: TextStyle(
                        fontFamily:' fontFamily',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text('+9722132855'),
                    trailing: Icon(
                      Icons.phone_android,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Text(AppLocalizations.of(context)!.contact,),//'contact with us'
              const SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () async => {
                                await launch(
                                    "https://www.facebook.com/profile.php?id=100004256581071")
                              },
                              icon: const Icon(Icons.facebook),
                              color: Colors.blue,
                              iconSize: 28),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () async => {
                                await launch(
                                    "https://mobile.twitter.com/hishamzeyad")
                              },
                              icon:
                              const Icon(FontAwesomeIcons.twitter),
                              color: Colors.blue,
                              iconSize: 28),
                        ],
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () async => {
                                await launch(
                                    "https://www.instagram.com/hishamzeyad98/")
                              },
                              icon: const Icon(FontAwesomeIcons.instagram),

                              color: Colors.pink.shade400,
                              iconSize: 28),
                          // SizedBox(height: 3,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              // SizedBox(height: 15,),
              Divider(),
              Text(
                // 'ELAnCER_FLUTTER',
                AppLocalizations.of(context)!.course,

                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.2),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }}