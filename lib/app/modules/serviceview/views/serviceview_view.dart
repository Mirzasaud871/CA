import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/serviceview_controller.dart';

class ServiceviewView extends GetView<ServiceviewController> {
  const ServiceviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ServiceviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ServiceviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
