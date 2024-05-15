import 'package:ca/components/rounded_button.dart';
import 'package:ca/core/router/routers.dart';
import 'package:ca/theme/daytheme.dart';
import 'package:ca/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart';
import '../components/content_model.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final int pageLength = 3;

  int currentIndexPage = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    const SizedBox(height: 194.0),
                    Expanded(
                      child: Image.asset(
                        contents[i].image,
                        // contents[i].image ?? "",
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      contents[i].title,
                      style: kOnboardingScreenTextColor(context),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      // height: 72.0,
                      child: Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          contents[i].description,
                          style: kDescriptionColor(context),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ), 
          ),
          DotsIndicator(
            decorator: const DotsDecorator(
              color: AppColors.mutedTextColor, // Inactive color
              activeColor: AppColors.textColor,
            ),
            dotsCount: pageLength,
            position: currentIndexPage,
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                RoundedButton(
                  colour: const Color.fromRGBO(16, 13, 64, 1), 
                  onPressed: (){
                    // Navigator.pushNamed(context, OnboardingScreen2.id);
                    if(currentIndexPage == contents.length-1){
                      context.go('/${Routers.signIn}');
                      // Navigator.of(context).pushNamed("signup_screen");
                    }
                    _controller.nextPage(
                      duration:const Duration(milliseconds: 100),
                      curve: Curves.bounceIn
                    );
                  }, 
                  title: 'Next Step',
                  textColor:const Color.fromRGBO(255, 255, 255, 1),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/${Routers.signIn}');
                  },
                  child:const Text(
                    "Skip This Step",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
