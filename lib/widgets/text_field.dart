import 'package:flutter/material.dart';
import 'package:sales_app/constant.dart';

class CustomTextField extends StatelessWidget {
  // comstructor of this class
  CustomTextField({
    // assign values in constructor
    Key? key,
    required this.textOnLabale,
    required this.controller,
    required this.isSecure,
    this.errorText,
    this.iconPrefix,
    this.iconSufix,
    this.validatingfunc,
  }) : super(key: key);

  // variables for insert this
  final errorText;
  final textOnLabale;
  final Function()? validatingfunc;
  TextEditingController controller;

  // these are can be nullable
  Widget? iconPrefix;
  Widget? iconSufix;
  final bool isSecure;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(28)),
      child: TextField(
        obscureText: isSecure,
        controller: controller,
        decoration: InputDecoration(
          iconColor: kPrimeryColor,
          errorText: errorText,
          label: Text(textOnLabale),
          prefixIcon: iconPrefix,
          suffixIcon: iconSufix,

          // this is the border style of start
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 239, 227, 227), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
          ),

          // this is the border style of after focus
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kFocusBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(28),
            ),
          ),
        ),
      ),
    );
  }
}
