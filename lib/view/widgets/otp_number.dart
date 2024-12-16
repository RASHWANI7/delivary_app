import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';


class OtpNumber extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  const OtpNumber({
    super.key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 68,width: 64,child:
    TextFormField(
      controller: controller,
      focusNode: currentFocus,
      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), ),
        enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide( color: Constants.primary_color, width: 2.0, ), ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Constants.primary_color,  width: 2.0, ), ), ),
      onChanged: (value) { if (value.length == 1) {
        currentFocus.unfocus();
        FocusScope.of(context).requestFocus(nextFocus); } },
    ),
    );
  }
}