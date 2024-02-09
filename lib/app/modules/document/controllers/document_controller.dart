import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io' as Io;
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';

class DocumentController extends GetxController {
  //TODO: Implement DocumentController

  final count = 0.obs;
  var dropdownvalue = 'Self'.obs;
  var imagesCollect = ''.obs;
  var imagesCollectBase64 = ''.obs;
  var items = [
    'Self',
    'Grand Father',
    'Grand Mother',
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Wife',
    'Husband',
  ].obs;

  var dropdownvalue2 = 'Pan Card'.obs;
  var items2 = [
    'Pan Card',
    'Aadhar Front',
    'Aadhar Back',
    'GST',
    'DSC',
  ].obs;

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

  void selectImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imagesCollect.value = pickedFile.path;
      final bytes = await Io.File(imagesCollect.value).readAsBytes();
      imagesCollectBase64.value = base64Encode(bytes); //Base64 Image
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
      );
    }
  }
}

