import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/familymember/controllers/familymember_controller.dart';
import 'dart:io' as Io;
import '../../../../constants.dart';

class AddfamilymemberController extends GetxController {
  FamilymemberController familymemberController = Get.put(FamilymemberController());

  final count = 0.obs;
  var panCard =''.obs;
  var aadhaarFront = ''.obs;
  var aadhaarFrontBase64 = ''.obs;
  var aadhaarBack = ''.obs;
  var aadhaarBackBase64 = ''.obs;
  var panCardBase64 = ''.obs;

  RxString getaadharImage = ''.obs;
  RxString getpanImage = ''.obs;
  RxString getprofileImage = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController tradeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dinNumberController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController aadharController = TextEditingController();

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
  void getProfileImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      getprofileImage.value = pickedFile.path;
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
  void getAadhaarImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      getaadharImage.value = pickedFile.path;
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
      getpanImage.value = pickedFile.path;
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

  //update profile
  addMembers(Map map) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(userToken);
    print(map);
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseURL$familyStoresURL'),
      );
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['first_name'] = map['first_name'];
      request.fields['trade'] = map['trade'];
      request.fields['email'] = map['email'];
      request.fields['mobile_no'] = map['mobile_no'];
      request.fields['din_no'] = map['din_no'];
      request.fields['pan'] = map['pan'];
      request.fields['aadhar'] = map['aadhar'];

      request.files.add(await http.MultipartFile.fromPath('pan_image',map['pan_image']));
      request.files.add(await http.MultipartFile.fromPath('aadhar_image', map['aadhar_image']));
      request.files.add(await http.MultipartFile.fromPath('image', map['image']));

      var res = await request.send();
      if(res.statusCode == 200){
        var responseBody = await http.Response.fromStream(res);
        print(responseBody.body);
        nameController.clear();
        emailController.clear();
        tradeNameController.clear();
        mobileController.clear();
        dinNumberController.clear();
        panController.clear();
        aadharController.clear();
        getaadharImage.value = '1';
        getpanImage.value = '1';
        getprofileImage.value = '1';
        familymemberController.familyListModel.clear();
        Get.back();
        familymemberController.onInit();
        Get.snackbar(
            "Successful",
            "Your data has been update",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM
        );
      }
    }on SocketException catch (e) {
      Get.snackbar("Error", "Internet not available");
      return Right("No Internet available");
    } catch (e) {
      print('fesn ${e}');
      Get.snackbar("Error", e.toString());
      return Right(e);
    }
  }

}
