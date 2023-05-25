import 'package:flutter/material.dart';

class TextInputComponent extends StatefulWidget {
  TextInputComponent({super.key, required this.isPassword, required this.controller});

  final bool isPassword;
  TextEditingController controller = TextEditingController();

  @override
  State<TextInputComponent> createState() => _TextInputComponentState();
}

class _TextInputComponentState extends State<TextInputComponent> {
  bool obsecureText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: Theme.of(context).colorScheme.secondary,
            showCursor: true,
            style: TextStyle(
              fontSize: 17,
            ),
            obscureText: widget.isPassword ? obsecureText : false,
            decoration: InputDecoration(
                hintText: widget.isPassword ? 'Input Password' : 'Input Email',
                hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                border: InputBorder.none,
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
        ),
      ),
    );
  }
}
