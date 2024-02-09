import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vakil99/apiservices.dart';
import 'dart:io' as Io;
import '../../../../constants.dart';

class UserprofileController extends GetxController {
  //TODO: Implement UserprofileController

  //profile data
  final name = ''.obs;
  final tradeName = ''.obs;
  final email = ''.obs;
  final mobile = ''.obs;
  final dinNumber = ''.obs;
  final panNumber = ''.obs;
  final aadharNumber = ''.obs;
  final aadharImage = ''.obs;
  final panImage = ''.obs;

  //Image picker
  var panCard =''.obs;
  var aadhaarFront = ''.obs;
  var aadhaarFrontBase64 = ''.obs;
  var aadhaarBack = ''.obs;
  var aadhaarBackBase64 = ''.obs;
  var panCardBase64 = ''.obs;

  //text Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController tradeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dinNumberController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController aadharController = TextEditingController();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
  }

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

  //profile data
  getProfile() async{
    print("profile page function");
    var res = await ApiServices().getApi(profileURL);
    res.fold((l){
      if(l['status'] == 200){
        print("profile api response $res");
        name.value = l['customer']['name'];
        tradeName.value = l['customer']['trade'];
        email.value = l['customer']['email'];
        mobile.value = l['customer']['mobile_no'];
        dinNumber.value = l['customer']['din_no'];
        panNumber.value = l['customer']['pan'];
        aadharNumber.value = l['customer']['aadhar'];
        aadharImage.value = l['customer']['aadhar_image'];
        panImage.value = l['customer']['pan_image'];

      }
    },(r){
      print("right error $res");
    });
  }

}

