import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/home/view/home_screen.dart';
import 'package:zeus/screens/newUserPassword/view/new_user_password_screen.dart';
import 'package:zeus/services/login_service.dart';
import 'package:zeus/services/secure_data_store_service.dart';
import 'package:zeus/services/zenon_manager.dart';

class LoginController extends GetxController {
  final passwordFieldController = TextEditingController();
  var pwdIsObscured = true.obs;
  var pwdIsReadOnly = false.obs;
  int remainingLoginAttempts = 3;

  onTogglePwdObscurity() {
    pwdIsObscured.value = !pwdIsObscured.value;
  }

  onSubmit() async {
    String password = passwordFieldController.text;

    if (remainingLoginAttempts <= 1) {
      // reset password and go to home screen
      Get.snackbar("Login failed",
          "Incorrect pasword was entered 3 times. Going to reset Zeus.",
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
      await LoginService.resetUserLogin();
      await Future.delayed(const Duration(seconds: 3));
      // TODO: also delete Hive DB!!!
      Get.off(() => const NewUserPasswordScreen());
      return;
    }

    if (await LoginService.loginUser(password)) {
      // login was successful
      pwdIsReadOnly.value = true;

      // show some loading
      Get.snackbar("Success", "Loading and decrypting database...",
          icon: const Icon(Icons.work),
          // backgroundColor: MyThemeColors.zenonGreen,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1000));

      // init zenon and db
      Future.wait([
        ZenonManager.initZenon(),
        SecureDataStoreService.initDataStore(password)
      ]).then((value) {
        // both are done. time to bring the user to the app
        Get.closeAllSnackbars();
        Get.off(() => const Home(title: "Welcome Zeus"));
      });
    } else {
      remainingLoginAttempts--;
      Get.snackbar(
        "Login failed",
        "Incorrect pasword. $remainingLoginAttempts attempts left until Zeus will be reset.",
        icon: const Icon(Icons.error),
        // backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
