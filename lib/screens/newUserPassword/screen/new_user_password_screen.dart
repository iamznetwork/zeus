import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:zeus/screens/home/view/home_screen.dart';
import 'package:zeus/screens/login/view/login_screen.dart';
// import 'package:zeus/services/crypto_service.dart';
// import 'package:zeus/services/crypto_services.dart';
// import 'package:zeus/services/login_service.dart';
import 'package:zeus/services/secure_data_store_service.dart';

class NewUserPasswordScreen extends StatefulWidget {
  const NewUserPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewUserPasswordScreenState createState() => _NewUserPasswordScreenState();
}

class _NewUserPasswordScreenState extends State<NewUserPasswordScreen> {
  // final _formKey = GlobalKey<FormState>();
  final passwordFieldController1 = TextEditingController();
  final passwordFieldController2 = TextEditingController();
  bool obscured = true;

  onSubmit(String password1, String password2) async {
    List<String> errors = [];

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
                  'New password',
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
                  controller: passwordFieldController1,
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
                      hintText: "Your new password",
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
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: 300,
                child: TextFormField(
                  readOnly: false,
                  controller: passwordFieldController2,
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
                      hintText: "Confirm your password",
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
                      onSubmit(passwordFieldController1.text,
                          passwordFieldController2.text);
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
