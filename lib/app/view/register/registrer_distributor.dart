/*import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:purie_ui/app/common/common.dart';
import '../../common/colors.dart';
import '../../controller/auth.dart';
import 'add_register_address.dart';

// bool value = false;
// int val = -1;

class registerDistributorPage extends StatefulWidget {
  const registerDistributorPage({super.key});

  @override
  State<registerDistributorPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<registerDistributorPage> {
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondarycolor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kbox60,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Signup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 22.sp,
                      fontFamily: "poppinsbold",
                    ),
                  ),
                ),
                kbox20,
                Text(
                  'Get start to acess the products.',
                  style: TextStyle(
                    color: kcolor1,
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
                    style: const TextStyle(color: Colors.black),
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
                    style: const TextStyle(color: Colors.black),
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
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: TextFormField(
                    controller: auth.restaurntgstcon,
                    decoration: InputDecoration(
                        hintText: 'Distributor GST Number ',
                        labelText: 'Distributor GST Number ',
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
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: auth.restaurntnamecon,
                    decoration: InputDecoration(
                        hintText: 'Distributor Name ',
                        labelText: 'Distributor Name',
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
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                _buildFilePicker(
                  auth.kycDoc,
                  'Choose File',
                  (file) {
                    auth.kycDoc.value = file;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
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
                                      msg: "Please Enter Valid Email Address");
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
                                      msg: "Please Enter Valid Email Address");
                                }
                              }
                            }
                          },
                          child: Container(
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "submit",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "poppinssemiregular",
                                    color: Colors.white),
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
    );
  }

  Widget _buildFilePicker(
    Rx<PlatformFile?> file,
    String hintText,
    Function(PlatformFile) onPicked,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        // Request storage permission
        PermissionStatus status = await Permission.storage.status;
        if (status.isDenied || status.isRestricted) {
          if (await Permission.storage.request().isGranted) {
            pickFile(file, onPicked);
          } else {
            showPermissionDeniedSnackbar();
          }
        } else {
          pickFile(file, onPicked);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50.h,
          width: double.infinity,
          child: Center(
            child: Obx(() {
              final currentFile = file.value;
              return currentFile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          hintText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColor.secondarycolor,
                            fontFamily: 'poppinsSemiBold',
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "", //path.basename(currentFile.path!),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.secondarycolor,
                        fontFamily: 'poppinsSemiBold',
                      ),
                    );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> pickFile(
      Rx<PlatformFile?> file, Function(PlatformFile) onPicked) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      onPicked(result.files.first);
      file.value = result.files.first;
    }
  }

  void showPermissionDeniedSnackbar() {
    Get.snackbar(
      'Permission Denied',
      'Storage permission is required to pick files.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }
}
*/