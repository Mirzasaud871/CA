import 'package:get/get.dart';

import '../controllers/myorder_document_controller.dart';

class MyorderDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyorderDocumentController>(
      () => MyorderDocumentController(),
    );
  }
}
