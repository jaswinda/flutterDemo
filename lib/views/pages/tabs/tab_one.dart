import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controller/authentication_controller.dart';
import 'package:my_first_flutter_project/utils/shared_preds.dart';
import 'package:my_first_flutter_project/views/pages/loader.dart';

class TabOne extends StatelessWidget {
  final AuthService authService = AuthService();
  final authentication = Get.find<Authentication>();

  TabOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
              child: ElevatedButton(
                  onPressed: () => logout(), child: const Text("Logout"))),
        ],
      ),
    );
  }

  logout() async {
    await authentication.logout();
    Get.offAll(const Loader());
  }
}
