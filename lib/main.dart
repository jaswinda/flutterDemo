import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/pages/login_page.dart';

void main() {
  runApp(MaterialApp(
      home: GetMaterialApp(
          title: "My First Flutter Project", home: LoginPage())));
}
