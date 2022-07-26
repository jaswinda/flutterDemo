import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project_admin/controller/category_controller.dart';
import 'package:my_first_flutter_project_admin/views/pages/loader.dart';
import 'controller/authentication_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());
  Get.put(CategroyController());
  runApp(const MaterialApp(
      home: GetMaterialApp(title: "My First Flutter Project", home: Loader())));
}
