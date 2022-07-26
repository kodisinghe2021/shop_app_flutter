import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/controllers/auth_controller.dart';
import 'package:sales_app/screens/home_screens/product_screen.dart';
import 'package:sales_app/screens/login_screens/registration_screen.dart';
import 'package:sales_app/widgets/alert_box.dart';
import 'package:sales_app/widgets/custom_elevated_button.dart';
import 'package:sales_app/widgets/logo_for_sign_page.dart';
import 'package:sales_app/widgets/screen_widgets.dart';
import 'package:sales_app/widgets/side_bar.dart';
import 'package:sales_app/widgets/text_catogories.dart';
import 'package:sales_app/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  // key of this page
  static const pageKey = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //firebase instance
  FirebaseAuth auth = FirebaseAuth.instance;

  // using this variable will chnage password text visible or unvisible
  bool _isSecureText = true;

//this will get the text of password field
  final TextEditingController _emailTextLog = TextEditingController();
  final TextEditingController _passwordTextLog = TextEditingController();

// get email from firebase
  String email = 'Guest';

  // intance for Auth Controller
  final AuthController _authController = AuthController();

// alert helper instance
  AlertBox alertBox = AlertBox();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              //full image
              WallImage(screenSize: screenSize),

              Container(
                padding: const EdgeInsets.only(left: 60),
                width: screenSize.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      textOnLabale: "Email",
                      isSecure: false,
                      controller: _emailTextLog,
                      // errorText: _errorTextEmailLog,
                      iconPrefix: const Icon(Icons.email, size: 15),
                    ),
                    const VerticalGap(),
                    CustomTextField(
                      textOnLabale: "Password",
                      isSecure: _isSecureText,
                      controller: _passwordTextLog,
                      // errorText: _errorTextPasswordLog,
                      iconPrefix: const Icon(Icons.security, size: 15),
                      iconSufix: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSecureText = !_isSecureText;
                          });
                        },
                        icon: Icon(_isSecureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye),
                      ),
                    ),
                    const VerticalGap(),
                    CustomElevatedButtonNew(() {
                      switch (_authController.isfieldEmpty(
                          _emailTextLog.text, _passwordTextLog.text)) {
                        case 0:
                          alertBox.viewAlert(
                              context,
                              'WARNING',
                              'Fields Cannot be Empty',
                              CoolAlertType.warning,
                              () {});
                          break;
                        case 1:
                          alertBox.viewAlert(
                              context,
                              'WARNING',
                              'Empty Email Field',
                              CoolAlertType.warning,
                              () {});
                          break;
                        case 2:
                          alertBox.viewAlert(
                              context,
                              'WARNING',
                              'Empty Password Field',
                              CoolAlertType.warning,
                              () {});
                          break;
                        case -1:
                          _authController.userLogin(context, _emailTextLog.text,
                              _passwordTextLog.text);
                          _emailTextLog.clear();
                          _passwordTextLog.clear();
                          break;
                      }
                    }, text: 'LOGIN'),
                  ],
                ),
              ),

              //this is the logo of right upper cornor
              //this is the logo of right upper cornor
              LogoForSignPage(size: screenSize),

              const Positioned(
                top: 210,
                left: 90,
                child: CustomHeading01(
                  text: 'LOGIN',
                ),
              ),
// go to sign in page
              Positioned(
                top: screenSize.height * 0.68,
                right: 0,
                child: SideBarContainer(
                  width: 150,
                  textData: 'Sign IN',
                  icon: const Icon(Icons.person_add, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, RegistrationScreen.pageKey);
                  },
                ),
              ),
// go to prduct view page but as a guest.
              Positioned(
                top: screenSize.height * 0.75,
                right: 0,
                child: SideBarContainer(
                  width: 220,
                  textData: 'Login as a guest',
                  icon: const Icon(Icons.login, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, ProductPage.pageKey,
                        arguments: email);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
