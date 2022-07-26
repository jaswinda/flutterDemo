import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        for (int i = 0; i < 100; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
        myColorfulRow(50.0),
      ]),
    ));
  }

  Widget myColorfulRow(double height) {
    return Row(
      children: [
        Container(
          width: 100,
          height: height,
          color: Colors.blue,
        ),
        Expanded(
          child: Container(
            width: 100,
            height: height,
            color: Colors.pink,
          ),
        ),
        Expanded(
          child: Container(width: 100, height: 100, color: Colors.red),
        ),
      ],
    );
  }
}
