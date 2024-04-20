import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vakil99/app/modules/addfamilymember/views/addfamilymember_view.dart';
import 'package:vakil99/app/modules/familyupdate/views/familyupdate_view.dart';
import 'package:vakil99/constants.dart';
import '../controllers/familymember_controller.dart';

class FamilymemberView extends GetView<FamilymemberController> {
  FamilymemberView({Key? key}) : super(key: key);
  FamilymemberController familymemberController = Get.put(
      FamilymemberController());

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
              icon: const Icon(Icons.arrow_back, color: Colors.white,)),
          backgroundColor: primaryColor,
          title: const Text(
            'Family Members', style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Members List", style: TextStyle(fontSize: 20),),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(AddfamilymemberView());
                        },
                        child: Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)
                            ),
                            child: const Center(
                                child: Text(
                                  "Add Members",
                                  style:
                                  TextStyle(fontSize: 16, color: primaryColor),
                                ))),
                      )
                    ],
                  ),

                  const SizedBox(height: 10,),
                  //search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.shade300, width: 2)
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


                  const SizedBox(height: 15,),
                  Obx(() {
                    return SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: familymemberController.familyListModel
                            .length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: screenHeight * 0.0017,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return DelayedDisplay(
                            delay: const Duration(milliseconds: 300),
                            child: Container(
                              margin: EdgeInsets.all(6.0),
                              padding: const EdgeInsets.all(12.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 6.0,
                                    ),
                                  ]
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex:5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [

                                        Row(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1.5),
                                                borderRadius: BorderRadius
                                                    .circular(100),
                                              ),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(120),
                                                  child: Image.network(
                                                      "${familymemberController
                                                          .familyListModel[index]
                                                          .image}",fit: BoxFit.fill,)),
                                            ),
                                            const SizedBox(width: 8,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("${familymemberController
                                                    .familyListModel[index]
                                                    .name}", style: TextStyle(
                                                    fontSize: screenWidth * 0.055,fontWeight: FontWeight.bold),),
                                                Text("${familymemberController
                                                    .familyListModel[index]
                                                    .email}", style: TextStyle(
                                                    fontSize: screenWidth * 0.04),)
                                              ],
                                            ),
                                          ],
                                        ),

                                        Text("",
                                          style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight
                                                  .bold),),

                                        Text("Trade Name : ${familymemberController
                                            .familyListModel[index].trade}",
                                          style: TextStyle(fontSize: screenWidth * 0.045),
                                          overflow: TextOverflow.ellipsis,),
                                        const SizedBox(
                                          height: 4,
                                        ),

                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("Contact No : +91-${familymemberController
                                            .familyListModel[index]
                                            .mobileNo}",
                                          style: TextStyle(fontSize:  screenWidth * 0.045),
                                          overflow: TextOverflow.ellipsis,),

                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text("Aadhar No : ${familymemberController
                                            .familyListModel[index]
                                            .aadhar}",
                                          style: TextStyle(fontSize:  screenWidth * 0.045),
                                          overflow: TextOverflow.ellipsis,),

                                        const SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("Pan Card : ${familymemberController
                                            .familyListModel[index].pan}",
                                          style: TextStyle(fontSize:  screenWidth * 0.045),
                                          overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                                    onTap: (){
                                                      Get.back();
                                                      Get.to( ()=> FamilyupdateView(),arguments: familymemberController.familyListModel[index].id);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.edit_document,color: Colors.green,),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Edits",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
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
                                                    Get.back();
                                                    familymemberController.MemberDelete("${familymemberController.familyListModel[index].id}");
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
                                            ],
                                            offset: Offset(0, 50),
                                            color: Colors.white
                                            ,
                                            elevation: 2,
                                            // on selected we show the dialog box
                                            // onSelected: (value) {
                                            //   // if value 1 show dialog
                                            //   if (value == 1) {
                                            //     _showDialog(context);
                                            //     // if value 2 show dialog
                                            //   } else if (value == 2) {
                                            //     _showDialog(context);
                                            //   }
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  // Container(
                  //   padding: const EdgeInsets.all(12.0),
                  //   height: Get.width * 0.54,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(6.0),
                  //     color: Colors.white,
                  //       boxShadow: [
                  //   BoxShadow(
                  //   color: Colors.grey.shade400,
                  //     blurRadius: 6.0,
                  //   ),]
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text("S no. 1",style: TextStyle(fontSize: 14,color: primaryColor,fontWeight: FontWeight.bold),),
                  //           Row(
                  //             children: [
                  //               CircleAvatar(
                  //                 radius: 30,
                  //                   child: Image.asset("assets/images/pngw.png")
                  //               ),
                  //               const SizedBox(width: 6,),
                  //               const Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text("Saud Mirza",style: TextStyle(fontSize: 18),),
                  //                   Text("saudmirzamspl@gmail.com",style: TextStyle(fontSize: 12),)
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //           const Row(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Text("Trade Name :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  //               SizedBox(
                  //                 width: 6,
                  //               ),
                  //               Text("Zynomatrix",style: TextStyle(fontSize: 18),),
                  //             ],
                  //           ),
                  //           const SizedBox(
                  //             height: 4,
                  //           ),
                  //           const Row(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Text("Contact No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  //               SizedBox(
                  //                 width: 6,
                  //               ),
                  //               Text("+91-7412589631",style: TextStyle(fontSize: 18),),
                  //             ],
                  //           ),
                  //           const SizedBox(
                  //             height: 4,
                  //           ),
                  //           const Row(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Text("Aadhar No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  //               SizedBox(
                  //                 width: 6,
                  //               ),
                  //               Text("8280-5566-2358",style: TextStyle(fontSize: 18),),
                  //             ],
                  //           ),
                  //           const SizedBox(
                  //             height: 4,
                  //           ),
                  //           const Row(
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Text("Pan Card :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  //               SizedBox(
                  //                 width: 6,
                  //               ),
                  //               Text("CU0987P5",style: TextStyle(fontSize: 18),),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //
                  //       const Spacer(),
                  //       const Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Icon(Icons.delete,color: Colors.red,size: 30,),
                  //           SizedBox(height: 15,),
                  //           Icon(Icons.edit,color: Colors.green,size: 30,),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),)
    );
  }
}
