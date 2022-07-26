import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/controllers/auth_controller.dart';
import 'package:sales_app/screens/home_screens/product_screen.dart';
import 'package:sales_app/screens/login_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

//Auth controller
AuthController _authController = AuthController();

  // delay and move to main page
  @override
  void initState() {
    _navigateTo();
    super.initState();
  }

  // this function will tell to the void initState() {} do this thing
  void _navigateTo() {
    Future.delayed(const Duration(seconds: 4), () {
      _authController.currentUserStatus(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB19CD8),
                Color(0xFFE6D1F2),
              ],
              begin: FractionalOffset(1.0, 1.0),
              end: FractionalOffset(0.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                from: 150,
                delay: const Duration(milliseconds: 2000),
                duration: const Duration(milliseconds: 3000),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 70,
                  color: Color.fromARGB(255, 89, 83, 83),
                ),
              ),
              FadeInDown(
                from: 150,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 2000),
                child: const Text(
                  'Online Shop',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              FadeInUp(
                from: 150,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 2000),
                child: const Text(
                  'Good Products',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
