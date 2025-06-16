import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class LeadingAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const LeadingAppBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 120,
        width: 120,
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          border: Border.all(color: quaternaryColor, width: 1),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
