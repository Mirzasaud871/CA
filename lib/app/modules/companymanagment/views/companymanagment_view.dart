import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/app/modules/add_directors/views/add_directors_view.dart';
import 'package:vakil99/app/modules/addcompany/views/addcompany_view.dart';
import 'package:vakil99/app/modules/companydetails/views/companydetails_view.dart';
import 'package:vakil99/app/modules/companyupdate/views/companyupdate_view.dart';
import 'package:vakil99/constants.dart';
import '../controllers/companymanagment_controller.dart';

class CompanymanagmentView extends GetView<CompanymanagmentController> {
  CompanymanagmentView({Key? key}) : super(key: key);
  CompanymanagmentController companymanagmentController =
      Get.put(CompanymanagmentController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: primaryColor,
          title: const Text(
            'Company Managment',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //Dialoge
                  Row(
                    children: [
                      const Text(
                        "Company",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(AddcompanyView());
                        },
                        child: Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                            child: const Center(
                                child: Text(
                              "Add Company",
                              style:
                                  TextStyle(fontSize: 16, color: primaryColor),
                            ))),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 2)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Search",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            companymanagmentController.companyModellist.length,
                        itemBuilder: (context, index) {
                          return DelayedDisplay(
                            delay: const Duration(milliseconds: 200),
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 6.0,
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex:5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "S_No. ${index + 1}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Text(
                                            "CIN : ${companymanagmentController.companyModellist[index].cin}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.048),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            "Company Name : ${companymanagmentController.companyModellist[index].companyName}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.048),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            "Catagory : ${companymanagmentController.companyModellist[index].category}",
                                            style: TextStyle(fontSize: screenWidth * 0.048),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            "Register Number : ${companymanagmentController.companyModellist[index].registrationNo}",
                                            style: TextStyle(fontSize: screenWidth * 0.048),
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          Text(
                                            "ROC : ${companymanagmentController.companyModellist[index].roc}",
                                            style: TextStyle(fontSize: screenWidth * 0.048),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: PopupMenuButton<int>(
                                              itemBuilder: (context) => [
                                                // PopupMenuItem 1
                                                PopupMenuItem(
                                                  value: 1,
                                                  // row with 2 children
                                                  child: InkWell(
                                                    onTap: (){
                                                      Get.back();
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.to(() => CompanydetailsView(),
                                                            arguments:
                                                            companymanagmentController
                                                                .companyModellist[index]
                                                                .cin);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.description,color: Colors.orange,),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text("View",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // PopupMenuItem 2
                                                PopupMenuItem(
                                                  value: 2,
                                                  // row with two children
                                                  child: InkWell(
                                                    onTap: (){
                                                      Get.to( ()=> CompanyupdateView(),arguments:companymanagmentController.companyModellist[index].cin,);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.edit_document,color: Colors.green,),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Edit",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // PopupMenuItem 3
                                                PopupMenuItem(
                                                  value: 3,
                                                  // row with two children
                                                  child: InkWell(
                                                    onTap: (){
                                                      Get.back();
                                                      companymanagmentController.getDeleteCompany("${companymanagmentController.companyModellist[index].id}");
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.delete,color: Colors.red,),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Delete",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // PopupMenuItem 4
                                                PopupMenuItem(
                                                  value: 4,
                                                  // row with two children
                                                  child: InkWell(
                                                    onTap: (){
                                                      Get.back();
                                                      Get.to( ()=> AddDirectorsView(),arguments: companymanagmentController.companyModellist[index].id);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.add,color: Colors.blue,),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Add",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              offset: Offset(0, 50),
                                              color: Colors.white,
                                              elevation: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
