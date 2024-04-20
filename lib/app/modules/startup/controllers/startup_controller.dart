import 'dart:ui';

import 'package:get/get.dart';
import 'package:vakil99/app/modules/startup/modal/startup_model.dart';

import '../../../../Models/CategoryModel.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';

class StartupController extends GetxController {
  //TODO: Implement StartupController

  final count = 0.obs;
  var filterlist = true.obs;


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
