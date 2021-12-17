import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeus/screens/newUserPassword/controller/new_user_password_controller.dart';

class NewUserPasswordScreen extends StatefulWidget {
  const NewUserPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewUserPasswordScreenState createState() => _NewUserPasswordScreenState();
}

class _NewUserPasswordScreenState extends State<NewUserPasswordScreen> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // inject the getX controller
    final NewUserPasswordController controller =
        Get.put(NewUserPasswordController());
    return Scaffold(
      body: Center(
        child: Form(
          child: Obx(() => Column(
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
                      controller: controller.passwordFieldController1,
                      maxLines: 1,
                      obscureText: controller.pwdsAreObscured.value,
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
                            icon: Icon(controller.pwdsAreObscured.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: controller.onTogglePwdsObscurity,
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
                      controller: controller.passwordFieldController2,
                      maxLines: 1,
                      obscureText: controller.pwdsAreObscured.value,
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
                            icon: Icon(controller.pwdsAreObscured.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: controller.onTogglePwdsObscurity,
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
                      onPressed: controller.onSubmit,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
