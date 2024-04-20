import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vakil99/constants.dart';

import '../controllers/companydetails_controller.dart';

class CompanydetailsView extends GetView<CompanydetailsController> {
  CompanydetailsView({Key? key}) : super(key: key);
  CompanydetailsController companydetailsController =
  Get.put(CompanydetailsController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
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
            'Company Details',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company details
                    Text(
                      "Company Detail",
                      style: TextStyle(
                          fontSize: width * 0.06, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Obx(() {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1.5)),
                        child: SizedBox(
                          width: double.infinity,
                          child: DataTable(
                              dataTextStyle: TextStyle(fontSize: width * 0.04),
                              headingRowColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.grey),
                              headingRowHeight: 40.0,
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: Colors.white),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Details',
                                      style: TextStyle(
                                          fontSize: width * 0.05,
                                          color: Colors.white)),
                                ),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('CIN Number	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getCin}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Company Name	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getCompanyName}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Category ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getCategory}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Class	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getClass}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Authorized	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getAuthorized}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Registration No.	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getRegistration}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('ROC	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getRoc}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Sub Category	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getSubCategory}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Status	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getStatus}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Paid Up	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getPaidUp}')),
                                ]),
                              ]),
                        ),
                      );
                    }),
                    SizedBox(
                      height: width * 0.06,
                    ),

                    //Contact details
                    Text(
                      "Contact Detail",
                      style: TextStyle(
                          fontSize: width * 0.06, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Obx(() {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1.5)),
                        child: SizedBox(
                          width: double.infinity,
                          child: DataTable(
                              dataTextStyle: TextStyle(fontSize: width * 0.04),
                              headingRowColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.grey),
                              headingRowHeight: 40.0,
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        color: Colors.white),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Details',
                                      style: TextStyle(
                                          fontSize: width * 0.05,
                                          color: Colors.white)),
                                ),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(
                                    'Emial',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                      '${companydetailsController.getEmail}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Mobile No.	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getMobile}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Country ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getCountry}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('State	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getState}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('City	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController.getCity}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Zip Code	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getZipCode}')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Address	',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text(
                                      '${companydetailsController
                                          .getAddress}')),
                                ]),
                              ]),
                        ),
                      );
                    }),

                    SizedBox(
                      height: width * 0.06,
                    ),

                    //Contact details
                    Text(
                      "Directors Detail",
                      style: TextStyle(
                          fontSize: width * 0.06, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),


                    Obx(() {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                        companydetailsController.detailsListModel.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: 1.14,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1.5)),
                            child: SizedBox(
                              width: double.infinity,
                              child: DataTable(
                                  columnSpacing: 10.0,
                                  dividerThickness: 2.0,
                                  dataTextStyle:
                                  TextStyle(fontSize: width * 0.04),
                                  headingRowColor:
                                  MaterialStateColor.resolveWith(
                                          (states) => Colors.grey),
                                  headingRowHeight: 40.0,
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'Name',
                                        style: TextStyle(
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Details',
                                          style: TextStyle(
                                              fontSize: width * 0.05,
                                              color: Colors.white)),
                                    ),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text(
                                        'Director Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(Text(
                                          '${companydetailsController
                                              .detailsListModel[index].name}')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Designation',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                      DataCell(Text(
                                          '${companydetailsController
                                              .detailsListModel[index]
                                              .designation}')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('DIN ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                      DataCell(Text(
                                          '${companydetailsController
                                              .detailsListModel[index]
                                              .dinNo}')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Appointment Date	',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                      DataCell(Text(
                                        DateFormat("dd-MM-yyyy")
                                            .format(
                                            companydetailsController
                                                .detailsListModel[index]
                                                .appointDate)
                                            .toString(),
                                      )),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Issue Date	',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                      DataCell(Text(
                                        DateFormat("dd-MM-yyyy")
                                            .format(
                                            companydetailsController
                                                .detailsListModel[index]
                                                .issueDate)
                                            .toString(),)),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Expiry Date	',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                      DataCell(Text(
                                        DateFormat("dd-MM-yyyy")
                                            .format(
                                            companydetailsController
                                                .detailsListModel[index]
                                                .expiryDate)
                                            .toString(),
                                      )),
                                    ]),
                                  ]),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                )),
          ),
        ));
  }
}
