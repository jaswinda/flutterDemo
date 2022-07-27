import 'package:flutter/material.dart';

class MyComponent extends StatelessWidget {
  final double height;
  const MyComponent({Key? key, this.height = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: height,
            height: height,
            color: Colors.blue,
          ),
          Container(
            width: height,
            height: height,
            color: Colors.pink,
          ),
          Container(width: height, height: height, color: Colors.red),
        ],
      ),
    );
  }
}
