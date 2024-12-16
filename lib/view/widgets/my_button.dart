import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery_app/constants/constants.dart';
import 'package:delivery_app/model/authentication_provider.dart';
import 'package:provider/provider.dart';

class My_Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const My_Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primary_color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
            child: Provider.of<AuthenticationProvider>(context).loading  ?
               const CircularProgressIndicator(
                color: Colors.white,
              )
                  : Text(
                text,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
