import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottombarController extends GetxController {
  //TODO: Implement BottombarController

  final count = 0.obs;
  PageController pageController = PageController();
  @override
  void onInit() {
    PageController();
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
