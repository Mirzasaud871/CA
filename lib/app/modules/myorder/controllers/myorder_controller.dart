import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/Models/MyorderModel.dart';
import 'package:vakil99/apiservices.dart';
import 'dart:io' as Io;
import '../../../../Models/CompanyModel.dart';
import '../../../../constants.dart';

class MyorderController extends GetxController {
  //TODO: Implement MyorderController

  RxList<Order> myOrderlistModel = <Order>[].obs;
  RxList<Doc> myOrderDocumentlistModel = <Doc>[].obs;
  RxList<Datum> companyModellist = <Datum>[].obs;
  TextEditingController messageController = TextEditingController();

  final RxInt rating = 0.obs;
  var filterlist = false.obs;
  var dropdownvalue = 'Pan Card'.obs;
  var imagesCollect = ''.obs;
  var imagesCollectBase64 = ''.obs;
  RxString ogrId = ''.obs;
  var items = [
    'Pan Card',
    'Aadhar Card Fornt',
    'Gst',
  ].obs;

  List<colorList> listColor = [
    colorList(colorlist: Colors.orange.shade50),
    colorList(colorlist: Colors.green.shade50),
    colorList(colorlist: Colors.purple.shade50),
    colorList(colorlist: Colors.red.shade50),
    colorList(colorlist: Colors.blue.shade50),
  ].obs;

  @override
  void onInit() {
    getCompany();
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


  getCompany() async{
    var res = await ApiServices().getApi(companyURL);
    res.fold((l){
      if(l['status'] == 200){
        List companyData = l['data'];
        companyModellist.addAll(companyData.map((e) => Datum.fromJson(e)));
      }
    },(r){});
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
        print("object ${myOrderlistModel.length}");
     }else if(l['status'] == 405){
     print("error order page 405");
     }
     update();
    },(r){
    });
  }

  void connectCompany(
      String orderId,
      String cin
      ) async{
    var res = await ApiServices().postApi(connectCompanyURL, {
      "order_id" : orderId,
      "cin" : cin,
    });
    res.fold((l){
      if(l['status'] == 200){
        print("connect api $res");
        print("Orgid ${orderId}");
        print("Cin ${cin}");
        myOrderlistModel.clear();
        getOrder();
        Get.back();
      }
    },(r){});
  }


  void onStarTapped(int index) {
    rating.value = index + 1;
  }

  void ratingPost(
      String orderId,
      String userId,
      String serviceId,
      String rating,
      String message
      ) async{
    var res = await ApiServices().postApi(ratingURL, {
      "order_id" : orderId,
      "user_id" : userId,
      "service_id" : serviceId,
      "rating" : rating,
      "message" : message,
    });
    res.fold((l){
      if(l['status'] == 200){
        print("api revies success $res");
        messageController.clear();
        myOrderlistModel.clear();
        getOrder();
        rating == 0;
      }
    },(r){});
  }

}

class colorList{

  colorList({
    required this.colorlist,

  });

  dynamic colorlist;
}