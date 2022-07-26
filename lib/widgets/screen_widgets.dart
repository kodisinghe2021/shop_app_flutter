import 'package:flutter/material.dart';

class WallImage extends StatelessWidget {
  const WallImage({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Image.asset(
        'assets/images/pat02.png',
        fit: BoxFit.fill,
      ),
    );
  }
}

// gap between widgets
class VerticalGap extends StatelessWidget {
  const VerticalGap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 13);
  }
}
