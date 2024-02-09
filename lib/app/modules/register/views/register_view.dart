import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_outlined ,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: registerController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("User Profile",style: titleDark,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registerController.fName,
                        decoration: const InputDecoration(
                          hintText: "First Name",
                          prefixIcon: Icon(Icons.person_2),
                          prefixIconColor: primaryColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber,width: 2),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registerController.mName,
                        decoration: const InputDecoration(
                          hintText: "Middle Name",
                          prefixIcon: Icon(Icons.person_2),
                          prefixIconColor: primaryColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber,width: 2),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registerController.lName,
                        decoration: const InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Icon(Icons.person_2),
                          prefixIconColor:primaryColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber,width: 2),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Name is required";
                          }
                          return null;
                        },
                        ),
                      ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: registerController.email,
                        decoration: const InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.mail),
                          prefixIconColor: primaryColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber,width: 2),
                          ),
                        ),
                        validator: (value) {
                      if (value!.isEmpty) {
                      return 'Enter your Email address';
                      }
                      if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
                      return 'Enter a Valid Email address';
                      }
                      return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: registerController.mobile,
                        decoration: const InputDecoration(
                            hintText: "Mobile Number",
                            prefixIcon: Icon(Icons.phone),
                          prefixIconColor: primaryColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber,width: 2),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Number is required";
                          }else if(value.length != 10){
                            return "Incorrect phone number";
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 15, 50, 00),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Gender*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                               registerController.add_radio_button(0, 'Male'),
                              registerController.add_radio_button(1, 'Female'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16,),
                    InkWell(
                      onTap: (){
                        registerController.moveTohome(context);
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: const Center(child: Text("Next",style: TextStyle(fontSize: 16,color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
