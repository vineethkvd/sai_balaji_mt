/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/model/login.dart';
import 'package:purie_ui/app/view/register/register_page.dart';
import 'package:purie_ui/app/view/register/registrer_distributor.dart';

import '../../controller/auth.dart';

class LoginDistributor extends StatelessWidget {
  const LoginDistributor({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    AuthCon auth = Get.put(AuthCon());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondarycolor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Container(
                      width: 300.w,
                      child: Image.asset(
                        'assets/images/logo.png',
                      )),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: kcolor1),
                //       borderRadius: BorderRadius.circular(8)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(
                //       'Sai Balaji Sea Foods',
                //       style: TextStyle(
                //         fontSize: 25,
                //         color: kcolor1,
                //       ),
                //     ),
                //   ),
                // ),
                kbox60,
                Text(
                  'Login to SKIPL',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18.sp,
                    fontFamily: "poppinsbold",
                  ),
                ),
                Text(
                  'As Distributor',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18.sp,
                    fontFamily: "poppinsbold",
                  ),
                ),
                kbox20,
                Text(
                  'Get start to acess the products.',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14.sp,
                    fontFamily: "poppinsregular",
                  ),
                ),
                kbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: auth.mobilecon,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        labelText: 'Phone number',
                        labelStyle: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "poppinsregular",
                            color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: kcolor1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: AppColor.mainColor),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    cursorColor: AppColor.mainColor,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "poppinsregular",
                    ),
                  ),
                ),
                // kbox20,
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, right: 40),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       hintText: 'Enter Password',
                //       labelText: 'Password',
                //       labelStyle: TextStyle(color: Colors.black),
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide(color: kcolor1),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //     cursorColor: Colors.black,
                //     style: TextStyle(color: kcolor1),
                //   ),
                // ),
                kbox20,
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: (() {
                        if (auth.mobilecon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the phone number');
                        } else if (auth.mobilecon.text.length < 10) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the correct number');
                        } else {
                          auth.logincall();
                        }
                      }),
                      child: Text(
                        'Get OTP',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "poppinssemiregular",
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                kbox10,
                TextButton(
                    onPressed: (() {
                      Get.to(const registerDistributorPage());
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ));
                    }),
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "poppinsbold",
                        color: AppColor.mainColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/