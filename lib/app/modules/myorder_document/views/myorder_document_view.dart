import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/myorder_document_controller.dart';

class MyorderDocumentView extends GetView<MyorderDocumentController> {
  const MyorderDocumentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyorderDocumentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyorderDocumentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
