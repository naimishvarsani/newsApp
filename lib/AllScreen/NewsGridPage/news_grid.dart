// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/AllScreen/CountryList/country_list_controller.dart';
import 'package:news_app/AllScreen/NewsGridPage/news_card.dart';
import 'package:news_app/Database/data_model.dart';
import 'package:news_app/Helper/utility.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsGridView extends StatefulWidget {
  final List<NewsDataModel> newslist;
  final int selctedcountryIndex;

  const NewsGridView(
      {Key? key, required this.newslist, required this.selctedcountryIndex})
      : super(key: key);

  @override
  State<NewsGridView> createState() => _NewsGridViewState();
}

class _NewsGridViewState extends State<NewsGridView> {
  CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                padding:
                    EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
                itemCount: widget.newslist.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (_, ind) {
                  var curruntObject = widget.newslist[ind];
                  return NewsCard(
                    newslist: curruntObject,
                    selctedcountryIndex: widget.selctedcountryIndex,
                    mainindex: ind,
                    notifyParent: refresh,
                  );
                }),
          ],
        ),
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<< App Bar >>>>>>>>>>>>>>>>>>>>>> //
  AppBar appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bgcolor,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Image.asset(
            AssetsPath.home + 'backarrow.png',
          ),
        ),
      ),
      title: Text(
        'News Paper',
        style: TextStyle(
          color: Colors.black,
          fontFamily: AppFont.semibold,
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
