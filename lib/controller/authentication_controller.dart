import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_project/utils/api.dart';
import 'package:my_first_flutter_project/utils/shared_preds.dart';
import 'package:my_first_flutter_project/views/pages/home_page.dart';
import 'package:my_first_flutter_project/views/pages/login_page.dart';

import '../utils/constants.dart';

class Authentication extends GetxController {
  final _token = ''.obs;
  final authService = AuthService();

  login(data) async {
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        await authService.saveToken(jsonResponse["token"]);
        Get.offAll(const MyHomePage());
        showMessage(message: jsonResponse["message"], isSuccess: true);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  SignUp(data) async {
    var url = Uri.parse(SIGNUP_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.offAll(const LoginPage());
        showMessage(message: jsonResponse["message"], isSuccess: true);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  logout() async {
    var token_ = await authService.getToken();
    var url = Uri.parse(LOGOUT_API);
    var response = await http.post(url, body: {"token": token_});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        await authService.removeToken();
        Get.offAll(const LoginPage());
        showMessage(message: jsonResponse["message"], isSuccess: true);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
