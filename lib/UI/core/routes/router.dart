import 'package:flutter/material.dart';

import '../../auth/log_in/login.dart';
import '../../auth/sign_up/sign_up.dart';
import '../../home_screen/home_scree.dart';
import '../../splash_screen/splash_screen.dart';

class RouterGenerator {
 static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScree());
      default:
        return null;
    }
  }
}