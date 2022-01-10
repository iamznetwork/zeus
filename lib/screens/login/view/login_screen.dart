import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/assets/constants.dart' as constants;
import 'package:zeus/screens/login/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // inject the getX controller
    final LoginController controller = Get.put(LoginController());
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
                child: Obx(() => TextFormField(
                      readOnly: controller.pwdIsReadOnly.value,
                      controller: controller.passwordFieldController,
                      maxLines: 1,
                      obscureText: controller.pwdIsObscured.value,
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
                            icon: Icon(controller.pwdIsObscured.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            // color: constants.colors['zenonGreen'],
                            onPressed: controller.onTogglePwdObscurity,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: constants.colors['zenonGreen']!,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 40,
                    ),
                    onPressed: controller.onSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
