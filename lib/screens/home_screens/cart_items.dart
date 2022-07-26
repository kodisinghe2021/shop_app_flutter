import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            "Cart Page",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
