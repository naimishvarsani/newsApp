// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, invalid_use_of_protected_member, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/AllScreen/CountryList/country_list_controller.dart';
import 'package:news_app/AllScreen/NewsGridPage/news_card.dart';
import 'package:news_app/Helper/utility.dart';

class FavouritScreenView extends StatefulWidget {
  const FavouritScreenView({Key? key}) : super(key: key);

  @override
  State<FavouritScreenView> createState() => _FavouritScreenViewState();
}

class _FavouritScreenViewState extends State<FavouritScreenView> {
  CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.favouriteNewslist.isEmpty
                  ? Center(
                      child: Text(
                        "No Data In Favourites",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFont.semibold,
                          color: AppColor.themeblackcolor,
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.only(
                          right: 15, left: 15, top: 15, bottom: 15),
                      itemCount: controller.favouriteNewslist.value.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (_, ind) {
                        var curruntObject =
                            controller.favouriteNewslist.value[ind];
                        return NewsCard(
                          newslist: curruntObject,
                          selctedcountryIndex: curruntObject.countryId!,
                          mainindex: curruntObject.newsId!,
                          notifyParent: refresh,
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }

//<<<<<<<<<<<<<<< App Bar >>>>>>>>>>>>>>>>>>>>> //
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.bgcolor,
      centerTitle: true,
      title: Text(
        'Favourite',
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
