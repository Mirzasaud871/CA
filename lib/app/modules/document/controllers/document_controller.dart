import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io' as Io;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
      print('fesn $e');
      Get.snackbar("Error", "Please fill up this Form",backgroundColor: Colors.red,colorText: Colors.white);
      return Right(e);
    }
  }

  Future<void> saveImage(String imagePath) async {
    try {
      // Load the image from the given path.
      ByteData imageData = await rootBundle.load(imagePath);
      Uint8List bytes = imageData.buffer.asUint8List();
      // Convert the bytes to an Image object.
      ui.Image image = await decodeImageFromList(bytes);
      // Save the image to the gallery.
      final result = await ImageGallerySaver.saveImage(bytes);
      // Show a message based on the result.
      if (result['isSuccess']) {
        print('Image saved successfully');
      } else {
        print('Failed to save image: ${result['error']}');
      }
    } catch (e) {
      print('Error saving image: $e');
      Get.snackbar(
          "Error saving image",
          "$e",
          backgroundColor: Colors.red
      );
    }
  }

  Future<String> getDownloadDirectory() async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }
  void downloadFile(String imagePath) async {
    try {
      var time = DateTime.now().millisecondsSinceEpoch;
      var downloadDirectory = await getDownloadDirectory();
      var path = '$downloadDirectory/image-$time.jpg';
      var file = File(path);
      var response = await http.get(Uri.parse(imagePath));

      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded to: $path');
        Get.snackbar("Download Successful", "save path $path");
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

}

