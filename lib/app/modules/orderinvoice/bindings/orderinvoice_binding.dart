import 'package:get/get.dart';

import '../controllers/orderinvoice_controller.dart';

class OrderinvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderinvoiceController>(
      () => OrderinvoiceController(),
    );
  }
}
