import 'package:flutter/material.dart';
import 'package:my_first_flutter_project_admin/utils/constants.dart';

class MyButton extends StatelessWidget {
  final onTap;
  final String text;
  const MyButton({Key? key, required this.onTap, this.text = 'Hello'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryColor,
          ),
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          )),
    );
  }
}
