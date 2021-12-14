import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/home/view/home_screen.dart';
import 'package:zeus/screens/newUserPassword/screen/new_user_password_screen.dart';
// import 'package:zeus/services/crypto_service.dart';
// import 'package:zeus/services/crypto_services.dart';
import 'package:zeus/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();
  final passwordFieldController = TextEditingController();
  bool obscured = true;
  int remainingLoginAttempts = 3;

  onSubmit(String password) async {
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
      Get.off(() => const Home(title: "Welcome Zeus"));
    } else {
      remainingLoginAttempts--;
      Get.snackbar(
        "Login failed",
        "Incorrect pasword. $remainingLoginAttempts attempts left until Zeus will be reset.",
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 60),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  'Please enter your password',
                  // style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                width: 300,
                child: TextFormField(
                  readOnly: false,
                  controller: passwordFieldController,
                  maxLines: 1,
                  obscureText: obscured,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // formData['password'] = value;
                    // widget.onChanged(value);
                  },
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Your current password",
                      suffixIcon: IconButton(
                        icon: Icon(
                            obscured ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          //obscurable = !obscurable;
                          setState(() {
                            obscured = !obscured;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 40,
                    ),
                    onPressed: () {
                      onSubmit(passwordFieldController.text);
                      //setState(() {});
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
