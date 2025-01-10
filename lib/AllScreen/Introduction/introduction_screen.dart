// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/AllScreen/Introduction/introduction_controller.dart';
import 'package:news_app/Helper/bottomnavbar.dart';
import 'package:news_app/Helper/utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Helper/preferances.dart';

class IntroductionScreenView extends StatelessWidget {
  IntroductionScreenController _controller =
      Get.put(IntroductionScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SafeArea(
          child: Column(
            children: [
              pageViewContianer(),
              progressindicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageViewContianer() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: Get.height * 0.80,
        child: PageView(
          onPageChanged: (value) {
            _controller.selectedIndex.value = value;
          },
          controller: _controller.pageController,
          children: [
            pageView(
              "Welcome To NEWS Translate App",
              "Group 165.png",
            ),
            pageView(
                "We Provide Our Service More Then 10 Country", "Group 166.png"),
            pageView("Translate Over 10 Languages", "Group 167.png"),
            pageView(
                "Powerful Text Translate to Voice Feature", "Group 170.png"),
          ],
        ),
      ),
    );
  }

  Widget pageView(String text, String imgurl) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              AssetsPath.intro + imgurl,
              fit: BoxFit.fill,
              height: 250,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width - 100,
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: AppFont.semibold,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget progressindicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          child: SmoothPageIndicator(
            controller: _controller.pageController,
            count: 4,
            effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                spacing: 4,
                expansionFactor: 2.5,
                activeDotColor: AppColor.themeredcolor,
                dotColor: AppColor.themeblackcolor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
              onTap: () {
                if (_controller.pageController.page == 3) {
                  Preference.preference
                      .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);

                  Get.offAll(PersistenBottomNavBar());
                } else {
                  _controller.pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                }
              },
              child: Obx(() => Image.asset(
                    _controller.selectedIndex.value == 3
                        ? AssetsPath.home + "truemark.png"
                        : AssetsPath.home + "nextarrow.png",
                    height: 18,
                    width: 22,
                  ))),
        )
      ],
    );
  }
}
