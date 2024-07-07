// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColor {
  static Color bgcolor = const Color(0xFFffffff);
  static Color themeredcolor = const Color(0xFFFF5630);
  static Color themeblackcolor = const Color(0xFF000000);
  static Color containbgcolor = const Color(0xFFf7f6f8);
  static Color iconbgcolor = const Color(0xFFFFE8E3);
}

mixin PrefernceKey {
  static String isIntroductionScreenLoaded = "isIntroductionScreenLoaded";
}

class AppFont {
  static String semibold = 'montserratsemibold'; // 600: 'SemiBold',
  static String medium = 'MontserratMedium'; // 500: 'Medium',
  static String bold = 'MontserratBold'; // 700: 'Bold',
  static String regular = 'MontserratRegular'; // 400: 'Regular',
}

mixin AssetsPath {
  static String intro = "assets/image/intro/";
  static String home = "assets/image/home/";
  static String flags = "assets/image/flags/";
  static String indianNews = "assets/image/news/india/";
  static String usaNews = "assets/image/news/usa/";
  static String ukNews = "assets/image/news/uk/";
  static String italyNews = "assets/image/news/italy/";
  static String spainNews = "assets/image/news/spain/";
  static String japanNews = "assets/image/news/japan/";
  static String russiaNews = "assets/image/news/russia/";
  static String germanNews = "assets/image/news/germany/";
  static String franceNews = "assets/image/news/france/";
  static String chinaNews = "assets/image/news/china/";
}
