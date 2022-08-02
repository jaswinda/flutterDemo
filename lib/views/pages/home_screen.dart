import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';
import '../../controller/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counter = Get.put(Counter());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              "SignUp",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
            _myField(label: "Email", controller: emailController),
            _myField(
                label: "Password",
                obscureText: true,
                controller: passwordController),
            MyButton(
              onTap: () {
                var data = {
                  "email": emailController.text,
                  "password": passwordController.text
                };
                print(data);
              },
              text: "Submit",
            )
          ],
        ),
      )),
    );
  }

  Widget _myField(
      {label = "Email",
      obscureText = false,
      required TextEditingController controller}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(label, textAlign: TextAlign.left),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
            ),
            validator: (value) {
              if (value == null) {
                return "Please enter $label";
              }
              if (value.isEmpty) {
                return "Please enter $label";
              }
              if (!value.contains("@")) {
                return "Please enter a valid $label";
              }
              // if (value) {
              //   return 'Please enter a valid email';
              // }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
