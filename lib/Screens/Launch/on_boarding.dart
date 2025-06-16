import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:homecleaning/Components/clip_path.dart';
import 'package:homecleaning/Theme/app_theme.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller1 = PageController();
  final PageController _controller2 = PageController();

  bool _isSyncing = false;

  void _syncPage(PageController target, int page) {
    if (_isSyncing) return;
    _isSyncing = true;
    target
        .animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
        .then((_) {
          _isSyncing = false;
        });
  }

  int selectedIndex = 0;
  final int _totalPages = 3;
  void _nextPage() {
    if (selectedIndex < _totalPages - 1) {
      selectedIndex++;
      _controller1.animateToPage(
        selectedIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed('/signIn');
    }
  }

  void _previousPage() {
    if (selectedIndex > 0) {
      selectedIndex--;
      _controller1.animateToPage(
        selectedIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
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
                SizedBox(
                  height: 150,
                  width: MediaQuery.sizeOf(context).width,
                  child: PageView.builder(
                    controller: _controller2,
                    onPageChanged: (value) {
                      _syncPage(_controller1, value);
                      selectedIndex = value;
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    selectedIndex == 0
                        ? SizedBox()
                        : IconButton(
                            onPressed: _previousPage,
                            icon: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primaryColor),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: primaryColor,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                      width: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedIndex == index
                                    ? primaryColor
                                    : secondaryColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: _nextPage,
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          border: Border.all(color: primaryColor),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: MediaQuery.sizeOf(context).width,
              child: PageView.builder(
                itemCount: 3,
                controller: _controller1,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                    _syncPage(_controller2, value);
                  });
                },
                itemBuilder: (context, index) {
                  print(index);
                  return ClipPath(
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
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, right: 20),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/start');
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 13.82,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
