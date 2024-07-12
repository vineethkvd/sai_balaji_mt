import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import '../../controller/init.dart';
import '../login/login_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final InitCon init = Get.put(InitCon());
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Initialize your state variables or call API if needed.
    // callapi(); // Uncomment if you need to call an API
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      backgroundColor: AppColor.secondarycolor,
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.secondarycolor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: OnBoard(
            pageController: _pageController,
            onSkip: () {
              // print('skipped');
            },
            onDone: () {
              // print('done tapped');
              GetStorage().write('onboarding', true);
              Get.to(LoginScreen());
            },
            onBoardData: onBoardData,
            titleStyles: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18.sp,
              fontFamily: "poppinssemibold",
              letterSpacing: 0.15,
            ),
            descriptionStyles: TextStyle(
              fontSize: 14.sp,
              color: AppColor.txtColorMain,
              fontFamily: "poppinsregular",
            ),
            pageIndicatorStyle: PageIndicatorStyle(
              width: 100.w,
              inactiveColor: AppColor.mainColor,
              activeColor: AppColor.mainColor,
              inactiveSize: Size(8.w, 8.h),
              activeSize: Size(12.w, 12.h),
            ),
            skipButton: TextButton(
              onPressed: () {
                GetStorage().write('onboarding', true);
                Get.to(LoginScreen());
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
            ),
            nextButton: OnBoardConsumer(
              builder: (context, ref, child) {
                final state = ref.watch(onBoardStateProvider);
                return InkWell(
                  onTap: () => _onNextTap(state),
                  child: Container(
                    width: 180.w,
                    height: 50.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.mainColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      state.isLastPage ? "Done" : "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: "poppinssemibold",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      GetStorage().write('onboarding', true);
      Get.to(LoginScreen());
    }
  }

  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "",
      description: "",
      imgUrl: "assets/images/onboard1.png",
    ),
    const OnBoardModel(
      title: "Quality, Traceability, Sustainability",
      description:
      "Welcome to our fresh seafood delivery app! We prioritize quality traceability and sustainability, ensuring every piece of seafood you receive is fresh, safe, and responsibly sourced. Our transparent supply chain allows you to trace the journey of your seafood from ocean to plate, supporting sustainable fishing practices and healthy marine ecosystems. Enjoy the finest seafood with peace of mind, knowing you're making a positive impact on our planet.",
      imgUrl: "assets/images/onboard2.png",
    ),
    const OnBoardModel(
      title: "Instant Food",
      description:
      "Fish are frozen to preserve their freshness, flavor, and nutritional value. Freezing fish halts the growth of bacteria and other microorganisms, preventing spoilage and extending the shelf life. It allows fish to be transported over long distances without losing quality, ensuring that consumers receive fresh-tasting seafood even if it’s not locally sourced. Additionally, freezing helps to maintain the texture and moisture of the fish, making it a reliable method to deliver high-quality seafood year-round.",
      imgUrl: "assets/images/onboard3.png",
    ),
  ];
}

