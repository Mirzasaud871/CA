import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class AddcompanyController extends GetxController {
  //TODO: Implement AddcompanyController

  final count = 0.obs;
  var collect = "".obs;
  final foreKey = GlobalKey<FormState>();
  TextEditingController gstinController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController llpinController = TextEditingController();
  var dropdownlist = 'Proprietorship'.obs;
  var items = [
    'Proprietorship',
    'Private Limited',
    'LLP',
  ].obs;




  void increment() => count.value++;

  Widget methodName() {
    switch (dropdownlist.value) {
      case 'Proprietorship':
        return TextField(
            controller: gstinController,
            decoration: InputDecoration(
              hintText: "GSTIN",
              labelText: "GSTIN Number",
              focusColor: primaryColor,
              suffixIcon: const Icon(Icons.person_2),
              suffixIconColor: primaryColor,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ));
        // do something
        break;
      case "Private Limited":
        return TextField(
            controller: cinController,
            decoration: InputDecoration(
              hintText: "CIN",
              labelText: "CIN Number",
              focusColor: primaryColor,
              suffixIcon: const Icon(Icons.person_2),
              suffixIconColor: primaryColor,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ));
        // do something else
        break;
      case "LLP":
        return TextField(
            controller: llpinController,
            decoration: InputDecoration(
              hintText: "LLPIN",
              labelText: "LLPIN Number",
              focusColor: primaryColor,
              suffixIcon: Icon(Icons.person_2),
              suffixIconColor: primaryColor,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ));
        break;
    }
    return const SizedBox();
  }
}
