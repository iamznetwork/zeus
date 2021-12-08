import 'package:flutter/material.dart';
import 'package:zeus/models/secret.dart';
import 'package:zeus/services/secure_data_store_service.dart';

class SecretEditScreen extends StatefulWidget {
  const SecretEditScreen({Key? key, this.secret}) : super(key: key);

  final Secret? secret;

  @override
  _SecretEditScreenState createState() => _SecretEditScreenState();
}

class _SecretEditScreenState extends State<SecretEditScreen> {
  bool _isObscure = true;
  String titleHeading = "New Secret";

  // for the form validation
  final _formKey = GlobalKey<FormState>();

  // the secret
  late final Secret secret;

  @override
  // ignore: must_call_super
  void initState() {
    secret = widget.secret!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit: " + titleHeading),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            submitForm();
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text('Processing Data')),
            // );
          } else {}
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
        backgroundColor: Colors.grey[850],
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 16),
              child: TextFormField(
                onChanged: (value) {
                  // formData['title'] = value;
                  secret.title = value;
                },
                enabled: true,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a name';
                  }
                  return null;
                },
                initialValue: widget.secret?.title,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: widget.secret?.title,
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
              child: TextFormField(
                enabled: true,
                obscureText: false,
                onChanged: (value) {
                  // formData['url'] = value;
                  secret.url = value;
                },
                initialValue: widget.secret?.url,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: widget.secret?.url,
                  labelText: "URL",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
              child: TextFormField(
                enabled: true,
                obscureText: false,
                onChanged: (value) {
                  // formData['username'] = value;
                  secret.username = value;
                },
                initialValue: widget.secret?.username,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: widget.secret?.username,
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
              child: TextFormField(
                obscureText: _isObscure,
                enabled: true,
                onChanged: (value) {
                  // formData['password'] = value;
                  secret.secret = value;
                },
                initialValue: widget.secret?.secret,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: widget.secret?.secret,
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 16),
              child: TextFormField(
                enabled: true,
                obscureText: false,
                maxLines: 10,
                onChanged: (value) {
                  // formData['description'] = value;
                  secret.description = value;
                },
                initialValue: widget.secret?.description,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // hintText: widget.secret?.description,
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void submitForm() async {
    // Store the secret
    await SecureDataStoreService.updateSecret(secret);
  }
}
