import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MultipleController extends GetxController {

  var multiplier = 0.obs; // Observable variable
  RxList<int> multiples = <int>[].obs;
  RxList<Widget> formFields = <Widget>[].obs;
  List<TextEditingController> controllers = [];

  void generateMultiples() {
    for (int i = 1; i <= 1; i++) {
      multiples.add(multiplier.value * i);
    }
  }

  void removeAtIndex(int index) {
    if (index >= 0 && index < multiples.length) {
      multiples.removeAt(index);
      update();
    }
  }
  void addFormField() {
    final controller = TextEditingController(); // Create a new controller
    controllers.add(controller);
    formFields.add(
      TextFormField(
        controller: controller, // Assign the controller to the TextFormField
        decoration: InputDecoration(labelText: 'Field ${formFields.length + 1}'),
      ),
    );

    print('Controllers: $controllers');
  }

  void encodeText() {
    for (int i = 0; i < controllers.length; i++) {
      String text = controllers[i].text;
      String encodedText = Uri.encodeFull(text);
      print('Encoded text for field $i: $encodedText');
    }
  }
  void removeFormField(int index) {
    formFields.removeAt(index);
  }
}



