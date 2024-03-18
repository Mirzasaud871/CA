import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../apiservices.dart';
import '../../../../constants.dart';

class AddDirectorsController extends GetxController {
  //TODO: Implement AddDirectorsController

  final count = 0.obs;
  final custom_Id = Get.arguments;
  var appointmentDate = DateTime.now().obs;
  var issueDate = DateTime.now().obs;
  var expiryDate = DateTime.now().obs;
  final formKey = GlobalKey<FormState>();
  var multiplier = 1.obs; // Observable variable
  RxList<int> multiplesForm = <int>[1].obs;// Observable list
  final List<Map<String, dynamic>> formDataList = <Map<String, dynamic>>[].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController dinController = TextEditingController();


  @override
  void onInit() {
    print(custom_Id);
    super.onInit();
  }


  void increment() => count.value++;

  firstDate()async{
    DateTime? datePicked = await showDatePicker(
        context: Get.context!,
        initialDate: appointmentDate.value,
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context , child) => Theme(
          child: child!,
          data: ThemeData(
              colorScheme: const ColorScheme.light(
                  onSurface: Colors.black,
                  surface: Colors.white,
                  primary: Colors.blue
              )
          ),
        )
    );
    if(datePicked != null && datePicked != appointmentDate.value){
      appointmentDate.value = datePicked;

    }
  }

  secondDate()async{
    DateTime? datePicked = await showDatePicker(
        context: Get.context!,
        initialDate: issueDate.value,
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context , child) => Theme(
          child: child!,
          data: ThemeData(
              colorScheme: const ColorScheme.light(
                  onSurface: Colors.black,
                  surface: Colors.white,
                  primary: Colors.blue
              )
          ),
        )
    );
    if(datePicked != null && datePicked != issueDate.value){
      issueDate.value = datePicked;

    }
  }

  thirdDate()async{
    DateTime? datePicked = await showDatePicker(
        context: Get.context!,
        initialDate: expiryDate.value,
        firstDate: DateTime(1995),
        lastDate: DateTime(2025),
        builder: (context , child) => Theme(
          child: child!,
          data: ThemeData(
              colorScheme: const ColorScheme.light(
                  onSurface: Colors.black,
                  surface: Colors.white,
                  primary: Colors.blue
              )
          ),
        )
    );
    if(datePicked != null && datePicked != expiryDate.value){
      expiryDate.value = datePicked;

    }
  }

  addDrector() async{
    print("Function addDirector");
    var res = await ApiServices().postApi(addDirectorsURL, {
      'customer_company_data_id' : custom_Id.toString(),
      'name[]' : "nameList".toString(),
      'designation[]' :" nameList0".toString(),
      'din_no[]' : "nameList0".toString(),
      'appoint_date[]' : "08-05-24".toString(),
      'issue_date[]' : "08-05-24".toString(),
      'expiry_date[]' : "08-05-24".toString(),
    });
    print(res);
    res.fold((l){
      if(l['status'] == 200){
        print("APi response $res");
        nameController.clear();
        dinController.clear();
        designationController.clear();
        Get.back();
      }
    },(r){});
  }

  void generateMultiples() {
      for (int i = 1; i <= 1; i++) {
      multiplesForm.add(multiplier.value * i);
    }
  }

  void removeAtIndex(int index) {
    if (index >= 0 && index < multiplesForm.length) {
      multiplesForm.removeAt(index);
      update();
    }
  }

  // void addFormField() {
  //   final namecontroller = TextEditingController(); // Create a new controller
  //   nameController.add(namecontroller);
  //   final designationcontroller = TextEditingController(); // Create a new controller
  //   nameController.add(designationcontroller);
  //   final dincontroller = TextEditingController(); // Create a new controller
  //   nameController.add(dincontroller);
  //
  //   formFields.add(
  //     SingleChildScrollView(
  //       child: Column(
  //         children: [
  //         Container(
  //               padding: EdgeInsets.all(8.0),
  //               margin: EdgeInsets.all(10.0),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(6.0),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withOpacity(0.5),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes the shadow position
  //                   ),
  //                 ],
  //               ),
  //               child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: Container(
  //                           margin: EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text("Directors Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                               SizedBox(height: 5,),
  //                               TextFormField(
  //                                 controller: namecontroller,
  //                                 decoration: InputDecoration(
  //                                   hintText: "Name",
  //                                   focusColor: primaryColor,
  //                                   suffixIconColor: primaryColor,
  //                                   focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(color: primaryColor)),
  //                                   border: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5.0),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           )
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                           margin: EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text("Designation",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                               SizedBox(height: 5,),
  //                               TextFormField(
  //                                 controller: designationcontroller,
  //                                 decoration: InputDecoration(
  //                                   hintText: "Designation",
  //                                   focusColor: primaryColor,
  //                                   suffixIconColor: primaryColor,
  //                                   focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(color: primaryColor)),
  //                                   border: OutlineInputBorder(
  //                                     borderRadius: BorderRadius.circular(5.0),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           )
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: Container(
  //                             margin: EdgeInsets.all(8.0),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text("DIN Number",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                                 SizedBox(height: 5,),
  //                                 TextFormField(
  //                                   controller: dincontroller,
  //                                   decoration: InputDecoration(
  //                                     hintText: "DIN Number",
  //                                     focusColor: primaryColor,
  //                                     suffixIconColor: primaryColor,
  //                                     focusedBorder: OutlineInputBorder(
  //                                         borderSide: BorderSide(color: primaryColor)),
  //                                     border: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5.0),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                             margin: EdgeInsets.all(8.0),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text("Date of Appointment",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                                 SizedBox(height: 5,),
  //                                 InkWell(
  //                                   onTap: () {
  //                                     firstDate();
  //                                   },
  //                                   child: Container(
  //                                     margin:
  //                                     EdgeInsets.symmetric(
  //                                         horizontal: 2.0),
  //                                     height: Get.width * 0.16,
  //                                     width: double.infinity,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius
  //                                           .circular(5.0),
  //                                       border: Border.all(
  //                                           color: Colors.black),
  //                                       color: Colors.white,
  //                                     ),
  //                                     child: Obx(() =>
  //                                         Padding(
  //                                           padding: const EdgeInsets.all(10.0),
  //                                           child: Column(
  //                                             crossAxisAlignment: CrossAxisAlignment.start,
  //                                             mainAxisAlignment: MainAxisAlignment.center,
  //                                             children: [
  //                                               Text(
  //                                                 DateFormat("dd-MM-yyyy")
  //                                                     .format(
  //                                                     appointmentDate.value)
  //                                                     .toString(),
  //                                                 style: const TextStyle(
  //                                                   fontSize: 18,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         )),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: Container(
  //                             margin: EdgeInsets.all(8.0),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text("Date of Issue",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                                 SizedBox(height: 5,),
  //                                 InkWell(
  //                                   onTap: () {
  //                                     secondDate();
  //                                   },
  //                                   child: Container(
  //                                     margin:
  //                                     EdgeInsets.symmetric(
  //                                         horizontal: 2.0),
  //                                     height: Get.width * 0.16,
  //                                     width: double.infinity,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius
  //                                           .circular(5.0),
  //                                       border: Border.all(
  //                                           color: Colors.black),
  //                                       color: Colors.white,
  //                                     ),
  //                                     child: Obx(() =>
  //                                         Padding(
  //                                           padding: const EdgeInsets.all(10.0),
  //                                           child: Column(
  //                                             crossAxisAlignment: CrossAxisAlignment.start,
  //                                             mainAxisAlignment: MainAxisAlignment.center,
  //                                             children: [
  //                                               Text(
  //                                                 DateFormat("dd-MM-yyyy")
  //                                                     .format(
  //                                                     issueDate.value)
  //                                                     .toString(),
  //                                                 style: const TextStyle(
  //                                                   fontSize: 18,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         )),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(
  //                             margin: EdgeInsets.all(8.0),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text("Date of Expiry",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
  //                                 SizedBox(height: 5,),
  //                                 InkWell(
  //                                   onTap: () {
  //                                     thirdDate();
  //                                   },
  //                                   child: Container(
  //                                     margin:
  //                                     EdgeInsets.symmetric(
  //                                         horizontal: 2.0),
  //                                     height: Get.width * 0.16,
  //                                     width: double.infinity,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius
  //                                           .circular(5.0),
  //                                       border: Border.all(
  //                                           color: Colors.black),
  //                                       color: Colors.white,
  //                                     ),
  //                                     child: Obx(() =>
  //                                         Padding(
  //                                           padding: const EdgeInsets.all(10.0),
  //                                           child: Column(
  //                                             crossAxisAlignment: CrossAxisAlignment.start,
  //                                             mainAxisAlignment: MainAxisAlignment.center,
  //                                             children: [
  //                                               Text(
  //                                                 DateFormat("dd-MM-yyyy")
  //                                                     .format(
  //                                                     expiryDate.value)
  //                                                     .toString(),
  //                                                 style: const TextStyle(
  //                                                   fontSize: 18,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         )),
  //                                   ),
  //                                 ),
  //                               ],
  //                             )
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //                 ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // void encodeText() {
  //   for (int i = 0; i < nameController.length; i++) {
  //     String name = nameController[i].text;
  //     nameList = Uri.encodeFull(name);
  //     print('Encoded text for field $i: $nameList');
  //   }
  // }

}

