import 'package:flutter/cupertino.dart';
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
      print(res);
    },(r){});
  }


}
