import 'package:flutter/material.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class EnterYourLocation extends StatefulWidget {
  const EnterYourLocation({super.key});

  @override
  State<EnterYourLocation> createState() => _EnterYourLocationState();
}

class _EnterYourLocationState extends State<EnterYourLocation> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Your Location"),
        leading: IconButton(
          onPressed: () {},
          icon: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: secondaryColor),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_outlined),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  hint: Text('Golden Avenue'.toUpperCase()),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.cancel_outlined, color: primaryColor),
                  prefixIcon: Icon(Icons.search, color: secondaryColor),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.near_me_rounded , color: primaryColor,),
                title: Text(
                  "Use my current location ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text(
                "Search Result".toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                         leading: Icon(Icons.near_me_rounded , color: primaryColor,),
                      title: Text(
                        "Golden Avenue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('8502 Preston Rd. Ingl..'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
