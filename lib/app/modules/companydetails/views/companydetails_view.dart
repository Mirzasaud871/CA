import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vakil99/constants.dart';

import '../controllers/companydetails_controller.dart';

class CompanydetailsView extends GetView<CompanydetailsController> {
  const CompanydetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: primaryColor,
        title: const Text('Company Details',style: TextStyle(color: Colors.white),),
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
                Text("Company Detail",style: TextStyle(fontSize:width * 0.06,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: width * 0.02,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border:Border.all(color: Colors.grey.shade400,width: 1.5)
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                        dataTextStyle: TextStyle(fontSize: width * 0.04),
                        headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey),
                      headingRowHeight: 40.0,
                        columns: [
                          DataColumn(
                            label: Text('Name',style: TextStyle(fontSize: width * 0.05,color: Colors.white),),
                          ),
                          DataColumn(
                            label: Text('Details',style: TextStyle(fontSize: width * 0.05,color: Colors.white)),
                          ),
                        ],
                        rows: [
                          const DataRow(cells: [
                            DataCell(Text('CIN Number	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('5644645')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Company Name	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Zynomatrix')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Category ',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Software')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Class	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(const Text('Semi-Govt')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Authorized	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('12345')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Registration No.	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('111')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('ROC	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Ujjain12')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Sub Category	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('One person')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Status	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Non-Listed')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Paid Up	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('12345')),
                          ]),
                        ]),
                  ),
                ),
                SizedBox(height: width * 0.06,),

                //Contact details
                Text("Contact Detail",style: TextStyle(fontSize:width * 0.06,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: width * 0.02,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border:Border.all(color: Colors.grey.shade400,width: 1.5)
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      dataTextStyle: TextStyle(fontSize: width * 0.04),
                        headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey),
                        headingRowHeight: 40.0,
                        columns: [
                          DataColumn(
                            label: Text('Name',style: TextStyle(fontSize: width * 0.05,color: Colors.white),),
                          ),
                          DataColumn(
                            label: Text('Details',style: TextStyle(fontSize: width * 0.05,color: Colors.white)),
                          ),
                        ],
                        rows: [
                          const DataRow(cells: [
                            DataCell(Text('Emial',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('email@gmail.com')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Mobile No.	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('7400345673')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Country ',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('India')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('State	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('MP')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('City	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Ujjain')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Zip Code	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('456001')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('Address	',style: TextStyle(fontWeight: FontWeight.bold))),
                            DataCell(Text('Nanakheda')),
                          ]),
                        ]),
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
