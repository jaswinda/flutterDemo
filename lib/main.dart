import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/views/pages/loader.dart';
import 'package:my_first_flutter_project/views/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
      home: GetMaterialApp(title: "My First Flutter Project", home: Loader())));
}
