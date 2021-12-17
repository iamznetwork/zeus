import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/login/view/login_screen.dart';
import 'package:zeus/services/secure_data_store_service.dart';

class NewUserPasswordController extends GetxController {
  // final _formKey = GlobalKey<FormState>();
  final passwordFieldController1 = TextEditingController();
  final passwordFieldController2 = TextEditingController();
  var pwdsAreObscured = true.obs;

  onTogglePwdsObscurity() {
    pwdsAreObscured.value = !pwdsAreObscured.value;
  }

  onSubmit() async {
    List<String> errors = [];

    // get the current values
    String password1 = passwordFieldController1.text;
    String password2 = passwordFieldController2.text;

    // check if passwords match
    if (password1 != password2) {
      errors.add("Passwords do not match");
    }
    if (password1.length < 6) {
      errors.add("Password needs to be at least 6 characters long.");
    }
    if (!password1.contains(RegExp(r'[0-9]'))) {
      errors.add("Password needs to contain at least one digit (0-9).");
    }
    if (!password1.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors.add("Password needs to contain at least one special character.");
    }

    if (errors.isEmpty) {
      // everything seems to be fine
      await SecureDataStoreService.storeHashedUserPassword(password1);
      Get.off(() => const LoginScreen());
    } else {
      Get.snackbar(
        "Setting new password failed",
        errors[0],
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
