import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/companyupdate_controller.dart';

class CompanyupdateView extends GetView<CompanyupdateController> {
  CompanyupdateView({Key? key}) : super(key: key);
  CompanyupdateController companyupdateController = Get.put(
      CompanyupdateController());

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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: companyupdateController.foreKey,
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
                            underline: SizedBox(),
                            isExpanded: true,
                            elevation: 5,
                            // Initial Value
                            value: companyupdateController.dropdownlist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: companyupdateController.items.value
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
                              companyupdateController.dropdownlist.value =
                              newValue!;
                            }),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),

                    Obx(() {
                      return companyupdateController.methodName();
                    }),

                    SizedBox(
                      height: 15,
                    ),

                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Register No. is required";
                            }
                            return null;
                          },
                          controller: companyupdateController
                              .registerController,
                          decoration: InputDecoration(
                            hintText: "Register Number",
                            labelText: "${companyupdateController
                                .getRegistration}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.numbers),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),

                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Company is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.companyController,
                          decoration: InputDecoration(
                            hintText: "Company Name",
                            labelText: "${companyupdateController
                                .getCompanyName}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.drive_file_rename_outline),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ROC is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.rocController,
                          decoration: InputDecoration(
                            hintText: "EX:ROC-Gwalior",
                            labelText: "${companyupdateController.getRoc}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.panorama_photosphere),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Container(
                        height: 60,
                        padding: EdgeInsets.only(
                            top: 5.0, left: 8.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                            menuMaxHeight: 200.0,
                            borderRadius: BorderRadius.circular(10.0),
                            underline: SizedBox(),
                            isExpanded: true,
                            elevation: 5,
                            // Initial Value
                            value: companyupdateController.categorylist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: companyupdateController.categoryItems.value
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
                              companyupdateController.categorylist.value =
                              newValue!;
                            }),
                      );
                    }),

                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Subcategory is required";
                            }
                            return null;
                          },
                          controller: companyupdateController
                              .subCategoryController,
                          decoration: InputDecoration(
                            hintText: "Subcategory",
                            labelText: "${companyupdateController
                                .getSubCategory}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.confirmation_number),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Container(
                        height: 60,
                        padding: EdgeInsets.only(
                            top: 5.0, left: 8.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                            menuMaxHeight: 200.0,
                            borderRadius: BorderRadius.circular(10.0),
                            underline: SizedBox(),
                            isExpanded: true,
                            elevation: 5,
                            // Initial Value
                            value: companyupdateController.classlist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: companyupdateController.classItems.value
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
                              companyupdateController.classlist.value =
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
                        padding: EdgeInsets.only(
                            top: 5.0, left: 8.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                            menuMaxHeight: 200.0,
                            borderRadius: BorderRadius.circular(10.0),
                            underline: SizedBox(),
                            isExpanded: true,
                            elevation: 5,
                            // Initial Value
                            value: companyupdateController.listinglist.value,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            // Array list of items
                            items: companyupdateController.listingItems.value
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
                              companyupdateController.listinglist.value =
                              newValue!;
                            }),
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Authorised is required";
                            }
                            return null;
                          },
                          controller: companyupdateController
                              .authorizedController,
                          decoration: InputDecoration(
                            hintText: "Authorised Capital",
                            labelText: "${companyupdateController
                                .getAuthorized}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.auto_fix_high),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Capital is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.paidController,
                          decoration: InputDecoration(
                            hintText: "Paid Up Capital",
                            labelText: "${companyupdateController.getPaidUp}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.paid),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
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
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "email is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.emailController,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            labelText: "${companyupdateController.getEmail}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.email),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            labelText: "${companyupdateController.getMobile}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.phone),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Country is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.countryController,
                          decoration: InputDecoration(
                            hintText: "Country",
                            labelText: "${companyupdateController.getCountry}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.travel_explore),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "State is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.stateController,
                          decoration: InputDecoration(
                            hintText: "State",
                            labelText: "${companyupdateController.getState}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.public),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "City is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.cityController,
                          decoration: InputDecoration(
                            hintText: "City",
                            labelText: "${companyupdateController.getCity}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.apartment),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Code is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.zipController,
                          decoration: InputDecoration(
                            hintText: "Zip Code",
                            labelText: "${companyupdateController.getZipCode}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.numbers),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Address is required";
                            }
                            return null;
                          },
                          controller: companyupdateController.addressController,
                          decoration: InputDecoration(
                            hintText: "Address - Head Office",
                            labelText: "${companyupdateController.getAddress}",
                            focusColor: primaryColor,
                            suffixIcon: Icon(Icons.home),
                            suffixIconColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.red, width: 2),
                            ),
                          ));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (
                        companyupdateController.gstinController.text.isEmpty &&
                            companyupdateController.cinController.text
                                .isEmpty &&
                            companyupdateController.llpinController.text
                                .isEmpty &&
                            companyupdateController.registerController.text
                                .isEmpty &&
                            companyupdateController.companyController.text
                                .isEmpty &&
                            companyupdateController.rocController.text
                                .isEmpty &&
                            companyupdateController.subCategoryController.text
                                .isEmpty &&
                            companyupdateController.authorizedController.text
                                .isEmpty &&
                            companyupdateController.paidController.text
                                .isEmpty &&
                            // contact details
                            companyupdateController.emailController.text
                                .isEmpty &&
                            companyupdateController.phoneController.text
                                .isEmpty &&
                            companyupdateController.countryController.text
                                .isEmpty &&
                            companyupdateController.stateController.text
                                .isEmpty &&
                            companyupdateController.cityController.text
                                .isEmpty &&
                            companyupdateController.zipController.text
                                .isEmpty &&
                            companyupdateController.addressController.text
                                .isEmpty
                        ) {
                          companyupdateController.foreKey.currentState!
                              .validate();
                        } else {
                          companyupdateController.companyUpdate(
                            companyupdateController.gstinController.text,
                            companyupdateController.registerController.text,
                            companyupdateController.companyController.text,
                            companyupdateController.rocController.text,
                            companyupdateController.categorylist.value,
                            companyupdateController.subCategoryController.text,
                            companyupdateController.classlist.value,
                            companyupdateController.listinglist.value,
                            companyupdateController.authorizedController.text,
                            companyupdateController.paidController.text,
                            // contact details
                            companyupdateController.emailController.text,
                            companyupdateController.phoneController.text,
                            companyupdateController.countryController.text,
                            companyupdateController.stateController.text,
                            companyupdateController.cityController.text,
                            companyupdateController.zipController.text,
                            companyupdateController.addressController.text,
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
