import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/apiservices.dart';

import '../../../../constants.dart';

class FamilyupdateController extends GetxController {
  //TODO: Implement FamilyupdateController

  final count = 0.obs;
  var getMemberId = Get.arguments;
  var panCard =''.obs;
  var aadhaarFront = ''.obs;
  var aadhaarFrontBase64 = ''.obs;
  var aadhaarBack = ''.obs;
  var aadhaarBackBase64 = ''.obs;
  var panCardBase64 = ''.obs;
  var formKeyFamilyUpdate = GlobalKey<FormState>();

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

  var getName = ''.obs;
  var getTradename = ''.obs;
  var getEmail = ''.obs;
  var getMobile = ''.obs;
  var getDinNo = ''.obs;
  var getPancard = ''.obs;
  var getAadharcard = ''.obs;
  var getProfile = ''.obs;
  var getPanImage = ''.obs;
  var getAadharImage = ''.obs;

  @override
  void onInit() {
    getFamilymember();
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

  UpdateMembers(Map map) async{
    print("dddddddd $getaadharImage");
    print(getpanImage);
    print(getprofileImage);
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

      request.fields['member_id'] = map['member_id'];
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
        Get.back();
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
      Get.snackbar("Error", "Please Select Images",backgroundColor: Colors.red);
      print('fesn ${e}');
      return Right(e);
    }
  }

  getFamilymember() async{
    print(getMemberId);
    var res = await ApiServices().getApi(singleFamilyMemberURL+getMemberId.toString());
    res.fold((l){
      if(l['status'] == 200){
        print("api response $res");
        getProfile.value = l['member']['image'].toString();
        getName.value = l['member']['name'].toString();
        getTradename.value = l['member']['trade'].toString();
        getEmail.value = l['member']['email'].toString();
        getMobile.value = l['member']['mobile_no'].toString();
        getDinNo.value = l['member']['din_no'].toString();
        getPancard.value = l['member']['pan'].toString();
        getPanImage.value = l['member']['pan_image'].toString();
        getAadharcard.value = l['member']['aadhar'].toString();
        getAadharImage.value = l['member']['aadhar_image'].toString();
      }
    },(r){});
  }
}
