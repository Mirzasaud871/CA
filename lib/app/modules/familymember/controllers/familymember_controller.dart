import 'package:get/get.dart';
import 'package:vakil99/Models/FamilyModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/constants.dart';

class FamilymemberController extends GetxController {
  //TODO: Implement FamilymemberController

  RxList<Members> familyListModel = <Members>[].obs;
  final count = 0.obs;

  @override
  void onInit(){
    print("subject");
    getFamily();
    super.onInit();
  }

  getFamily() async{
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

}
