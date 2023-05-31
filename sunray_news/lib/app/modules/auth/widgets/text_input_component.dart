import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  TextInputComponent(
      {super.key,
      required this.isPassword,
      required this.controller,
      required this.validator});

  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  bool obsecureText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        autofocus: false,
        validator: widget.validator,
        autocorrect: true,
        controller: widget.controller,
        cursorColor: Color.fromRGBO(27, 69, 113, 1),
        showCursor: true,
        style: TextStyle(fontSize: 17, color: Colors.black),
        obscureText: widget.isPassword ? obsecureText : false,
        decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            hintText: widget.isPassword ? 'Input Password' : 'Input Email',
            hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      obsecureText = !obsecureText;
                      setState(() {});
                    },
                    icon: obsecureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off))
                : null),
      ),
    );
  }
}
