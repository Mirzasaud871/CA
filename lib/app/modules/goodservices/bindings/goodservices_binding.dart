import 'package:get/get.dart';

import '../controllers/goodservices_controller.dart';

class GoodservicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodservicesController>(
      () => GoodservicesController(),
    );
  }
}
