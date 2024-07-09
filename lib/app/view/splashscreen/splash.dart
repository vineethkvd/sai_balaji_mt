import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/login/login_screen.dart';

import '../bottom_nav/bottom_main.dart';
import '../onboard/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var userid = GetStorage().read('UserID');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetStorage().read('UserID') == null
                  ? const LoginScreen()
                  : Bottomsheet(),
            )));*/
    Timer(const Duration(seconds: 3), () {
      var onboarding = GetStorage().read('onboarding');
      var userid = GetStorage().read('UserID');
      if (onboarding == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoarding()));
      } else if (userid == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bottomsheet()));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300.h,
              child: Image.asset("assets/images/logo.png"))
        ],
      ),
    );
  }
}
