import 'package:flutter/material.dart';
import 'package:delivery_app/constants/constants.dart';

class Text_Field extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final controller;
  final bool obscureText;
  const Text_Field({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.primary_color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Constants.primary_color),
        ),
        suffixIcon: Icon(
          icon,
          color: Constants.primary_color,
          size: 25,
        ),
        label: Text(
          hint,
          style: TextStyle(
              fontSize: 20,
              color: Constants.primary_color,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
