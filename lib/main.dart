import 'package:codepur_catalog_app_30days/core/store.dart';
import 'package:codepur_catalog_app_30days/pages/cart_page.dart';
import 'package:codepur_catalog_app_30days/pages/home_page.dart';
import 'package:codepur_catalog_app_30days/pages/login_page.dart';
import 'package:codepur_catalog_app_30days/utils/routes.dart';
import 'package:codepur_catalog_app_30days/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: ((context) => const LoginPage()),
        MyRoutes.homeRoute: ((context) => const HomePage()),
        MyRoutes.cartRoute: ((context) => const CartPage()),
      },
    );
  }
}
