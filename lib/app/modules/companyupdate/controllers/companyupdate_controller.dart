import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/companymanagment/controllers/companymanagment_controller.dart';

import '../../../../Models/CompanyModel.dart';
import '../../../../constants.dart';

class CompanyupdateController extends GetxController {
  //TODO: Implement CompanyupdateController
  CompanymanagmentController companymanagmentController = Get.put(CompanymanagmentController());

  RxList<Datum> companyModellist = <Datum>[].obs;
  final count = 0.obs;
  var collect = "".obs;
  var cinNum = Get.arguments;
  final foreKey = GlobalKey<FormState>();
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


  final getCin = ''.obs;
  final getCompanyName = ''.obs;
  final getCategory = ''.obs;
  final getClass = ''.obs;
  final getAuthorized = ''.obs;
  final getRegistration = ''.obs;
  final getRoc = ''.obs;
  final getSubCategory = ''.obs;
  final getStatus = ''.obs;
  final getPaidUp = ''.obs;
  final getEmail = ''.obs;
  final getMobile = ''.obs;
  final getCountry = ''.obs;
  final getState = ''.obs;
  final getCity = ''.obs;
  final getZipCode = ''.obs;
  final getAddress = ''.obs;
  final getId = ''.obs;

  @override
  void onInit() {
    getCompanyDetails();
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
            controller: cinController,
            decoration: InputDecoration(
              hintText: "GSTIN",
              labelText: "${getCin}",
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
              labelText: "${getCin}",
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
            controller: cinController,
            decoration: InputDecoration(
              hintText: "LLP",
              labelText: "${getCin}",
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

  companyUpdate(
      String cin,
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
    print("company id ");
    var res = await ApiServices().postApi(companyUpdateURL,
    {
      'id' : "2",
      'cin' : cin,
      'company_type' : dropdownlist.value,
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
     }else{
       print("error");
     }
    },(r){});
  }

  getCompanyDetails() async{
    var res = await ApiServices().getApi(companyViewURL+cinNum);
    res.fold((l){
      if(l['status'] == 200){
        getCin.value = l['company']['CIN'];
        getCompanyName.value = l['company']['company_name'];
        getCategory.value = l['company']['category'];
        getClass.value = l['company']['class'];
        getAuthorized.value = l['company']['authorized'];
        getRegistration.value = l['company']['registration_no'];
        getRoc.value = l['company']['roc'];
        getSubCategory.value = l['company']['subcategory'];
        getStatus.value = l['company']['status'];
        getPaidUp.value = l['company']['paidup'];
        getEmail.value = l['company']['email'];
        getMobile.value = l['company']['phone'];
        getCountry.value = l['company']['country'];
        getState.value = l['company']['state'];
        getCity.value = l['company']['city'];
        getZipCode.value = l['company']['postal_no'];
        getAddress.value = l['company']['address'];
        print("dtails $res");
      }
      print(l['status']);
    },(r){
      print("Error right side $res");
    });
  }
}
