import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  const AppButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: tertiaryColor,
              fontSize: 16,
          fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
