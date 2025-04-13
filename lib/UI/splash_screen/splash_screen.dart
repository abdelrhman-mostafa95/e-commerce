import 'package:ecommerce_app_v2/UI/auth/log_in/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
       Navigator.pushReplacementNamed(context, Login.routeName);
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFF004182),
        body: Image.asset(
      'assets/images/splash_scree_2x.jpg',
      fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
    ));
  }
}
