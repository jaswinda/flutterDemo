import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final int counter;
  const SecondScreen({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(counter.toString()),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Click Me")),
          ],
        ),
      ),
    );
  }
}
