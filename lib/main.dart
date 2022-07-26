import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sales_app/screens/home_screens/product_screen.dart';
import 'package:sales_app/screens/login_screens/login_screen.dart';
import 'package:sales_app/screens/login_screens/registration_screen.dart';
import 'package:sales_app/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegistrationScreen.pageKey: (context) => const RegistrationScreen(),
        LoginScreen.pageKey: (context) => const LoginScreen(),
        ProductPage.pageKey: (context) =>  ProductPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
