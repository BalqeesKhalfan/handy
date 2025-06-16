import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homecleaning/Components/button.dart';
import 'package:homecleaning/Components/leading_app_bar.dart';
import 'package:homecleaning/Components/text_form_field.dart'
    show AppTextFormField;
import 'package:homecleaning/Theme/app_theme.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: LeadingAppBar(onPressed: () {})),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Complete Your Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    "Don’t worry, only you can see your personal\n data. No one else will be able to see it.",
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 118.44,
                    width: 118.44,
                    decoration: BoxDecoration(
                      color: quaternaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("icons/person.png"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      border: Border.all(color: tertiaryColor, width: 5),
                    ),
                    child: Icon(Icons.edit, color: tertiaryColor),
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
                    label: 'Name',
                    hint: 'Esther Howard',
                    required: true,
                    minLength: 3,
                    maxLength: 50,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    suffixIcon: const Icon(Icons.person),
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
                    "Phone Number",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: textEditingControllerPhone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }

                      final cleaned = value.trim();

                      if (!RegExp(r'^[97][0-9]{7}$').hasMatch(cleaned)) {
                        return 'Enter a valid Omani phone number (starts with 9 or 7, 8 digits)';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Phone Number",
                      prefix: const Text("+968 | "),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    dropdownColor: Color(0xffF6F6F6),
                    decoration: InputDecoration(
                      hintText: "Select",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: _selectedGender,
                    items: ['Male', 'Female']
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a gender' : null,
                  ),
                ],
              ),
              InkWell(onTap: () {
                 Get.toNamed('/start');
              },
                child: AppButton(title: 'Complete Profile')),
            ],
          ),
        ),
      ),
    );
  }
}
