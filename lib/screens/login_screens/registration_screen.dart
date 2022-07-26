import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/controllers/auth_controller.dart';
import 'package:sales_app/widgets/alert_box.dart';
import 'package:sales_app/widgets/custom_elevated_button.dart';
import 'package:sales_app/widgets/logo_for_sign_page.dart';
import 'package:sales_app/widgets/screen_widgets.dart';
import 'package:sales_app/widgets/side_bar.dart';
import 'package:sales_app/widgets/text_catogories.dart';
import 'package:sales_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const pageKey = "/registration-screen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // firebase auth instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  // intance for Auth Controller
  final AuthController _authController = AuthController();

  // using this variable will chnage password text visible or unvisible
  bool _isSecureText = true;

  // alert helper instance
  AlertBox alertBox = AlertBox();

//this will get the text of password field
  final TextEditingController _nameReg = TextEditingController();
  final TextEditingController _addressReg = TextEditingController();
  final TextEditingController _phoneReg = TextEditingController();
  final TextEditingController _nicReg = TextEditingController();
  final TextEditingController _emailTextReg = TextEditingController();
  final TextEditingController _passwordTextReg = TextEditingController();

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
              // middle form
              Container(
                padding: const EdgeInsets.only(left: 60),
                width: screenSize.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      textOnLabale: "Name",
                      isSecure: false,
                      controller: _nameReg,
                      // errorText: _errorTextEmailLog,
                      iconPrefix: const Icon(
                        Icons.person_add_alt_outlined,
                        size: 15,
                      ),
                    ),
                    const VerticalGap(),
                    CustomTextField(
                      textOnLabale: "Phone Number",
                      isSecure: false,
                      controller: _phoneReg,
                      // errorText: _errorTextEmailLog,
                      iconPrefix: const Icon(
                        Icons.phone,
                        size: 15,
                      ),
                    ),
                    const VerticalGap(),
                    CustomTextField(
                      textOnLabale: "Email",
                      isSecure: false,
                      controller: _emailTextReg,
                      // errorText: _errorTextEmailLog,
                      iconPrefix: const Icon(
                        Icons.email,
                        size: 15,
                      ),
                    ),
                    const VerticalGap(),
                    CustomTextField(
                      textOnLabale: "Password",
                      isSecure: _isSecureText,
                      controller: _passwordTextReg,
                      // errorText: _errorTextPasswordLog,
                      iconPrefix: const Icon(
                        Icons.security,
                        size: 15,
                      ),
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
                    const SizedBox(height: 30),
                    CustomElevatedButtonNew(() {
                      switch (_authController.isfieldEmpty(
                          _emailTextReg.text, _passwordTextReg.text)) {
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
                          _authController.userRegistration(context,
                              _emailTextReg.text, _passwordTextReg.text);
                          _emailTextReg.clear();
                          _passwordTextReg.clear();
                          break;
                      }
                    }, text: 'SIGN IN'),
                  ],
                ),
              ),

              //this is the logo of right upper cornor
              LogoForSignPage(size: screenSize),

              const Positioned(
                top: 110,
                left: 20,
                child: CustomHeading01(
                  text: 'SIGN IN',
                ),
              ),
              // navigator to login
              Positioned(
                top: screenSize.height * 0.75,
                right: 0,
                child: SideBarContainer(
                  textData: 'Login',
                  icon: const Icon(Icons.login, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.pageKey);
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
