import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/authentication_controller.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';
import 'package:my_first_flutter_project/views/components/my_field.dart';
import 'package:my_first_flutter_project/views/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.find<Authentication>();
  RegisterPage({Key? key}) : super(key: key);

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
                  ),
                  MyButton(onTap: () {
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                      var data = {
                        "email": emailController.text,
                        "password": passwordController.text,
                        "username": usernameController.text,
                        "name": nameController.text,
                        "phone": phoneController.text
                      };
                      authentication.SignUp(data);
                    }
                  }),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Already have an account?"),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginPage());
                    },
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
