// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/AllScreen/Introduction/introduction_screen.dart';
import 'package:news_app/Helper/bottomnavbar.dart';
import 'package:news_app/Helper/preferances.dart';
import 'package:news_app/Helper/utility.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async {
      var isIntroduction = await Preference.preference
          .getBool(key: PrefernceKey.isIntroductionScreenLoaded, defVal: false);
      if (isIntroduction == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PersistenBottomNavBar()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroductionScreenView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Center(
        child: Image.asset(AssetsPath.intro + 'splash.gif'),
      ),
    );
  }
}
