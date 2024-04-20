import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/Models/CompanyModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/constants.dart';

class CompanymanagmentController extends GetxController {
  //TODO: Implement CompanymanagmentController

  RxList<Datum> companyModellist = <Datum>[].obs;
  final count = 0.obs;

  @override
  void onInit() {
    getCompany();
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


  getCompany() async{
    var res = await ApiServices().getApi(companyURL);
    res.fold((l){
      if(l['status'] == 200){
        List companyData = l['data'];
        companyModellist.addAll(companyData.map((e) => Datum.fromJson(e)));
      }
    },(r){});
  }

  getDeleteCompany(
      String companyId
      ) async{
    var res = await ApiServices().getApi(companyDeleteURL+companyId);
    print(companyId);
    res.fold((l){
      if(l['status'] == 200){
        print("api delete response $res");
        Get.snackbar(
          "Successful",
          "Company has been deleted",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
        companyModellist.clear();
        update();
        getCompany();
      }
    },(r){

    });
  }

  void removeIndex(int index) {
    if (index >= 0 && index < companyModellist.length) {
      companyModellist.removeAt(index);
      update();
    }
  }

}
