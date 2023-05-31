import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField(
      {super.key,
      required this.controller,
      required this.node,
      required this.onSubmit});
  final TextEditingController controller;
  final FocusNode node;
  final ValueChanged onSubmit;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      autofocus: true,
      controller: controller,
      onSubmitted: onSubmit,
      style: TextStyle(
          fontSize: 18,
          color: isDark ? Colors.white.withOpacity(.5) : Colors.white),
      decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.white.withOpacity(.5) : Colors.white,
          ),
          filled: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          fillColor: isDark
              ? Color.fromRGBO(32, 32, 32, 1)
              : Color.fromRGBO(159, 158, 158, 1),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.white.withOpacity(.5) : Colors.white,
            size: 19,
          ),
          hintTextDirection: TextDirection.ltr,
          hintText: 'Search'),
    );
  }
}
