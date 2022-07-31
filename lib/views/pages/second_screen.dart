import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/components/my_button.dart';
import '../../controller/counter.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final counter = Get.find<Counter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Obx(() => Center(
                  child: Text(counter.count.toString(),
                      style: const TextStyle(fontSize: 30)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                    onTap: () {
                      counter.increment();
                    },
                    text: "Add"),
                MyButton(onTap: () {}, text: "Subtract"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
