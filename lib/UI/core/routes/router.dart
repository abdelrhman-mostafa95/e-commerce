import 'package:ecommerce_app_v2/UI/core/routes/routes.dart';
import 'package:ecommerce_app_v2/UI/product_screen/product_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/ProductsEntity.dart';
import '../../auth/log_in/login.dart';
import '../../auth/sign_up/sign_up.dart';
import '../../home_screen/home_scree.dart';
import '../../splash_screen/splash_screen.dart';

class RouterGenerator {
 static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => Login());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScree());
      case Routes.productDetailsScreen:
        final product = settings.arguments as DataProductEntity;
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product));
      default:
        return null;
    }
  }
}