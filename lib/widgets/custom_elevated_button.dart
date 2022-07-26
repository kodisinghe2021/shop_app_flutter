
import 'package:flutter/material.dart';
import 'package:sales_app/widgets/text_catogories.dart';

class CustomElevatedButtonNew extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomElevatedButtonNew(this.onTap, {required this.text, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
        ),
        onPressed: onTap,
        child: CustomButtonText(text: text),
      ),
    );
  }
}
