import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';

class AlertBox {
  Future<dynamic> viewAlert(BuildContext context, String title, String text,
      CoolAlertType alertType, Function onTap) async {
    return CoolAlert.show(
      context: context,
      type: alertType,
      title: title,
      text: text,
      animType: CoolAlertAnimType.rotate,
      borderRadius: 30,
      onConfirmBtnTap: onTap(),
    );
  }
}
