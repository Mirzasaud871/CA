import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/app/modules/addfamilymember/views/addfamilymember_view.dart';
import 'package:vakil99/constants.dart';

import '../controllers/familymember_controller.dart';

class FamilymemberView extends GetView<FamilymemberController> {
  const FamilymemberView({Key? key}) : super(key: key);
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
          title: const Text('Family Members',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Members List",style: TextStyle(fontSize: 20),),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(AddfamilymemberView());
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
                                "Add Members",
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

                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  height: Get.width * 0.54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                      boxShadow: [
                  BoxShadow(
                  color: Colors.grey.shade400,
                    blurRadius: 6.0,
                  ),]
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("S no. 1",style: TextStyle(fontSize: 14,color: primaryColor,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                  child: Image.asset("assets/images/pngw.png")
                              ),
                              const SizedBox(width: 6,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Saud Mirza",style: TextStyle(fontSize: 18),),
                                  Text("saudmirzamspl@gmail.com",style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Trade Name :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Zynomatrix",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Contact No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("+91-7412589631",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Aadhar No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("8280-5566-2358",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Pan Card :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("CU0987P5",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.delete,color: Colors.red,size: 30,),
                          SizedBox(height: 15,),
                          Icon(Icons.edit,color: Colors.green,size: 30,),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  height: Get.width * 0.54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 6.0,
                        ),]
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("S no. 2",style: TextStyle(fontSize: 14,color: primaryColor,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  child: Image.asset("assets/images/pngw.png")
                              ),
                              const SizedBox(width: 6,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Saud Mirza",style: TextStyle(fontSize: 18),),
                                  Text("saudmirzamspl@gmail.com",style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Trade Name :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Zynomatrix",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Contact No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("+91-7412589631",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Aadhar No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("8280-5566-2358",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Pan Card :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("CU0987P5",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.delete,color: Colors.red,size: 30,),
                          SizedBox(height: 15,),
                          Icon(Icons.edit,color: Colors.green,size: 30,),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  height: Get.width * 0.54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 6.0,
                        ),]
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("S no. 3",style: TextStyle(fontSize: 14,color: primaryColor,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  child: Image.asset("assets/images/pngw.png")
                              ),
                              const SizedBox(width: 6,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Saud Mirza",style: TextStyle(fontSize: 18),),
                                  Text("saudmirzamspl@gmail.com",style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Trade Name :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(
                                width: 6,
                              ),
                              Text("Zynomatrix",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Contact No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("+91-7412589631",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Aadhar No :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("8280-5566-2358",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Pan Card :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 6,
                              ),
                              Text("CU0987P5",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.delete,color: Colors.red,size: 30,),
                          SizedBox(height: 15,),
                          Icon(Icons.edit,color: Colors.green,size: 30,),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
