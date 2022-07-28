import 'package:flutter/material.dart';

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
          color: Colors.blue,
          border: Border.all(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        width: 100,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
