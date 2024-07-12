import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/controller/init.dart';
import 'package:purie_ui/app/view/bottom_nav/bottom_main.dart';

import '../../controller/auth.dart';


class otpscreen extends StatefulWidget {
  const otpscreen({super.key});

  @override
  State<otpscreen> createState() => _otpscreenState();
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle:
      TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: kcolor1),
    borderRadius: BorderRadius.circular(5),
  ),
);

class _otpscreenState extends State<otpscreen> {
  @override
  Widget build(BuildContext context) {
    AuthCon auth = Get.put(AuthCon());
    InitCon init = Get.put(InitCon());
    return Scaffold(
        backgroundColor: AppColor.secondarycolor,
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 1,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.1,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  // Image.asset(
                  //   "asset/Group 739.png",
                  //   height: height / 2.90,
                  //   // width: mWidth / 1,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Enter OTP",
                        style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 18.sp,
                          fontFamily: "poppinsbold",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Text(
                          "We have sent a 6 digit OTP on",
                          style: TextStyle(
                            color: AppColor.txtColorMain,
                            fontSize: 14.sp,
                            fontFamily: "poppinsregular",
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     SizedBox(
                  //       width: mWidth / 1.2,
                  //       child: Txt(
                  //         text: "on your mobile number for verification",
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Pinput(
                        controller: auth.otpCon,
                        onCompleted: (o) {},
                        keyboardType: TextInputType.number,
                        defaultPinTheme: defaultPinTheme,
                        length: 6),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            auth.logincall();
                            // acon.login(acon.userNameCon.text);
                          },
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: "poppinssemibold",
                                color: AppColor.mainColor),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (auth.otpCon.text == auth.logindata!.otp.toString()) {
                        await init.homecall();
                        Get.offAll(Bottomsheet());
                        auth.otpCon.clear();
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please enter the correct OTP!');
                      }
                    },
                    child: Container(
                      width: 200.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: "poppinssemibold",
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 1.2,
                  //   child: ElevatedButton(
                  //     child: Text('Submit'),
                  //     onPressed: () async {
                  //       // acon.Otp(
                  //       //   acon.userNameCon.text,
                  //       //   acon.otpCon.text,
                  //       // );
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (context) => Bottomsheet()));
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
