import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/loginpage/views/loginpage_view.dart';

import '../../../../Models/LedgerModel.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';
import '../../myorder/controllers/myorder_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  RxList<Order> myOrderlistModel = <Order>[].obs;
  List<double> amounts = [10.0, 20.0, 30.0, 40.0, 50.0];
  final totalAmount = 0.obs;
  RxString username = ''.obs;
  var sum = 0.0.obs;

  @override
  void onInit() {
    getInfo();
    getOrder();
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

  getOrder() async{
    print("my order function");
    var res = await ApiServices().getApi(myOrderURL);
    res.fold((l){
      if(l['status'] == 200){
        List orderData = l['orders'];
        myOrderlistModel.addAll(orderData.map((val) => Order.fromJson(val)));
        totalSum();
      }else if(l['status'] == 405){
        print("error order page 405");
      }
      update();
    },(r){
    });
  }


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

  totalSum(){
    sum.value = 0;
    for(int i = 0; i < myOrderlistModel.length; i++){
      sum.value += myOrderlistModel[i].amount;
    }
    print('Sum of amounts: $sum');
  }

  getInfo() async{
    print("get information");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username.value = preferences.getString(userName)!;
  }
}
