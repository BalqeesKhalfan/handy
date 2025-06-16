import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/clip_path.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.sizeOf(context).height -
                        MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'Let’s Find the',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Professional Cleaning & Repair',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: 'Service',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    textAlign: TextAlign.center,
                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt ',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/onboarding');
                      },
                      child: AppButton(title: 'Let’s Get Started'),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.toNamed('/signIn');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff01AC66),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff01AC66),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),

                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/default.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
