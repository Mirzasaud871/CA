import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vakil99/app/modules/home/controllers/home_controller.dart';
import 'package:vakil99/app/modules/loginpage/views/loginpage_view.dart';
import '../../../../Models/DocumnetModel.dart';
import '../../../../Models/FamilyModel.dart';
import '../../../../Models/LedgerModel.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  HomeController homeController = Get.put(HomeController());
  RxList<Order> orderlistModel = <Order>[].obs;
  RxList<Members> familyListModel = <Members>[].obs;
  RxList<Documents> documentListModel = <Documents>[].obs;

  List<double> amounts = [10.0, 20.0, 30.0, 40.0, 50.0];
  final totalAmount = 0.obs;
  var username = ''.obs;
  var sum = 0.obs;

  @override
  void onInit(){
    print("profile oninit ");
    getOrder();
    getFamily();
    getDocument();
    getInfo();
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
    orderlistModel.clear();
    var res = await ApiServices().getApi(myOrderURL);
    res.fold((l){
      if(l['status'] == 200){
        List orderData = l['orders'];
        orderlistModel.addAll(orderData.map((val) => Order.fromJson(val)));
        sumTotal();
      }else if(l['status'] == 405){
        print("error order page 405");
      }
      update();
    },(r){
    });
  }

  sumTotal(){
    sum.value = 0;
    update();
    for(int i = 0; i < orderlistModel.length; i++){
      sum.value = orderlistModel[i].amount + orderlistModel[i].amount;
    }
    update();
    print('Sum of amounts: $sum');
  }

  getFamily() async{
    familyListModel.clear();
    var res = await ApiServices().getApi(familyMembersURL);
    print(res);
    res.fold((l){
      if(l['status'] == 200){
        List familyData = l['members'];
        familyListModel.addAll(familyData.map((val) => Members.fromJson(val)));
      }
      update();
    },(r){

    });
  }
  getDocument() async{
    documentListModel.clear();
    var res = await ApiServices().getApi(documentURL);
    res.fold((l){
      if(l['status'] == 200){
        List documentData = l['documents'];
        documentListModel.addAll(documentData.map((val) => Documents.fromJson(val)));
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
    // sharedPreferences.clear();
    print("${homeController.username.value}");
    print("logout name ${sharedPreferences.getString(userName)}");
    print("logout email ${sharedPreferences.getString(userEmail)}");
    print("logout id ${sharedPreferences.getString(user_Id)}");
    Get.offAll(LoginpageView());
  }

  getInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username.value = preferences.getString(userName)!;
    // update();
  }
}
