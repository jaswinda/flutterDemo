import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';
import 'package:my_first_flutter_project/views/components/my_field.dart';

class HomeScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                    width: 200,
                  ),
                  const Text("Register a New Account",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  MyField(
                    controller: emailController,
                    myValidator: (value) {
                      if (!value.toString().contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                  MyField(
                    text: "Username",
                    controller: nameController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    text: "Phone",
                    controller: nameController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    text: "Name",
                    controller: nameController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    text: "Password",
                    obscureText: true,
                    controller: passwordController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyField(
                    text: "Confirm Password",
                    obscureText: true,
                    controller: confirmPasswordController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyButton(onTap: () {
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                      var data = {"email": emailController.text};
                      print(data);
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
