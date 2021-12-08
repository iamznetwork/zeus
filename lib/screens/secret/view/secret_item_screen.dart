import 'package:flutter/material.dart';
import 'package:zeus/models/secret.dart';
import 'package:zeus/screens/secret/widget/secret_item_form_entry.dart';
import 'package:zeus/services/secure_data_store_service.dart';

class SecretItemScreen extends StatefulWidget {
  SecretItemScreen({Key? key, required this.secret}) : super(key: key);

  Secret secret;

  @override
  _SecretItemScreenState createState() => _SecretItemScreenState();
}

class _SecretItemScreenState extends State<SecretItemScreen> {
  late String? title;

  final _formKey = GlobalKey<FormState>();

  bool formIsReadOnly = true;

  @override
  // ignore: must_call_super
  void initState() {
    // check if we have a new secret
    if (widget.secret.title == null) {
      print("we have a new entry");
      formIsReadOnly = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.secret.title ?? "New Secret"),
          backgroundColor: Colors.grey[850]),
      floatingActionButton: FloatingActionButton(
        // heroTag: "Edit Secret",
        onPressed: () {
          if (formIsReadOnly) {
            setState(() {
              formIsReadOnly = false;
            });
          } else {
            setState(() {
              formIsReadOnly = true;
            });
            submitForm();
          }
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             SecretEditScreen(secret: widget.secret))).then((value) {
          //   setState(() {});
          // });
        },
        child: formIsReadOnly ? const Icon(Icons.edit) : const Icon(Icons.save),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SecretItemFormEntry(
                  label: "Name",
                  initValue: widget.secret.title ?? "",
                  isReadOnly: formIsReadOnly,
                  onChanged: (value) => widget.secret.title = value,
                ),
                SecretItemFormEntry(
                  label: "Url",
                  initValue: widget.secret.url ?? "",
                  isReadOnly: formIsReadOnly,
                  onChanged: (value) => widget.secret.url = value,
                ),
                SecretItemFormEntry(
                  label: "Username",
                  initValue: widget.secret.username ?? "",
                  isReadOnly: formIsReadOnly,
                  onChanged: (value) => widget.secret.username = value,
                ),
                SecretItemFormEntry(
                  label: "Secret",
                  initValue: widget.secret.secret ?? "",
                  isObscurable: true,
                  isReadOnly: formIsReadOnly,
                  onChanged: (value) => widget.secret.secret = value,
                ),
                SecretItemFormEntry(
                  label: "Description",
                  initValue: widget.secret.description ?? "",
                  maxLines: 10,
                  isReadOnly: formIsReadOnly,
                  onChanged: (value) => widget.secret.description = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    // Store the secret
    SecureDataStoreService.updateSecret(widget.secret);
  }
}
