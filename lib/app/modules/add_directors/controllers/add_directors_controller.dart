import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';

class AddDirectorsController extends GetxController {
//TODO: Implement AddDirectorsController

  final count = 0.obs;
  final custom_Id = Get.arguments;
// var appointmentDate = DateTime.now().obs;
// var issueDate = DateTime.now().obs;
// var expiryDate = DateTime.now().obs;
  final formKey = GlobalKey<FormState>();
  var multiplier = 1.obs; // Observable variable
  RxList<int> multiplesForm = <int>[1].obs; //Observable list
  RxList<TextEditingController> directorNameController =
      <TextEditingController>[TextEditingController()].obs;
  RxList<TextEditingController> designationController =
      <TextEditingController>[TextEditingController()].obs;
  RxList<TextEditingController> dinNumberController =
      <TextEditingController>[TextEditingController()].obs;
  RxList<DateTime> appointmentDate = <DateTime>[DateTime.now()].obs;
  RxList<DateTime> issueDate = <DateTime>[DateTime.now()].obs;
  RxList<DateTime> expiryDate = <DateTime>[DateTime.now()].obs;
  final List<Map<String, dynamic>> formDataList = <Map<String, dynamic>>[].obs;
// TextEditingController nameController = TextEditingController();
// TextEditingController designationController = TextEditingController();
// TextEditingController dinController = TextEditingController();

  @override
  void onInit() {
    print(custom_Id);
    print("controller Length-${directorNameController.length}");
    super.onInit();
  }

  firstDate(BuildContext context, int index) async {
    DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: appointmentDate[index],
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context, child) => Theme(
              data: ThemeData(
                  colorScheme: const ColorScheme.light(
                      onSurface: Colors.black,
                      surface: Colors.white,
                      primary: Colors.blue)),
              child: child!,
            ));
    if (datePicked != null && datePicked != appointmentDate.value) {
      appointmentDate[index] = datePicked;
    }
  }

  secondDate(BuildContext context, int index) async {
    DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: issueDate[index],
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context, child) => Theme(
              data: ThemeData(
                  colorScheme: const ColorScheme.light(
                      onSurface: Colors.black,
                      surface: Colors.white,
                      primary: Colors.blue)),
              child: child!,
            ));
    if (datePicked != null && datePicked != issueDate.value) {
      issueDate.value[index] = datePicked;
    }
  }

  thirdDate(BuildContext context, int index) async {
    DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: expiryDate[index],
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context, child) => Theme(
              child: child!,
              data: ThemeData(
                  colorScheme: const ColorScheme.light(
                      onSurface: Colors.black,
                      surface: Colors.white,
                      primary: Colors.blue)),
            ));
    if (datePicked != null && datePicked != expiryDate.value) {
      expiryDate[index] = datePicked;
    }
  }

  List<String> parseTextEditingControllers(
      List<TextEditingController> controllers) {
    List<String> parsedValues = [];
    for (TextEditingController controller in controllers) {
      parsedValues.add(controller.text);
    }
    return parsedValues;
  }

  List<String> parseDateTimeListToStringList(List<DateTime> dateTimeList,
      {String format = 'yyyy-MM-dd'}) {
    List<String> stringList = [];
    for (DateTime dateTime in dateTimeList) {
      String dateString = DateFormat(format).format(dateTime);
      stringList.add(dateString);
    }
    return stringList;
  }

  addDirector() async {
    String directorName =
        json.encode("${parseTextEditingControllers(directorNameController)}");
    String designation =
        jsonEncode("${parseTextEditingControllers(designationController)}");
    String dinNumber =
        jsonEncode("${parseTextEditingControllers(dinNumberController)}");
    String appointmentDateString =
        jsonEncode("${parseDateTimeListToStringList(appointmentDate)}");
    String issueDateString =
        jsonEncode("${parseDateTimeListToStringList(issueDate)}");
    String expiryDateString =
        jsonEncode("${parseDateTimeListToStringList(expiryDate)}");
    print("Function addDirector");

    var requestBody = {
      'customer_company_data_id': custom_Id.toString(),
    };

    // Adding loop data
    for (int i = 0; i < 2; i++) {
      requestBody['name[$i]'] = directorNameController[i].text;
    }

    for (int i = 0; i < designationController.length; i++) {
      requestBody['designation[$i]'] = designationController[i].text;
    }

    for (int i = 0; i < dinNumberController.length; i++) {
      requestBody['din_no[$i]'] = dinNumberController[i].text;
    }

    for (int i = 0; i < appointmentDate.length; i++) {
      requestBody['appoint_date[$i]'] = appointmentDate[i].toString();
    }

    for (int i = 0; i < issueDate.length; i++) {
      requestBody['issue_date[$i]'] = issueDate[i].toString();
    }

    for (int i = 0; i < expiryDate.length; i++) {
      requestBody['expiry_date[$i]'] = expiryDate[i].toString();
    }


    var res = await ApiServices().postApi(addDirectorsURL,requestBody);
    print(res);
    res.fold((l) {
      if (l['status'] == 200) {
        print("APi response $res");
        Get.back();
        Get.back();
        Get.snackbar("Successful", "Directors has been Added",
            backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
      }
    }, (r) {});
  }

  void generateMultiple() {
    multiplesForm.add(multiplier.value + 1);
    directorNameController.add(TextEditingController());
    designationController.add(TextEditingController());
    dinNumberController.add(TextEditingController());
    appointmentDate.add(DateTime.now());
    issueDate.add(DateTime.now());
    expiryDate.add(DateTime.now());
  }

  void removeAtIndex(int index) {
    if (index >= 0 && index < multiplesForm.length) {
      multiplesForm.removeAt(index);
      update();
    }
  }

  @override
  void dispose() {
    multiplesForm.clear();
    super.dispose();
  }
}
