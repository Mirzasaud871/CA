import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/constants.dart';

import '../controllers/goodservices_controller.dart';

class GoodservicesView extends GetView<GoodservicesController> {
  GoodservicesView({Key? key}) : super(key: key);
  GoodservicesController goodservicesController = Get.put(GoodservicesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'StartUp',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)
          ),
          actions: [
            const Icon(Icons.add_shopping_cart_rounded, size: 25,),
            const SizedBox(width: 10),
            const Icon(Icons.account_balance_wallet, size: 25,),
            Obx(() {
              return IconButton(
                  icon: Icon(
                    goodservicesController.filterlist.value ? Icons.list_alt : Icons.dashboard,
                    size: 25,
                  ),
                  onPressed: () {
                    goodservicesController.filterlist.value =
                    !goodservicesController.filterlist.value;
                  });
            }),
            const SizedBox(width: 10),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 1.96,
                  child: GridView.builder(
                    itemCount: goodservicesController.servicelist.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      childAspectRatio: 0.56,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return DelayedDisplay(
                        delay: const Duration(milliseconds:300),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          height: Get.width * 1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6.0,
                              ),]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("${goodservicesController.servicelist[index].image}"),
                                Text("${goodservicesController.servicelist[index].name}",style: const TextStyle(color: Colors.red,fontSize: 11,letterSpacing: 0.6,fontWeight:FontWeight.bold),),
                                Row(
                                  children: [
                                    const SizedBox(height: 10,),
                                    const Text("Market Price :",style: TextStyle(fontSize: 10 ),),
                                    Text("${goodservicesController.servicelist[index].marketPrice}",style: const TextStyle(fontSize: 10, decoration: TextDecoration.lineThrough,color: Colors.grey)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Offer Price :",style: TextStyle(fontSize: 10 ),),
                                    Text("${goodservicesController.servicelist[index].offerPrice}",style: const TextStyle(fontSize: 10,color: Colors.red)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    const Text("Save Price :",style: TextStyle(fontSize: 10 ),),
                                    Text("${goodservicesController.servicelist[index].savePrice}",style: const TextStyle(fontSize: 10,color: Colors.green)),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(100.0)
                                  ),
                                  child: const Center(child: Text("Buy Now",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),)),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
