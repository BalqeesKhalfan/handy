import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:homecleaning/Screens/Auth/complete_your_profile.dart';
import 'package:homecleaning/Screens/Auth/create_account.dart';
import 'package:homecleaning/Screens/Auth/new_password.dart';
import 'package:homecleaning/Screens/Auth/sign_in.dart';
import 'package:homecleaning/Screens/Auth/verify_code.dart';
import 'package:homecleaning/Screens/Launch/on_boarding.dart';
import 'package:homecleaning/Screens/Launch/splash.dart' show Splash;
import 'package:homecleaning/Screens/Launch/start_app.dart';
import 'package:homecleaning/Screens/Launch/welcome.dart';
import 'package:homecleaning/Screens/Location/enter_your_location.dart';
import 'package:homecleaning/Screens/Location/location_access.dart';
import 'package:homecleaning/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

      getPages: [
        //Launch
        GetPage(name: '/splash', page: () => Splash()),
        GetPage(name: '/welcome', page: () => Welcome()),
        GetPage(name: '/onboarding', page: () => Onboarding()),
        GetPage(name: '/start', page: () => StartApp()),

        //Auth
        GetPage(name: '/signIn', page: () => SignIn()),
        GetPage(name: '/signUp', page: () => CreateAccount()),
        GetPage(name: '/newPassword', page: () => NewPassword()),
        GetPage(name: '/verifyCode', page: () => VerifyCode()),
        GetPage(name: '/completeProfile', page: () => CompleteYourProfile()),

        //Location
        GetPage(name: '/locationAccess', page: () => LocationAccess()),
        GetPage(name: '/enterLocation', page: () => EnterYourLocation()),
      ],


      initialRoute:'/splash' ,
    );
  }
}
