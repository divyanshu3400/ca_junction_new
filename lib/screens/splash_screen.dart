import 'dart:async';

import 'package:ca/core/router/routers.dart';
import 'package:ca/utility/constants.dart';
import 'package:ca/utility/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
      Timer(const Duration(seconds: 1), () {
        bool? isLoggedIn = SharedPref.getBool(iSLOGGEDIN);
        if(isLoggedIn!=null && isLoggedIn){
          context.go('/${Routers.home}');
        }
        else{
          context.pushReplacement('/${Routers.onBoarding}');
        }
    });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(16, 13, 64, 1),
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage("assets/images/Group8956.png"),
        ),
      ),
    );
  }
}
