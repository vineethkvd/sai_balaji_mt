import 'dart:async';
import 'package:android_intent/android_intent.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:purie_ui/app/view/bottom_nav/cart_bottom_nav.dart';
import 'package:purie_ui/app/view/home_screen/home_screen.dart';
import 'package:purie_ui/app/view/splashscreen/splash.dart';
import 'app/common/common.dart';
import 'app/controller/auth.dart';
import 'app/controller/init.dart';
import 'app/controller/location_fun.dart';
import 'app/view/bottom_nav/bottom_main.dart';
import 'app/view/login/login_screen.dart';
import 'app/view/onboard/onboard_screen.dart';

InitCon init = Get.put(InitCon());
AuthCon auth = Get.put(AuthCon());

void main() async {
  await GetStorage.init();
  init.homecall();
  //auth.active();
  runApp(const MyApp());
  // bool servicestatus = await Geolocator.isLocationServiceEnabled();

  // if (servicestatus == false) {
  //   Fluttertoast.showToast(msg: 'Please enable location');
  //   final AndroidIntent intent = new AndroidIntent(
  //     action: 'android.settings.LOCATION_SOURCE_SETTINGS',
  //   );
  //   await intent.launch();
  //   locationdata().servicestatus = true;
  // }

  // locationdata().checkGps();

  //checkGps();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sea Food Express',
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: AnimatedSplashScreen(
          duration: 5000,
          splash: 'assets/images/logo.png',
          //  Image.asset(
          //   'assets/images/sailogo.jpeg',
          //   // width: 355,
          //   // height: 200,
          //   fit: BoxFit.contain,
          // ),
          splashIconSize: 1500,
          nextScreen: GetStorage().read('onboarding') == null
              ? OnBoarding()
              : GetStorage().read('UserID') == null
                  ? LoginScreen()
                  : Bottomsheet(),
          //advertise(),
          // BottomNav(),
          // MyApp(),
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.fastOutSlowIn,
          // pageTransitionType: PageTransitionType.rotate,
          backgroundColor: Colors.white),
    );
  }
}
