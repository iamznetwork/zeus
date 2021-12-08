import 'package:flutter/material.dart';
import 'package:zeus/assets/constants.dart';
import 'package:zeus/models/secret.dart';

class SecretItemFormEntry extends StatefulWidget {
  final String label;
  final String initValue;
  final int maxLines;
  final bool isObscurable;
  bool isReadOnly;
  late Secret secretObject;

  SecretItemFormEntry({
    Key? key,
    required this.label,
    required this.initValue,
    this.maxLines = 1,
    this.isObscurable = false,
    this.isReadOnly = true,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onChanged;

  @override
  _SecretItemFormEntryState createState() => _SecretItemFormEntryState();
}

class _SecretItemFormEntryState extends State<SecretItemFormEntry> {
  bool obscurable = false;
  bool obscured = false;

  @override
  // ignore: must_call_super
  void initState() {
    obscurable = widget.isObscurable;
    obscured = widget.isObscurable;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        controller: TextEditingController()..text = widget.initValue,
        maxLines: widget.maxLines,
        obscureText: obscured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value) {
          // formData['password'] = value;
          widget.onChanged(value);
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
          suffixIcon: obscurable
              ? IconButton(
                  icon:
                      Icon(obscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    //obscurable = !obscurable;
                    setState(() {
                      obscured = !obscured;
                    });
                  },
                )
              : null,
          border: widget.isReadOnly
              ? OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                )
              : OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: MyThemeColors.zenonGreen,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
        ),
      ),
    );
  }
}
