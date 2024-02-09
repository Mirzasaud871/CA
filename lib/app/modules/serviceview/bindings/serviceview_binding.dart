import 'package:get/get.dart';

import '../controllers/serviceview_controller.dart';

class ServiceviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceviewController>(
      () => ServiceviewController(),
    );
  }
}
