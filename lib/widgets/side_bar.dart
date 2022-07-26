
import 'package:flutter/material.dart';
import 'package:sales_app/constant.dart';

class SideBarContainer extends StatelessWidget {
  const SideBarContainer({
    Key? key,
    this.width = 180,
    required this.textData,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final double width;
  final String textData;
  final Widget icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: const BoxDecoration(
        color: kPrimeryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: onTap,
            child: Text(
              textData,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
