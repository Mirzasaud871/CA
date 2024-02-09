import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/loginpage/views/loginpage_view.dart';

import '../../../../constants.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
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

  logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isUserLogin,false);
    sharedPreferences.remove(user_Id);
    sharedPreferences.remove(userName);
    sharedPreferences.remove(userImage);
    sharedPreferences.remove(userToken);
    sharedPreferences.remove(userEmail);
    Get.offAll(LoginpageView());
  }
}
