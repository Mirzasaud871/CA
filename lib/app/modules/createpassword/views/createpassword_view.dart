import 'dart:async';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../constants.dart';
import '../controllers/createpassword_controller.dart';

class CreatepasswordView extends GetView<CreatepasswordController> {
  CreatepasswordView({Key? key}) : super(key: key);
  CreatepasswordController createpasswordController = Get.put(CreatepasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Text("saud"),
        )
    );
  }
}


