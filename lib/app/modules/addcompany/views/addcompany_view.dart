import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/constants.dart';

import '../../companymanagment/views/companymanagment_view.dart';
import '../controllers/addcompany_controller.dart';

class AddcompanyView extends GetView<AddcompanyController> {
  AddcompanyView({Key? key}) : super(key: key);
  AddcompanyController addcompanyController = Get.put(AddcompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: primaryColor,
        title: const Text(
          'Add Company',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: addcompanyController.foreKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade100,
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.visibility),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "List Company",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                            menuMaxHeight: 200.0,
                            borderRadius: BorderRadius.circular(10.0),
                            underline:SizedBox(),
                            isExpanded:true,
                            elevation: 5,
                            // Initial Value
                            value: addcompanyController.dropdownlist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: addcompanyController.items.value
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              addcompanyController.dropdownlist.value =
                              newValue!;
                            }),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),

                    Obx(() {
                      return addcompanyController.methodName();
                    }),

                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Register",
                          labelText: "Register Number",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.drive_file_rename_outline),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Comapany",
                          labelText: "Comapany Name",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.mail),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "ROC",
                          labelText: "EX:ROC-Gwalior",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.phone),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Category",
                          labelText: "Company Category",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.phone),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Subcategory",
                          labelText: "Subcategory",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.confirmation_number),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Company",
                          labelText: "Class of company",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Status",
                          labelText: "Listing status",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Authorised",
                          labelText: "Authorised Capital",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Paid Up Capital",
                          labelText: "Paid Up Capital",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Text(
                      "Contact Details",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email Address",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Number",
                          labelText: "Phone Number",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Country",
                          labelText: "Country",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "State",
                          labelText: "State",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "City",
                          labelText: "City",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Zip Code",
                          labelText: "Zip Code",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Address - Head Office",
                          labelText: "Street Address",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
