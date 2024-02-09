import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/app/modules/addcompany/views/addcompany_view.dart';
import 'package:vakil99/app/modules/companydetails/views/companydetails_view.dart';
import 'package:vakil99/app/modules/companyupdate/views/companyupdate_view.dart';
import 'package:vakil99/constants.dart';
import '../controllers/companymanagment_controller.dart';

class CompanymanagmentView extends GetView<CompanymanagmentController> {
  const CompanymanagmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text('Company Managment',style: TextStyle(color: Colors.white),),
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
                    const Text("Company",
                    style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(AddcompanyView());
                      },
                      child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.green.shade400,
                          ),
                          child: const Center(
                              child: Text(
                                "Add Company",
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              ))),
                    )
                  ],
                ),

                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300,width: 2)
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Search",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search)
                    ),
                  ),
                ),

                const SizedBox(height: 10,),
                SizedBox(
                  height: Get.width * 1.80,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, i){
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          height: Get.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 6.0,
                                ),]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("S no. 1",style: TextStyle(fontSize: 16,color: primaryColor,fontWeight: FontWeight.bold),),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text("CIN : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("12345",style: TextStyle(fontSize: 18),)
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Company Name : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Zynomatrix",style: TextStyle(fontSize: 18),)
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Company Catagory : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Software Tech",style: TextStyle(fontSize: 18),)
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Register Number : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Zynomatrix",style: TextStyle(fontSize: 18),)
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("ROC : ",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Ujjain21",style: TextStyle(fontSize: 18),)
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          Get.to(const CompanydetailsView());
                                        },
                                        icon: const Icon(Icons.description,color: Colors.orange,)
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          Get.to(CompanyupdateView());
                                        },
                                        icon: const Icon(Icons.edit_document,color: Colors.green,)
                                    ),
                                    IconButton(
                                        onPressed: (){},
                                        icon: const Icon(Icons.delete,color: Colors.red,)
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
