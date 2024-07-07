// ignore_for_file: invalid_use_of_protected_member, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/AllScreen/CountryList/country_list_controller.dart';
import 'package:news_app/Database/data_model.dart';
import 'package:news_app/Helper/preferances.dart';
import 'package:news_app/Helper/utility.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final NewsDataModel newslist;
  final int mainindex;
  final int selctedcountryIndex;
  final Function() notifyParent;

  const NewsCard(
      {Key? key,
      required this.newslist,
      required this.selctedcountryIndex,
      required this.mainindex,
      required this.notifyParent})
      : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  CountryController controller = Get.put(CountryController());
  @override
  Widget build(BuildContext context) {
    return newsCard(
      widget.newslist,
      widget.selctedcountryIndex,
      widget.mainindex,
    );
  }

  Widget newsCard(NewsDataModel curruntNewsData, int mainindex, int subindex) {
    return GestureDetector(
      onTap: () {
        openNews(curruntNewsData.newsUrl);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: Offset(-5, 0),
                blurRadius: 25,
                color: AppColor.themeblackcolor.withOpacity(0.1),
              )
            ], color: Colors.transparent),
          ),
          Container(
            height: Get.height * 0.19,
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColor.bgcolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(25),
            child: Image.asset(curruntNewsData.newsImage!),
          ),
          Positioned(
            right: 18,
            top: 15,
            child: GestureDetector(
                onTap: () async {
                  if (controller.countryData.value[mainindex]
                      .newsList![subindex].isFavourit!) {
                    controller.countryData.value[mainindex].newsList![subindex]
                        .isFavourit = false;
                    var element = NewsDataModel();
                    for (var value in controller.favouriteNewslist.value) {
                      if (value.countryId == mainindex &&
                          value.newsId == subindex) {
                        element = value;
                      }
                    }
                    if (element != NewsDataModel()) {
                      controller.favouriteNewslist.value.remove(element);
                    }
                    widget.notifyParent();
                  } else {
                    controller.favouriteNewslist.value.add(curruntNewsData);
                    controller.countryData.value[mainindex].newsList![subindex]
                        .isFavourit = true;
                  }
                  final prefs = Preference.preference;
                  var list = controller.countryData.value;
                  await prefs.saveString(
                      PreferenceKey.database, jsonEncode(list));

                  setState(() {});
                },
                child: Obx(() => controller
                        .countryData
                        .value[widget.selctedcountryIndex]
                        .newsList![subindex]
                        .isFavourit!
                    ? Image.asset(AssetsPath.home + "Heart.png", height: 25)
                    : Image.asset(AssetsPath.home + "unfavorite.png",
                        height: 25))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.07,
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColor.containbgcolor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Center(child: Text(curruntNewsData.newsName!)),
            ),
          )
        ],
      ),
    );
  }

  void openNews(url) async {
    var newsurl = Uri.parse(url);
    if (!await launchUrl(newsurl)) throw 'Could not launch $url';
  }
}
