import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_project/utils/api.dart';

class Authentication extends GetxController {
  final _token = ''.obs;

  login(data) async {
    print(data);
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
