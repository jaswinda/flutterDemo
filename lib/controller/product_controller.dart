import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_project_admin/utils/constants.dart';
import 'package:my_first_flutter_project_admin/utils/shared_preds.dart';

import '../utils/api.dart';

class ProductController extends GetxController {
  var loading = false.obs;
  final AuthService authService = AuthService();

  add(data, PickedFile? file) async {
    loading.value = true;
    data['token'] = await authService.getToken();
    var url = Uri.parse(ADD_PRODUCT_API);
    await Future.delayed(const Duration(seconds: 3));
    var response = await http.post(url, body: data);
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.back();
        showMessage(message: jsonResponse["message"]);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
