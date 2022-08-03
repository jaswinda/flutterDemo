import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final myValidator;
  const MyField(
      {Key? key,
      required this.controller,
      this.text = "Email",
      this.myValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter your $text',
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$text is required";
        }
        return myValidator(value);
      },
    );
  }
}
