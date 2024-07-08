// ignore_for_file: prefer_const_constructors, unused_import, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/AllScreen/CountryList/country_list_controller.dart';
import 'package:news_app/AllScreen/NewsGridPage/news_grid.dart';
import 'package:news_app/Database/app_data.dart';
import 'package:news_app/Database/data_model.dart';
import 'package:news_app/Helper/utility.dart';

class CountryListView extends StatelessWidget {
  CountryListView({Key? key}) : super(key: key);
  DataBase countryData = DataBase();
  CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      backgroundColor: AppColor.bgcolor,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: countryData.countryNewsList.length,
          itemBuilder: (_, ind) {
            var curruntObject = countryData.countryNewsList[ind];
            return countryList(curruntObject, context, ind);
          }),
    );
  }

// <<<<<<<<<<<<<<<<<<<<<<<<<<AppBar>>>>>>>>>>>>>>>>>>>>>>>>>>>> //
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bgcolor,
      centerTitle: true,
      title: Text(
        'Select Country',
        style: TextStyle(
          color: Colors.black,
          fontFamily: AppFont.semibold,
        ),
      ),
    );
  }

  //<<<<<<<<<<<<<<<<<<<<<<< Country List >>>>>>>>>>>>>>>>>>> //

  Widget countryList(
      CountryDataModel countryData, BuildContext context, int index) {
    countryData.countryFlag;
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: AppColor.iconbgcolor.withOpacity(0.6),
        
        onTap: () {
          Get.to(NewsGridView(
            newslist: countryData.newsList!,
            selctedcountryIndex: index,
          ));
        },
        leading: Container(
          height: 35,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(countryData.countryFlag.toString()),
                  fit: BoxFit.fitHeight)),
        ),
        title: Text(
          countryData.countryName.toString(),
          style: TextStyle(fontFamily: AppFont.semibold, fontSize: 15),
        ),
      ),
    );
  }
}
