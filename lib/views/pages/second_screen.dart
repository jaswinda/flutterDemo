import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/field_controller.dart';

class HomeScreen extends StatelessWidget {
  final fieldController = Get.put(FieldController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                fieldController.email.value = value;
              },
            ),
            Obx(() => Text(fieldController.validateEmail(fieldController.email)
                ? ""
                : "Email is not valid")),
            ElevatedButton(
                onPressed: () {
                  var data = {"email": fieldController.email.value};
                  print(data);
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
