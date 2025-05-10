import 'package:ecommerce_app_v2/UI/core/routes/router.dart';
import 'package:ecommerce_app_v2/UI/core/routes/routes.dart';
import 'package:ecommerce_app_v2/UI/core/theme/theme.dart';
import 'package:ecommerce_app_v2/UI/tabs/product-tab/cubit/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'UI/core/bloc_observer.dart';
import 'UI/core/favorite_provider.dart';
import 'di/di.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MultiProvider(
      providers: [BlocProvider(create: (context) => getIt<ProductViewModel>()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthUserProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.myTheme,
          onGenerateRoute: RouterGenerator.generateRoute,
          initialRoute: Routes.signUp,
        );
      }
    );
  }
  }