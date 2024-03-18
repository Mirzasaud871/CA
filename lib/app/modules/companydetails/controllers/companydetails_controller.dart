import 'package:get/get.dart';
import 'package:vakil99/Models/DetailsModel.dart';
import 'package:vakil99/Models/DirectiorModel.dart';
import 'package:vakil99/apiservices.dart';
import 'package:vakil99/constants.dart';

class CompanydetailsController extends GetxController {
  //TODO: Implement CompanydetailsController

  final cinNum = Get.arguments;

  RxList<Detail> detailsListModel = <Detail>[].obs;

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
  //director details
  final getDirectorName = ''.obs;
  final getdesignation = ''.obs;
  final getDinNumber = ''.obs;
  final getAppointmentDate = ''.obs;
  final getIssueDate = ''.obs;
  final getAppointmeDate = ''.obs;

  @override
  void onInit() {
    getCompanyDetails();
    print("CinNumber $cinNum");
    super.onInit();
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
        List detailsDirector = l['company']['details'];
        detailsListModel.addAll(detailsDirector.map((val) => Detail.fromJson(val)));
        print("dtails $res");
      }
      print(l['status']);
    },(r){
      print("Error right side $res");
    });
  }

}
