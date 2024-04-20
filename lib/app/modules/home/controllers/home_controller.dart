import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/Models/CategoryModel.dart';
import 'package:vakil99/Models/SearchModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/app/modules/details/views/details_view.dart';
import '../../../../Models/FeaturedServicesModel.dart';
import '../../../../constants.dart';
import '../../startup/views/startup_view.dart';

class HomeController extends GetxController {

  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxList<FeaturedServiceModel> featuredServices = <FeaturedServiceModel>[].obs;
  RxList<CaServices> featuredServicesSearch = <CaServices>[].obs;
  final RxList<CaServices> filteredData = <CaServices>[].obs;

  var username = ''.obs;
  var useremail = ''.obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  @override
  void onInit() {
    searchSevice();
    getCategories();
    getInfo();
    getFeatureCategory();
    super.onInit();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      // If query is empty, show all items
      filteredData.assignAll(featuredServicesSearch);
      filteredData.clear();
      return;
    }

    // Filter items based on the query
    filteredData.assignAll(featuredServicesSearch
        .where((service) =>
        service.name!.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }

  getCategories() async{
    categories.clear();
    var res = await ApiServices().getApi(categoryURL);
    res.fold((l){
      if(l['status'] == 200){
        List category = l['categories'];
        categories.addAll(category.map((val) => CategoriesModel.fromJson(val)));
      }
      update();
    }, (r){
    });
  }

  void navigateToPage(String routeId , int index) {
   if(routeId == "1"){
     print("category pr phocha h");
     Get.to(() => DetailsView(), arguments:
     featuredServices[index].slug);
   }else{
     print("service pr phocha h");
     Get.to(StartupView(categories[index].companyService));
   }
  }

  getFeatureCategory() async{
    featuredServices.clear();
    var res = await ApiServices().getApi(featuredCategoryURL);
      print("services api respons $res");
    res.fold((l){
      if(l['status'] == 200){
        List featureCategory = l['featured_category'];
        List featureService = l['featured_service'];
        featuredServices.addAll(featureCategory.map((val) => FeaturedServiceModel.fromJson(val)));
        featuredServices.addAll(featureService.map((vl) => FeaturedServiceModel.fromJson(vl)));
      }
      update();
    }, (r){
    });
  }

  searchSevice() async{
    var res = await ApiServices().getApi(searchURL+searchController.text);
    res.fold((l){
      if(l['status'] == 200){
        print("not found $res");
        // print("data serach api $res");
        List searchServices = l['ca_services'];
        featuredServicesSearch.addAll(searchServices.map((val2) => CaServices.fromJson(val2)));
      }else{
      }
    }, (r){

    });
  }

  getInfo() async{
    print("object information");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username.value = sharedPreferences.getString(userName)!;
    useremail.value = sharedPreferences.getString(userEmail)!;
    print("object information details");
    update();
    print("print ${sharedPreferences.getString(userToken)}");
    print("print ${sharedPreferences.getString(userEmail)}");
    print("print ${sharedPreferences.getString(userName)}");
    print("print ${sharedPreferences.getInt(user_Id)}");
  }

}

class searchServiceModel {
  final String name;
  searchServiceModel({required this.name});
}