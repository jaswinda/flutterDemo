import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/pages/home_page.dart';
import 'package:my_first_flutter_project/views/pages/register_page.dart';

void main() {
  runApp(const MaterialApp(
      home: GetMaterialApp(
          title: "My First Flutter Project", home: MyHomePage())));
}
