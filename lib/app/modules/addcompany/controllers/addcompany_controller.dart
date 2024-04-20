import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/companymanagment/controllers/companymanagment_controller.dart';

import '../../../../constants.dart';

class AddcompanyController extends GetxController {
  //TODO: Implement AddcompanyController
  CompanymanagmentController companymanagmentController = Get.put(CompanymanagmentController());

  final count = 0.obs;
  var collect = "".obs;
  final foreKey = GlobalKey<FormState>();
  //First for field
  TextEditingController gstinController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController llpinController = TextEditingController();
  // form field
  TextEditingController registerController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController rocController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController listingController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController authorizedController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var dropdownlist = 'Proprietorship'.obs;
  var items = [
    'Proprietorship',
    'Private Limited',
    'LLP',
  ].obs;

  var classlist = '- Class Of Company -'.obs;
  var classItems = [
    '- Class Of Company -',
    'Govt',
    'Semi-Govt',
    'Private-Govt',
  ].obs;

  var listinglist = '- Listing Status -'.obs;
  var listingItems = [
    '- Listing Status -',
    'Listed',
    'Non-Listed',
  ].obs;

  var categorylist = '- Selected Company Category -'.obs;
  var categoryItems = [
    '- Selected Company Category -',
    'Unlimited Companies',
    'One Person Companies (OPC)',
    'Private Companies',
    'Public Companies',
    'Holding and Subsidiary Companies',
    'Associate Companies',
    'Companies in terms of Access to Capital',
    'LLGovernment CompaniesP',
    'LLForeign CompaniesP',
    'LLCharitable CompaniesP',
    'LDormant CompaniesLP',
    'Nidhi Companies',
    'Public Financial Institutions',
  ].obs;

  @override
  void onInit(){
    super.onInit();
  }

  void increment() => count.value++;

  Widget methodName() {
    switch (dropdownlist.value) {
      case 'Proprietorship':
        return TextFormField(
          validator: (val){
            if(val!.isEmpty){
              return "Gst required";
            }
            return null;
          },
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
        return TextFormField(
            validator: (val){
              if(val!.isEmpty){
                return "Cin required";
              }
              return null;
            },
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
        return TextFormField(
            validator: (val){
              if(val!.isEmpty){
                return "Llpin required";
              }
              return null;
            },
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

  addCompanyDetails(
      String gst,
      String comapnyType,
      String register,
      String companyName,
      String roc,
      String category,
      String subcategory,
      String classCompany,
      String status,
      String auth,
      String paid,
      String email,
      String phone,
      String country,
      String state,
      String city,
      String zipcode,
      String address,
      ) async{
    print("object");
    var res = await ApiServices().postApi(addCompanyURL,{
      'cin' : gst,
      'customRadioTemp' :comapnyType,
      'registration_no' : register,
      'company_name' : companyName,
      'roc' : roc,
      'category' : category,
      'subcategory' : subcategory,
      'class' : classCompany,
      'status' : status,
      'authorized' : auth,
      'paidup' : paid,
      'email' : email,
      'phone' : phone,
      'country' : country,
      'state' : state,
      'city' : city,
      'postal_no' : zipcode,
      'address' : address,
    });
    res.fold((l){
      if(l['status'] == 200){
        print("Api response $res");
        companymanagmentController.companyModellist.clear();
        Get.back();
        companymanagmentController.onInit();
        Get.snackbar(
            "Successful",
            "Company has been added",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM
        );
        gstinController.clear();
      cinController.clear();
      llpinController.clear();
      registerController.clear();
      companyController.clear();
      rocController.clear();
      categorylist.value == '- Selected Company Category -';
      subCategoryController.clear();
      classlist.value == '- Class Of Company -';
      listinglist.value == '- Listing Status -';
      authorizedController.clear();
      paidController.clear();
      // contact details
      emailController.clear();
      phoneController.clear();
      countryController.clear();
      stateController.clear();
      cityController.clear();
      zipController.clear();
      addressController.clear();
      }
    },(r){});
  }
}
