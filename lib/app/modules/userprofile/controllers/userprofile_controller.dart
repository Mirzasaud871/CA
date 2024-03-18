import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/profile/views/profile_view.dart';
import 'dart:io' as Io;
import '../../../../constants.dart';
import 'package:http/http.dart' as http;

class UserprofileController extends GetxController {
  //TODO: Implement UserprofileController

  //profile data
  final getuserName = ''.obs;
  final gettradeName = ''.obs;
  final getemail = ''.obs;
  final getmobile = ''.obs;
  final getdinNumber = ''.obs;
  final getpanNumber = ''.obs;
  final getaadharNumber = ''.obs;
  final panI = ''.obs;
  final aadharI = ''.obs;
  final profileImage = ''.obs;
  RxString getaadharImage = ''.obs;
  RxString getpanImage = ''.obs;
  RxString getProfileImage = ''.obs;

  // File getaadharImage;
  // File getpanImage;

  //Image picker
  var panCard =''.obs;
  var aadhaarCard = ''.obs;
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

  void getProImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      getProfileImage.value = pickedFile.path;
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
    var res = await ApiServices().getApi(profileURL);
    res.fold((l){
      if(l['status'] == 200){
        getuserName.value = l['customer']['name'];
        gettradeName.value = l['customer']['trade'];
        getemail.value = l['customer']['email'];
        getmobile.value = l['customer']['mobile_no'];
        getdinNumber.value = l['customer']['din_no'];
        getpanNumber.value = l['customer']['pan'];
        getaadharNumber.value = l['customer']['aadhar'];
        aadharI.value = l['customer']['aadhar_image'];
        panI.value = l['customer']['pan_image'];
        profileImage.value = l ['customer']['image'];
      }
    },(r){
      print("right error $res");
    });
  }

  //update profile
  updateProfile(Map map) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(userToken);
    print("image path pan $getaadharImage");
    print("image path $getpanImage");
    print("image path profile $getProfileImage");
  print(map);
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseURL$updateProfileURL'),
      );
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['name'] = map['name'];
      request.fields['trade'] = map['trade'];
      request.fields['email'] = map['email'];
      request.fields['mobile_no'] = map['mobile_no'];
      request.fields['din_no'] = map['din_no'];
      request.fields['pan'] = map['pan'];
      request.fields['aadhar'] = map['aadhar'];
      request.files.add(await http.MultipartFile.fromPath('pan_image', getpanImage.value));
      request.files.add(await http.MultipartFile.fromPath('aadhar_image', getaadharImage.value));
      request.files.add(await http.MultipartFile.fromPath('image', getProfileImage.value));
      var res = await request.send();
      print(res.statusCode);
      if(res.statusCode == 200){
        var responseBody = await http.Response.fromStream(res);
        print(responseBody.body);
        getProfile();
        nameController.clear();
        emailController.clear();
        tradeNameController.clear();
        mobileController.clear();
        dinNumberController.clear();
        panController.clear();
        aadharController.clear();
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
  print('fesn ${e}');
  Get.snackbar("Error", e.toString());
  return Right(e);
  }
  }


}

