// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/AllScreen/CountryList/country_list.dart';
import 'package:news_app/AllScreen/Favourit/favourite_screen.dart';
import 'package:news_app/AllScreen/homescreen/homepage.dart';
import 'package:news_app/Helper/utility.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PersistenBottomNavBar extends StatelessWidget {
  const PersistenBottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
              icon: Image.asset(AssetsPath.home + 'home.png'),
              title: "Home",
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              activeForegroundColor: AppColor.themeredcolor),
        ),
        PersistentTabConfig(
          screen: CountryListView(),
          item: ItemConfig(
            icon: Image.asset(AssetsPath.home + 'newsIcon.jpg'),
            title: "News",
          ),
        ),
        PersistentTabConfig(
          screen: FavouritScreenView(),
          item: ItemConfig(
              icon: Image.asset(AssetsPath.home + 'unfavorite.png'),
              title: "Favourites",
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              activeForegroundColor: AppColor.themeredcolor),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarHeight: 55,
        navBarBuilder: (navBarConfig) => Style15BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
              color: AppColor.bgcolor,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 10)
              ]),
        ),
      );
}
