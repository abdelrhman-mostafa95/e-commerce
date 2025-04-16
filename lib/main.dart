import 'package:ecommerce_app_v2/UI/auth/sign_up/sign_up.dart';
import 'package:ecommerce_app_v2/UI/core/routes/router.dart';
import 'package:ecommerce_app_v2/UI/core/theme/theme.dart';
import 'package:ecommerce_app_v2/UI/home_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/auth/log_in/login.dart';
import 'UI/core/bloc_observer.dart';
import 'UI/splash_screen/splash_screen.dart';
import 'di/di.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.myTheme,
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: 'splash',
      // routes: {
      //   SplashScreen.routeName :(_) => SplashScreen(),
      //   Login.routeName :(_) => Login(),
      //   SignUp.routeName :(_) => SignUp(),
      //   HomeScree.routeName :(_) => HomeScree()
      // },
      // initialRoute: SplashScreen.routeName,
    );
  }
}
