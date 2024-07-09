import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/register/distributor_registration.dart';
import '../../common/colors.dart';
import '../../controller/auth.dart';
import 'add_register_address.dart';

// bool value = false;
// int val = -1;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthCon auth = Get.put(AuthCon());
  bool _validateEmail(email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(auth.mailCon.text);
  }

  @override
  Widget build(BuildContext context) {
    var selectGender = "Male";
    String? selecttype;

    return Container(
      color: AppColor.secondarycolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.secondarycolor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: Get.width,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                              ),
                            )),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                Get.to(const DistributorRegistrationPage(),
                                    transition: Transition.cupertino);
                              },
                              child: Material(
                                color: Colors.black54,
                                elevation: 5, // Adjust the elevation as needed
                                borderRadius: BorderRadius.circular(15),
                                child: Ink(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black54,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Distributor',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: "poppinsSemibold",
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.arrow_circle_right,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  kbox60,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Signup',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 20.sp,
                        fontFamily: "poppinsbold",
                      ),
                    ),
                  ),
                  kbox20,
                  Text(
                    'Get start to acess the products.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "poppinsregular",
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextField(
                      controller: auth.nameCon,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Enter Name',
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: auth.mailCon,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (s) {
                      //   String pattern =
                      //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      //   RegExp regex = RegExp(pattern);
                      //   if (s!.isEmpty) {
                      //     return '* E-Mail is mandatory field';
                      //   } else if (!regex.hasMatch(s) && s != null)
                      //     return 'Enter Valid Email';
                      //   else
                      //     return null;
                      // },
                      validator: (value) =>
                          EmailValidator.validate(auth.mailCon.text)
                              ? null
                              : "Please enter a valid email",
                      decoration: InputDecoration(
                          hintText: 'Enter Mail ID',
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
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
                          labelStyle: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Text("Retail"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 0,
                                groupValue: auth.val,
                                onChanged: (value) {
                                  setState(() {
                                    auth.val = value!;
                                    print('object' + auth.val.toString());
                                    auth.selectedtype = 'retail';
                                    print(auth.selectedtype);
                                  });
                                },
                                activeColor: AppColor.mainColor,
                              ),
                            ),
                          ),
                          Container(
                            width: 160,
                            // color: Colors.amber,
                            child: ListTile(
                              title: Text("Distributor"),
                              horizontalTitleGap: -10,
                              leading: Radio(
                                value: 1,
                                groupValue: auth.val,
                                onChanged: (value) {
                                  setState(() {
                                    auth.val = value!;
                                    print('object' + auth.val.toString());
                                    auth.selectedtype = 'Distributors';
                                    print(auth.selectedtype);
                                  });
                                },
                                activeColor: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  //
                  //
                  //
                  kbox20,
                  auth.val == 1
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: TextFormField(
                                controller: auth.restaurntnamecon,
                                decoration: InputDecoration(
                                    hintText: 'Restraunt Name ',
                                    labelText: 'Restraunt Name',
                                    labelStyle: TextStyle(color: Colors.black),
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
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            kbox10,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, right: 40, bottom: 20),
                              child: TextFormField(
                                controller: auth.restaurntgstcon,
                                decoration: InputDecoration(
                                    hintText: 'Restraunt GST Number ',
                                    labelText: 'Restraunt GST Number ',
                                    labelStyle: TextStyle(color: Colors.black),
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
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  auth.val == 0 || auth.val == 1
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: () {
                              if (auth.val == 1) {
                                if (auth.nameCon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the name');
                                } else if (auth.mailCon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the email');
                                } else if (auth.mobilecon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the mobile number');
                                } else if (auth.mobilecon.text.length < 10) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please enter the correct mobile number');
                                } else if (auth.restaurntnamecon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the restraunt name ');
                                } else if (auth.restaurntgstcon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please enter the restraunt Gst Number ');
                                } else {
                                  if (_validateEmail(auth.mailCon.text)) {
                                    Get.to(AddRegisterAddress());
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter Valid Email Address");
                                  }
                                }
                              } else {
                                if (auth.nameCon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the name');
                                } else if (auth.mailCon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the email');
                                } else if (auth.mobilecon.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please enter the mobile number');
                                } else if (auth.mobilecon.text.length < 10) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please enter the correct mobile number');
                                } else {
                                  if (_validateEmail(auth.mailCon.text)) {
                                    // Get.to(AddRegisterAddress());
                                    auth.registercall();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please Enter Valid Email Address");
                                  }
                                }
                              }
                            },
                            child: Container(
                              height: 50.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    'submit',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "poppinssemiregular",
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 4,
                  //   child: ElevatedButton(
                  //       onPressed: (() {
                  //         if (val == 0) {
                  //           if (auth.nameCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the name');
                  //           } else if (auth.mailCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the email');
                  //           } else if (auth.mailCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the mobile number');
                  //           } else {
                  //             auth.registercall();
                  //           }
                  //         } else {
                  //           if (auth.nameCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the name');
                  //           } else if (auth.mailCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the email');
                  //           } else if (auth.mailCon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the mbile number');
                  //           } else if (auth.restaurntnamecon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the restraunt name ');
                  //           } else if (auth.restaurntaddresscon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the restraunt address ');
                  //           } else if (auth.restaurntgstcon.text.isEmpty) {
                  //             Fluttertoast.showToast(
                  //                 msg: 'Please enter the restraunt Gst Number ');
                  //           }
                  //         }
                  //         // Navigator.pushReplacement(
                  //         //     context,
                  //         //     MaterialPageRoute(
                  //         //         builder: (context) => LoginScreen()));
                  //       }),
                  //       child: Text(
                  //         'Sign Up',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: kcolor1,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //         ),
                  //       )),
                  // ),
                  // kbox10,
                  // TextButton(
                  //     onPressed: (() {
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => LoginScreen()));
                  //     }),
                  //     child: Text(
                  //       'Login',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: kcolor1,
                  //           fontSize: 15),
                  //     ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
