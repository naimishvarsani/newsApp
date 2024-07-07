import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  PageController pageController = PageController();
  var selectedIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 1);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
