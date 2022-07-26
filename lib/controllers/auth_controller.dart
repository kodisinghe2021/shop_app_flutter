import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:sales_app/screens/home_screens/product_screen.dart';
import 'package:sales_app/screens/login_screens/login_screen.dart';
import 'package:sales_app/widgets/alert_box.dart';

class AuthController {
// firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

//alert instance
  final AlertBox _alertBox = AlertBox();

  // Registration function
  Future<void> userRegistration(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _alertBox.viewAlert(context, 'SUCCESS', 'Successfully Regitratered',
            CoolAlertType.success, () {
          Navigator.pushNamed(context, LoginScreen.pageKey);
        });
      }
    } catch (e) {
      _alertBox.viewAlert(context, 'ERROR', 'Regitration Failed with error: $e',
          CoolAlertType.error, () {});
    }
  }

  // login user
  Future<void> userLogin(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user!.email != null) {
        _alertBox.viewAlert(
            context, 'SUCCESS', 'loggin here', CoolAlertType.success, () {
          Navigator.pushNamed(context, ProductPage.pageKey,
              arguments: userCredential.user!.email);
        });
      }
    } on FirebaseAuthException catch (e) {
      _alertBox.viewAlert(context, 'ERROR', 'Regitration Failed with error: $e',
          CoolAlertType.error, () {});
    }
  }

// Signout function
  Future<void> signout() async {
    FirebaseAuth.instance.signOut();
  }

// get firebase current status
  Future<void> currentUserStatus(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamed(context, ProductPage.pageKey,
            arguments: user.email);
      } else if (user == null) {
        Navigator.pushNamed(context, LoginScreen.pageKey);
      }
    });
  }

  // field validation function, find there are any empty fields ?
  int isfieldEmpty(String email, String password) {
    int errorCode = -1;
    if (email.isEmpty && password.isEmpty) {
      errorCode = 0;
    } else if (email.isEmpty) {
      errorCode = 1;
    } else if (password.isEmpty) {
      errorCode = 2;
    }
    return errorCode;
  }
}
