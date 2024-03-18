import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/Models/MyorderModel.dart';
import 'package:vakil99/apiservices.dart';
import 'dart:io' as Io;
import '../../../../constants.dart';

class MyorderController extends GetxController {
  //TODO: Implement MyorderController

  RxList<Order> myOrderlistModel = <Order>[].obs;

  var filterlist = true.obs;
  var dropdownvalue = 'Pan Card'.obs;
  var imagesCollect = ''.obs;
  var imagesCollectBase64 = ''.obs;
  var items = [
    'Pan Card',
    'Aadhar Card Fornt',
    'Gst',
  ].obs;

  @override
  void onInit() {
    getOrder();
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

  getOrder() async{
    print("my order function");
    var res = await ApiServices().getApi(myOrderURL);
    res.fold((l){
     if(l['status'] == 200){
       List orderData = l['orders'];
       myOrderlistModel.addAll(orderData.map((val) => Order.fromJson(val)));
     }else if(l['status'] == 405){
     print("error order page 405");
     }
     update();
    },(r){
    });
  }

}
