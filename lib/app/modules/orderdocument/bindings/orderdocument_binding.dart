import 'package:get/get.dart';

import '../controllers/orderdocument_controller.dart';

class OrderdocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderdocumentController>(
      () => OrderdocumentController(),
    );
  }
}
