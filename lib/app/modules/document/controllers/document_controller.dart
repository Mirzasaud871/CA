import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' as Io;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/Models/DocumnetModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:http/http.dart' as http;
import '../../../../constants.dart';

class DocumentController extends GetxController {
  //TODO: Implement DocumentController

  RxList<Documents> documentListModel = <Documents>[].obs;

  TextEditingController nameController = TextEditingController();

  final count = 0.obs;

  RxString username = ''.obs;
  RxString imagesCollect = ''.obs;

  RxString document_For = 'Self'.obs;
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

  RxString document_Type = 'Pan Card'.obs;
  var items2 = [
    'Pan Card',
    'Aadhar Front',
    'Aadhar Back',
    'GST',
    'DSC',
  ].obs;

  @override
  void onInit() {
    print(username);
    getDocument();
    getUserInfo();
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

  getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString(userName)!;
  }

  getDocument() async{
    var res = await ApiServices().getApi(documentURL);
    print("data response $res");
    res.fold((l){
      if(l['status'] == 200){
        List documentData = l['documents'];
        documentListModel.addAll(documentData.map((val) => Documents.fromJson(val)));
      }
      update();
    },(r){

    });
  }

  addDocument(Map map) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(userToken);
    print(map);
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseURL$addDocumentURL'),
      );
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['document_for'] = map['document_for'];
      document_For.value == 'Self' ?
      request.fields['name'] = username.value.toString() :
      request.fields['name'] = map['name'];
      request.fields['document_type'] = map['document_type'];
      request.files.add(await http.MultipartFile.fromPath('document', imagesCollect.value));
      var res = await request.send();
      print(res.statusCode);
      if(res.statusCode == 200){
        var responseBody = await http.Response.fromStream(res);
        print(responseBody.body);
        nameController.clear();
        Get.back();
        Get.snackbar(
            "Successful",
            "Your data has been update",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.BOTTOM
        );
        document_For.value = 'Self';
        document_Type.value = 'Pan Card';
        nameController.clear();
        imagesCollect.value.isEmpty;
        update();
        documentListModel.clear();
        getDocument();
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

