import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/addform_controller.dart';

class AddformView extends GetView<MultipleController> {
  AddformView({Key? key}) : super(key: key);
  final MultipleController controller = Get.put(MultipleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiples with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                  itemCount: controller.formFields.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(child: controller.formFields[index]),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => controller.removeFormField(index),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  controller.addFormField();
                },
                child: Text('Add Field'),
              ),
              ElevatedButton(
                onPressed: (){
                  controller.encodeText();
                  print("${controller.controllers}");
                },
                child: Text('Print'),
              ),
            ],
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         controller.multiplier++;
          //         controller.generateMultiples();
          //       },
          //       child: Text('Increment'),
          //     ),
          //     SizedBox(height: 16),
          //     TextFormField(
          //       // controller: addDirectorsController
          //       //     .nameController,
          //       decoration: InputDecoration(
          //         hintText: "Name",
          //         focusColor: primaryColor,
          //         suffixIconColor: primaryColor,
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: primaryColor)),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TextFormField(
          //       // controller: addDirectorsController
          //       //     .designationController,
          //       decoration: InputDecoration(
          //         hintText: "Designation",
          //         focusColor: primaryColor,
          //         suffixIconColor: primaryColor,
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: primaryColor)),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(
          //       height: 20,
          //     ),
          //     TextFormField(
          //       // controller: addDirectorsController
          //       //     .dinController,
          //       decoration: InputDecoration(
          //         hintText: "DIN Number",
          //         focusColor: primaryColor,
          //         suffixIconColor: primaryColor,
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: primaryColor)),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //         ),
          //       ),
          //     ),
          //
          //
          //     SizedBox(
          //       height: 20,
          //     ),
          //     InkWell(
          //       onTap: (){
          //       },
          //       child: Container(
          //         height: 50,
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //             color: primaryColor,
          //             borderRadius: BorderRadius.circular(5.0)),
          //         child: Center(
          //             child: Text(
          //               "Add Directors",
          //               style: TextStyle(color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 18),
          //             )),
          //       ),
          //     ),
          //
          //     Obx(
          //           () => Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //             children: controller.multiples.asMap().entries.map((entry) {
          //               final index = entry.key;
          //               final value = entry.value;
          //           return Column(
          //             children: [
          //               SizedBox(height: 20,),
          //               ElevatedButton(
          //                 onPressed: () {
          //                   controller.removeAtIndex(index);
          //                 },
          //                 child: Text('Minus $index: $value'),
          //               ),
          //               SizedBox(height: 16),
          //               TextFormField(
          //                 // controller: addDirectorsController
          //                 //     .nameController,
          //                 decoration: InputDecoration(
          //                   hintText: "Name",
          //                   focusColor: primaryColor,
          //                   suffixIconColor: primaryColor,
          //                   focusedBorder: OutlineInputBorder(
          //                       borderSide: BorderSide(color: primaryColor)),
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(5.0),
          //                   ),
          //                 ),
          //               ),
          //
          //               SizedBox(
          //                 height: 20,
          //               ),
          //               TextFormField(
          //                 // controller: addDirectorsController
          //                 //     .designationController,
          //                 decoration: InputDecoration(
          //                   hintText: "Designation",
          //                   focusColor: primaryColor,
          //                   suffixIconColor: primaryColor,
          //                   focusedBorder: OutlineInputBorder(
          //                       borderSide: BorderSide(color: primaryColor)),
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(5.0),
          //                   ),
          //                 ),
          //               ),
          //
          //               SizedBox(
          //                 height: 20,
          //               ),
          //               TextFormField(
          //                 // controller: addDirectorsController
          //                 //     .dinController,
          //                 decoration: InputDecoration(
          //                   hintText: "DIN Number",
          //                   focusColor: primaryColor,
          //                   suffixIconColor: primaryColor,
          //                   focusedBorder: OutlineInputBorder(
          //                       borderSide: BorderSide(color: primaryColor)),
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(5.0),
          //                   ),
          //                 ),
          //               ),
          //
          //
          //               SizedBox(
          //                 height: 20,
          //               ),
          //               InkWell(
          //                 onTap: (){
          //                 },
          //                 child: Container(
          //                   height: 50,
          //                   width: double.infinity,
          //                   decoration: BoxDecoration(
          //                       color: primaryColor,
          //                       borderRadius: BorderRadius.circular(5.0)),
          //                   child: Center(
          //                       child: Text(
          //                         "Add Directors",
          //                         style: TextStyle(color: Colors.white,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 18),
          //                       )),
          //                 ),
          //               ),
          //             ],
          //           );
          //         }).toList(),
          //       ),
          //     ),
          //   ],
          //
          // ),
        ),
      ),
    );
  }
}
