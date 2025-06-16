import 'package:flutter/material.dart';
import 'package:homecleaning/Go_Router/app_go_router.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: tertiaryColor,
        fontFamily: 'Inter',
        appBarTheme: AppBarTheme(
          color: tertiaryColor,

          centerTitle: true,

          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      routerConfig: AppGoRouter.router,
    );
  }
}