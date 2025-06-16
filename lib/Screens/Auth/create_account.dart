import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/text_form_field.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  bool obscureText = true;
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Text(
                    textAlign: TextAlign.center,
                    "Fill your information below or register\nwith your social account.",
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  AppTextFormField(
                    controller: textEditingControllerName,

                    hint: 'Enter your full name',
                    required: true,
                    minLength: 3,
                    maxLength: 50,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    suffixIcon: const Icon(null),
                    validator: (value) {
                      if (value != null && value.contains(RegExp(r'[0-9]'))) {
                        return 'Name cannot contain numbers';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  AppTextFormField(
                    controller: textEditingControllerEmail,

                    hint: 'example@gmail.com',
                    required: true,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    validator: (v) {
                      // extra rule (simple pattern)
                      if (v != null && !RegExp(r'.+@.+\..+').hasMatch(v)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  AppTextFormField(
                    controller: textEditingControllerPassword,

                    hint: '********',
                    required: true,
                    minLength: 6,
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox,
                        onChanged: (value) {
                          setState(() {
                            checkbox = value!;
                          });
                        },

                        activeColor: checkbox ? primaryColor : secondaryColor,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Agree with  ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "Terms & Condition",
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(onTap: () {
                   Get.toNamed('/completeProfile');
              },
                child: AppButton(title: 'Sign Up')),

              Row(
                children: [
                  Expanded(child: Divider()),
                  const SizedBox(width: 10),
                  Text(
                    'Or sign up with',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/apple.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/google.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: secondaryColor),
                      ),

                      width: 60,
                      height: 60,
                      child: Image.asset('icons/facebook.png'),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/signIn');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already  have an account? ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
