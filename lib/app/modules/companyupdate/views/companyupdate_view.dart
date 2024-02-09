import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/companyupdate_controller.dart';

class CompanyupdateView extends GetView<CompanyupdateController> {
  CompanyupdateView({Key? key}) : super(key: key);
  CompanyupdateController companyupdateController = Get.put(CompanyupdateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: primaryColor,
        title: const Text(
          'Update',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: companyupdateController.foreKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                            menuMaxHeight: 200.0,
                            borderRadius: BorderRadius.circular(10.0),
                            underline:const SizedBox(),
                            isExpanded:true,
                            elevation: 5,
                            // Initial Value
                            value: companyupdateController.dropdownlist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: companyupdateController.items
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              companyupdateController.dropdownlist.value =
                              newValue!;
                            }),
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),

                    Obx(() {
                      return companyupdateController.methodName();
                    }),

                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Register",
                          labelText: "Register Number",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.drive_file_rename_outline),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Comapany",
                          labelText: "Comapany Name",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.mail),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "ROC",
                          labelText: "EX:ROC-Gwalior",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.phone),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Category",
                          labelText: "Company Category",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.phone),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Subcategory",
                          labelText: "Subcategory",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.confirmation_number),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Company",
                          labelText: "Class of company",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Status",
                          labelText: "Listing status",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Authorised",
                          labelText: "Authorised Capital",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Paid Up Capital",
                          labelText: "Paid Up Capital",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const Text(
                      "Contact Details",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email Address",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Number",
                          labelText: "Phone Number",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Country",
                          labelText: "Country",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "State",
                          labelText: "State",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "City",
                          labelText: "City",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Zip Code",
                          labelText: "Zip Code",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          hintText: "Address - Head Office",
                          labelText: "Street Address",
                          focusColor: primaryColor,
                          suffixIcon: const Icon(Icons.file_copy),
                          suffixIconColor: primaryColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor,
                      ),
                      child: const Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
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
