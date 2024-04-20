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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: addcompanyController.foreKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 40,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.green.shade100,
                    //   ),
                    //   child: const Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.visibility),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         "List Company",
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Register No. is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.registerController,
                        decoration: InputDecoration(
                          hintText: "Register",
                          labelText: "Register Number",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.numbers),
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
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Company is required";
                        }
                        return null;
                      },
                      controller: addcompanyController.companyController,
                        decoration: InputDecoration(
                          hintText: "Comapany",
                          labelText: "Comapany Name",
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "ROC is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.rocController,
                        decoration: InputDecoration(
                          hintText: "ROC",
                          labelText: "EX:ROC-Gwalior",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.panorama_photosphere),
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
                    Obx(() {
                      return Container(
                        height: 60,
                        padding: EdgeInsets.only(top: 5.0,left: 8.0,right: 5.0),
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
                            value: addcompanyController.categorylist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: addcompanyController.categoryItems.value
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
                              addcompanyController.categorylist.value =
                              newValue!;
                            }),
                      );
                    }),

                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Subcategory is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.subCategoryController,
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
                    Obx(() {
                      return Container(
                        height: 60,
                        padding: EdgeInsets.only(top: 5.0,left: 8.0,right: 5.0),
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
                            value: addcompanyController.classlist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: addcompanyController.classItems.value
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
                              addcompanyController.classlist.value =
                              newValue!;
                            }),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Container(
                        height: 60,
                        padding: EdgeInsets.only(top: 5.0,left: 8.0,right: 5.0),
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
                            value: addcompanyController.listinglist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: addcompanyController.listingItems.value
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
                              addcompanyController.listinglist.value =
                              newValue!;
                            }),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Authorised is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.authorizedController,
                        decoration: InputDecoration(
                          hintText: "Authorised",
                          labelText: "Authorised Capital",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.auto_fix_high),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Capital is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.paidController,
                        decoration: InputDecoration(
                          hintText: "Paid Up Capital",
                          labelText: "Paid Up Capital",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.paid),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "email is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email Address",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.email),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password is required";
                          }
                          return null;
                        },
                        controller: addcompanyController.phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Number",
                          labelText: "Phone Number",
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Country is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.countryController,
                        decoration: InputDecoration(
                          hintText: "Country",
                          labelText: "Country",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.travel_explore),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "State is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.stateController,
                        decoration: InputDecoration(
                          hintText: "State",
                          labelText: "State",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.public),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "City is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.cityController,
                        decoration: InputDecoration(
                          hintText: "City",
                          labelText: "City",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.apartment),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Code is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.zipController,
                        decoration: InputDecoration(
                          hintText: "Zip Code",
                          labelText: "Zip Code",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.numbers),
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
                    TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Address is required";
                          }
                          return null;
                        },
                      controller: addcompanyController.addressController,
                        decoration: InputDecoration(
                          hintText: "Address - Head Office",
                          labelText: "Street Address",
                          focusColor: primaryColor,
                          suffixIcon: Icon(Icons.home),
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
                    InkWell(
                      onTap: (){
                        if(
                        addcompanyController.cinController.text.isEmpty &&
                        addcompanyController.registerController.text.isEmpty &&
                        addcompanyController.companyController.text.isEmpty &&
                        addcompanyController.rocController.text.isEmpty &&
                        addcompanyController.subCategoryController.text.isEmpty &&
                        addcompanyController.authorizedController.text.isEmpty &&
                        addcompanyController.paidController.text.isEmpty &&
                        // contact details
                        addcompanyController.emailController.text.isEmpty &&
                        addcompanyController.phoneController.text.isEmpty &&
                        addcompanyController.countryController.text.isEmpty &&
                        addcompanyController.stateController.text.isEmpty &&
                        addcompanyController.cityController.text.isEmpty &&
                        addcompanyController.zipController.text.isEmpty &&
                        addcompanyController.addressController.text.isEmpty
                        ){
                          addcompanyController.foreKey.currentState!.validate();
                        }else {
                          addcompanyController.addCompanyDetails(
                            addcompanyController.gstinController.text,
                            addcompanyController.dropdownlist.value,
                            addcompanyController.registerController.text,
                            addcompanyController.companyController.text,
                            addcompanyController.rocController.text,
                            addcompanyController.categorylist.value,
                            addcompanyController.subCategoryController.text,
                            addcompanyController.classlist.value,
                            addcompanyController.listinglist.value,
                            addcompanyController.authorizedController.text,
                            addcompanyController.paidController.text,
                            // contact details
                            addcompanyController.emailController.text,
                            addcompanyController.phoneController.text,
                            addcompanyController.countryController.text,
                            addcompanyController.stateController.text,
                            addcompanyController.cityController.text,
                            addcompanyController.zipController.text,
                            addcompanyController.addressController.text,
                          );
                        }
                      },
                      child: Container(
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
