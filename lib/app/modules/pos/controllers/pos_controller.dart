import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constants.dart';

class PosController extends GetxController {
  //TODO: Implement PosController

  final count = 0.obs;
  var getUserId = 0.obs;
  RxString getUserName = ''.obs;
  RxString getUserEmail = ''.obs;
  RxString getTradeName = ''.obs;
  RxString getMobile = ''.obs;
  RxString url = ''.obs;
  RxString whatsAppUrl = ''.obs;
  // String Url = "$posDomain?id=189&name=saudmirza&email=mirzasaud@gmail.com&contact_no=74000562335&permanent_address=ujjain&temp_address=ujjain";
  late final WebViewController webViewCtrl;

  @override
  void onInit() {
    getInfoName();
    print(userName);
    print(userEmail);
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

  Future<String> getNamespace() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userName = sharedPreferences.getString('userName');
    return userName ?? ''; // If userName is null, return an empty string
  }


  getInfoName() async{
    print("object information");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getUserId.value = sharedPreferences.getInt(user_Id)!;
    getUserName.value = sharedPreferences.getString(userName)!;
    getUserEmail.value = sharedPreferences.getString(userEmail)!;
    getMobile.value = sharedPreferences.getString(userMobile)!;
    print("object information details");
    update();
    url.value = "$posDomain?id=$getUserId&name=$getUserName&email=$getUserEmail&contact_no=$getMobile&permanent_address=ujjain&temp_address=ujjain";
    whatsAppUrl.value = "https://wa.me/$getMobile?text=Hello sir";
    print("print ${getUserId}");
    print("print ${getUserEmail}");
    print("print ${getUserName}");
    print("print ${getMobile}");
    print("print ${url}");
  }

  Future<void> launchWhatsApp(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch WhatsApp URL: $url');
      // Handle the case when the WhatsApp URL cannot be launched
    }
  }

  //profile data
  // getProfile() async{
  //   var res = await ApiServices().getApi(profileURL);
  //   res.fold((l){
  //     if(l['status'] == 200){
  //       userId = l['customer']['id'];
  //       getUserName = l['customer']['name'];
  //       getUserEmail = l['customer']['email'];
  //       getTradeName = l['customer']['trade'];
  //       getMobile = l['customer']['mobile_no'];
  //     }
  //   },(r){
  //     print("right error $res");
  //   });
  // }



}
