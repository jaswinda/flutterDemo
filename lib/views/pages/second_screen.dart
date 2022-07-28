import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';

class SecondScreen extends StatefulWidget {
  final int counter;
  final add;
  const SecondScreen({Key? key, required this.counter, required this.add})
      : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var myCounter = 0;
  @override
  void initState() {
    super.initState();
    myCounter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                myCounter.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  onTap: () => mySecondAdd(),
                  text: "+",
                ),
                MyButton(
                  onTap: () {},
                  text: "-",
                )
              ],
            ),
            MyButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Back",
            )
          ],
        ),
      ),
    );
  }

  mySecondAdd() {
    myCounter++;
    widget.add();
    setState(() {});
  }
}
