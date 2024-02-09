import 'package:get/get.dart';

import '../controllers/gstproprietorship_controller.dart';

class GstproprietorshipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GstproprietorshipController>(
      () => GstproprietorshipController(),
    );
  }
}
