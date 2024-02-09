import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/Models/CategoryModel.dart';
import 'package:vakil99/apiservices.dart';
import '../../../../Models/FeaturedServicesModel.dart';
import '../../../../constants.dart';

class HomeController extends GetxController {

  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxList<FeaturedServiceModel> featuredServices = <FeaturedServiceModel>[].obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getFeatureCategory();
    show();
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

  getFeatureCategory() async{
    featuredServices.clear();
    var res = await ApiServices().getApi(featuredCategoryURL);
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

  getSearch() async{
    var res = await ApiServices().getApi(searchURL+searchController.text);
    res.fold((l){
      if(l['status'] == 200){
        print("data serach api $res");
      }else{
        print("not found");
      }
    }, (r){

    });
  }

  show() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(userName);
    sharedPreferences.getString(userEmail);
    sharedPreferences.getString(userToken);
    print("print ${sharedPreferences.getString(userToken)}");
    print("print ${sharedPreferences.getString(userEmail)}");
    print("print ${sharedPreferences.getString(userName)}");
  }

}
