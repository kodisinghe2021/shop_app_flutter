
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_app/constant.dart';


class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.secularOne(
        textStyle: const TextStyle(
            // fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 1),
      ),
    );
  }
}

class CustomHeading01 extends StatelessWidget {
  const CustomHeading01({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.titanOne(
        textStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: kPrimeryColor,
            letterSpacing: 3),
      ),
    );
  }
}
class CustomHeading02 extends StatelessWidget {
  const CustomHeading02({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.titanOne(
        textStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: kPrimeryColor,
            letterSpacing: 3),
      ),
    );
  }
}
