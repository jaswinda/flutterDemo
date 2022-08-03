import 'package:get/get.dart';

class FieldController extends GetxController {
  var errors = {}.obs;
  var email = "".obs;

  bool validateEmail(email) {
    if (!email.toString().contains("@")) {
      errors.value = {"email": "Email is not valid"};
      return false;
    }
    return true;
  }
}
