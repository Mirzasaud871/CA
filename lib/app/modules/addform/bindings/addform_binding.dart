import 'package:get/get.dart';

import '../controllers/addform_controller.dart';

class AddformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultipleController>(
      () => MultipleController(),
    );
  }
}
