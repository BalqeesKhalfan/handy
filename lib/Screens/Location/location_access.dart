import 'package:flutter/material.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class LocationAccess extends StatefulWidget {
  const LocationAccess({super.key});

  @override
  State<LocationAccess> createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 118.44,
                width: 118.44,
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.location_pin, color: primaryColor, size: 40),
              ),SizedBox(height: 50,) ,
                  Column(
                children: [
                  Text(
                    "What is Your Location?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    "To Find Nearby Service Provider.",
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),SizedBox(height: 50,) ,
              AppButton(title: "Allow Location Access") ,SizedBox(height: 20,) ,
              SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: tertiaryColor,
        ),
        child: Center(
          child: Text(
            'Enter Location Manually',
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    )
            ],
          ),
        ),
      ),
    );
  }
}
