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
              Icons.shopping_cart,
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
                Obx(() {
                  return SizedBox(
                    height: Get.width * 1.90,
                    child: startupController.filterlist.value == true ?
                    GridView.builder(
                      shrinkWrap: true,
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
                                CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => DetailsView(), arguments:
                                        categoryItemList![index].slug,
                                        );
                                      },
                                      child: Container(
                                        child: categoryItemList![index].image !=
                                            null
                                            ? Image.network(
                                            "${categoryItemList![index].image}")
                                            : Image.asset(
                                            "assets/images/trademark/fram1.jpg"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Spacer(),
                                        Text(
                                          "${categoryItemList![index].name}",
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              color: Colors.red,
                                              letterSpacing: 0.6,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                        Text(
                                            "Market Price :${categoryItemList![index]
                                                .marketPrice}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                decoration: TextDecoration
                                                    .lineThrough,
                                                color: Colors.blue)),
                                        Text(
                                            "Offer Price :${categoryItemList![index].price}",
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.04,
                                                color: Colors.green,fontWeight: FontWeight.bold)),

                                        SizedBox(height: 10,),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => CheckoutView(),
                                                arguments: categoryItemList![index]
                                                    .slug
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
                                  SizedBox(height: 5,),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ) :
                    ListView.builder(
                        itemCount: categoryItemList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedDisplay(
                            delay: const Duration(milliseconds: 300),
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 06),
                                  height: 110,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(color: Colors.grey)
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: categoryItemList![index].image !=
                                              null
                                              ? Image.network(
                                              "${categoryItemList![index].image}")
                                              : Image.asset(
                                              "assets/images/trademark/fram1.jpg"),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            SizedBox(height: 12,),
                                            Container(
                                              child: Text("${categoryItemList![index].name}",style: TextStyle(
                                                fontSize: screenWidth * 0.045,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.red
                                              ),),
                                            ),
                                            SizedBox(height: 4),
                                            Container(
                                              child: Text("Market Price : ${categoryItemList![index].marketPrice}",style: TextStyle(
                                                  fontSize: screenWidth * 0.035,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.blue
                                              ),),
                                            ),
                                            Container(
                                              child: Text("Offer Price: ${categoryItemList![index].price}",style: TextStyle(
                                                  fontSize: screenWidth * 0.040,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green
                                              ),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(() => CheckoutView(),
                                          arguments: categoryItemList![index]
                                              .slug
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(2.0),
                                      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 4.0),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child:Icon(Icons.add_shopping_cart,size: 20,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),

                  );
                })
              ],
            ),
          ),
        ));
  }
}
