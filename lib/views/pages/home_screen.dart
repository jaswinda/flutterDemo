import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/components/my_field.dart';

class HomeScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyField(
                controller: emailController,
                myValidator: (value) {
                  if (!value.toString().contains("@")) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                      var data = {"email": emailController.text};
                      print(data);
                    }
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
