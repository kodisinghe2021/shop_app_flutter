import 'package:flutter/material.dart';

class UtilFuntion {
  static void NavigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
