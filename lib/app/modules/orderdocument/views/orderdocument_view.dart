import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/orderdocument_controller.dart';

class OrderdocumentView extends GetView<OrderdocumentController> {
  const OrderdocumentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderdocumentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderdocumentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
