import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          const Icon(
            Icons.add_shopping_cart_rounded,
            size: 25,
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.account_balance_wallet,
            size: 25,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(14.0),
                  height: Get.width * 0.45,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0,
                      ),]
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryColor,letterSpacing: 0.6),),
                      Text("Admin",style: const TextStyle(fontSize: 17,color: Colors.grey,letterSpacing: 0.4),),
                      Text("Your Total Amount",style: TextStyle(fontSize: 14,color: Colors.grey,letterSpacing: 0.4),),
                      Text("₹ 0",style: TextStyle(fontSize: 16,),),
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  height: Get.width * 0.65,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0,
                      ),]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Over All Information",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: primaryColor,letterSpacing: 0.6),),
                      const Divider(
                        color: Colors.green,
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(100.0)
                                ),
                                child: const Icon(Icons.incomplete_circle,size: 34,color: Colors.purple,),
                              ),
                              const SizedBox(width: 12,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  Text("Company",style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              const SizedBox(width: 35,),
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Colors.cyan.shade50,
                                    borderRadius: BorderRadius.circular(100.0)
                                ),
                                child: const Icon(Icons.family_restroom,size: 34,color: Colors.cyan,),
                              ),
                              const SizedBox(width: 12,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  Text("Members",style: TextStyle(fontSize: 12),),
                                ],
                              )
                            ],
                          ),

                          const SizedBox(height: 30,),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(100.0)
                                ),
                                child: const Icon(Icons.file_copy,size: 34,color: Colors.green,),
                              ),
                              const SizedBox(width: 15,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  Text("Document",style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              const SizedBox(width: 35,),
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(100.0)
                                ),
                                child: const Icon(Icons.shopping_cart,size: 34,color: Colors.red,),
                              ),
                              const SizedBox(width: 15,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("0"),
                                  Text("Orders",style: TextStyle(fontSize: 12),),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  height: Get.width * 0.80,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0,
                      ),]
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: primaryColor,letterSpacing: 0.6),),
                      Text("Total 0 services you have purchased",style: TextStyle(fontSize: 10,color: Colors.grey,letterSpacing: 0.6),),
                      Divider(
                        color: Colors.green,
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [

                        ],
                      )
                    ],
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
