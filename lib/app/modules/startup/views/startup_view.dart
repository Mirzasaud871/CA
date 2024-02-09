import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakil99/Models/CategoryModel.dart';
import 'package:vakil99/app/modules/details/views/details_view.dart';
import 'package:vakil99/constants.dart';
import '../../checkout/views/checkout_view.dart';
import '../controllers/startup_controller.dart';

class StartupView extends GetView<StartupController> {
  List<CompanyService>? categoryItemList = <CompanyService>[];
  StartupView(this.categoryItemList, {Key? key}) : super(key: key);
  StartupController startupController = Get.put(StartupController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Services',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            const Icon(
              CupertinoIcons.shopping_cart,
              size: 25,
            ),
            Obx(() {
              return IconButton(
                  icon: Icon(
                    startupController.filterlist.value
                        ? Icons.list_alt
                        : Icons.dashboard,
                    size: 25,
                  ),
                  onPressed: () {
                    startupController.filterlist.value =
                        !startupController.filterlist.value;
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
                    height: Get.width * 1.98,
                    child: GridView.builder(
                      itemCount: categoryItemList!.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0,
                        childAspectRatio: Get.width * 0.00140,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return DelayedDisplay(
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            height: Get.width * 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.to( ()=> DetailsView(),arguments:
                                        categoryItemList![index].slug,
                                      );
                                    },
                                    child:categoryItemList![index].image != null
                                ? Image.network(
                                        "${categoryItemList![index].image}")
                                 : Image.asset("assets/images/trademark/fram1.jpg"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${categoryItemList![index].name}",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize:20,
                                        letterSpacing: 0.6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Market Price :",
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${categoryItemList![index].marketPrice}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              decoration: TextDecoration
                                                  .lineThrough,
                                              color: Colors.green)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Offer Price :",
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "${categoryItemList![index].price}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      Get.to( () => CheckoutView(),
                                        arguments: categoryItemList![index].slug
                                      );
                                    },
                                    child: Container(
                                      height: 30,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                          BorderRadius.circular(100.0)),
                                      child: const Center(
                                          child: Text(
                                            "Buy Now",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                )
              ],
            ),
          ),
        ));
  }
}
