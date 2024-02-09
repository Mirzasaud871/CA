import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/constants.dart';

import '../controllers/gstproprietorship_controller.dart';

class GstproprietorshipView extends GetView<GstproprietorshipController> {
  const GstproprietorshipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'GST Proprietorship',
          style:TextStyle(fontSize: 15,color: Colors.black),
        ),
        leading:IconButton(onPressed: (){
          Get.back();
        },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          const Icon(Icons.account_balance_wallet,size: 30,),
          const SizedBox(width: 10),
          const Icon(Icons.notification_add,size: 30,),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const Text("Initial Charge : 250/- Rupees",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              const Text("Discounted Price is 200/- Rupees", style: TextStyle(color: Colors.green,fontSize: 12),),
              const SizedBox(height: 20,),
              const Text("The list of documents required for registration of GST for Proprietorship are as follows:",textAlign: TextAlign.center,style: TextStyle(fontSize: 9),),
              const SizedBox(height: 10,),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                height: Get.width * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [ BoxShadow(
                    blurRadius: 4.0,
                    color: Colors.grey.shade400
                  ),],
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          const Text("List of Proofs",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          const Spacer(),
                          TextButton(onPressed: (){},
                              child: const Row(children: [
                                Icon(Icons.edit_document),
                                Text("Downlord Proof List",style: TextStyle(fontSize: 12),)
                              ],))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Proofs for Proprietorship",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 8,),
                          Text("1.  PAN",style: TextStyle(fontSize: 12),),
                          SizedBox(height: 6,),
                          Text("2. Aadhaar",style: TextStyle(fontSize: 12),),
                          SizedBox(height: 6,),
                          Text("3. Password Size Photograph",style: TextStyle(fontSize: 12),),
                          SizedBox(height: 6,),
                        ],
                      )
                    ),

                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Proofs for Private Limited/One Person/LLP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("1.  PAN",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                            Text("2. Aadhaar",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                            Text("3. Password Size Photograph",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                          ],
                        )
                    ),

                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Proofs for Partnership Firm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                            SizedBox(height: 8,),
                            Text("1.  PAN",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                            Text("2. Aadhaar",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                            Text("3. Password Size Photograph",style: TextStyle(fontSize: 12),),
                            SizedBox(height: 6,),
                          ],
                        )
                    ),
                  ],
                ),
              ),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: primaryColor
                ),
                child: const Center(child: Text("Enrol")),
              )

            ],
          ),
        ),
      )
    );
  }
}
