import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/pages/second_screen.dart';
import '../../controller/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counter = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Obx(() => Text(counter.count.toString(),
              style: const TextStyle(fontSize: 30))),
          ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: const Text("Click Me")),
          ElevatedButton(
              onPressed: () {
                Get.to(const SecondScreen());
              },
              child: const Text("Go To next Page"))
        ],
      )),
    );
  }
}
