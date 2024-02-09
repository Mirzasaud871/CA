import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import '../../../../constants.dart';

class AddfamilymemberController extends GetxController {
  //TODO: Implement AddfamilymemberController

  final count = 0.obs;
  var panCard =''.obs;
  var aadhaarFront = ''.obs;
  var aadhaarFrontBase64 = ''.obs;
  var aadhaarBack = ''.obs;
  var aadhaarBackBase64 = ''.obs;
  var panCardBase64 = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  //Aadhaar Card Front Image
  void getAadhaarFrontImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      aadhaarFront.value = pickedFile.path;
      final bytes = await Io.File(aadhaarFront.value).readAsBytes();
      aadhaarFrontBase64.value = base64Encode(bytes); //Base64 Image
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }

  //Aadhaar Card Back Image
  void getAadhaarBackImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      aadhaarBack.value = pickedFile.path;
      final bytes = await Io.File(aadhaarBack.value).readAsBytes();
      aadhaarBackBase64.value = base64Encode(bytes); //Base64 Image
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }

  //Pan card
  void getPanCardImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      panCard.value = pickedFile.path;
      final bytes = await Io.File(panCard.value).readAsBytes();
      panCardBase64.value = base64Encode(bytes); //Base64 Image
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }
}
