import 'package:flutter/material.dart';
import 'package:my_first_flutter_project/views/components/my_row_component.dart';
import 'package:my_first_flutter_project/views/pages/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const MyComponent(height: 50),
          Text(counter.toString(), style: const TextStyle(fontSize: 30)),
          ElevatedButton(
              onPressed: () {
                counter = counter + 1;
                setState(() {});
              },
              child: const Text("Click Me")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              counter: counter,
                            )));
              },
              child: const Text("Go To next Page"))
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //     // crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Container(
          //         width: 50,
          //         height: 100,
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         width: 100,
          //         height: 200,
          //         color: Colors.pink,
          //       ),
          //       Container(
          //         width: 200,
          //         height: 250,
          //         color: Colors.red,
          //       ),
          //     ]),
        ],
      )),
    );
  }
}
