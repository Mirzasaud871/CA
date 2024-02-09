import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  //TODO: Implement IntroductionController

  final count = 3.obs;
  var onLastpage = true.obs;
  PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
