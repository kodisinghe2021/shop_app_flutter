import 'package:flutter/material.dart';

class LogoForSignPage extends StatelessWidget {
  const LogoForSignPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 20, 0),
          width: size.width * 0.4,
          height: size.width * 0.4,
          child: Image.asset('assets/images/login.png')),
    );
  }
}