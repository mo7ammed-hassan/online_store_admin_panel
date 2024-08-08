import 'package:ecommerce_app_admin_panel/core/utils/constants/constants.dart';
import 'package:ecommerce_app_admin_panel/core/utils/routers/app_router.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ECommerce Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        canvasColor: secondaryColor,
      ),
      routerConfig: router,
    );
  }
}
