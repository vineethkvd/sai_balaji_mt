import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/bottom_nav/my_profile.dart';

import 'package:purie_ui/app/view/drawer/drawer.dart';
import 'package:purie_ui/app/view/edit_profile_bottomnav/change_password.dart';
import 'package:purie_ui/app/view/edit_profile_bottomnav/edit_profile.dart';
import 'package:purie_ui/app/view/edit_profile_bottomnav/my_address.dart';

import '../../controller/auth.dart';
import '../../controller/init.dart';
import '../info/about_us.dart';
import '../info/info.dart';
import '../info/privacy_policy.dart';
import '../login/login_screen.dart';
import '../myorder/my_order.dart';

class ProfileBottomNav extends StatelessWidget {
  const ProfileBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCon auth = Get.put(AuthCon());
    InitCon init = Get.put(InitCon());
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.secondarycolor,
          drawer: const Drawer(
            child: DrawerWidget(),
          ),
          // bottomNavigationBar: BottomNavBar(),
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.mainColor,
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kcolor1,
                  ),*/
                  child: Column(children: [
                    InkWell(
                      onTap: () async {
                        // await init.myorders();
                        Get.to(MyProfile());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await init.myorders();
                        Get.to(MyOrder());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_calendar_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'My Orders',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(Info());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.insert_drive_file,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Terms and conditions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(policy());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(aboutus());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.perm_device_info_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'About Us',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     Get.to(shipping());
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.local_shipping,
                    //           color: Colors.white,
                    //         ),
                    //         SizedBox(
                    //           width: 30,
                    //         ),
                    //         Text(
                    //           'Shipping Policy',
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Divider(
                    //   thickness: 1,
                    //   color: Colors.white,
                    //   indent: 10,
                    //   endIndent: 10,
                    // ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              // bool dismiss = false;
                              return AlertDialog(
                                  title:
                                      const Text("Are you sure you want to logout"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                            color: AppColor.mainColor,
                                            fontSize: 16.sp,
                                            fontFamily: "poppinssemibold",
                                          ),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          // dismiss = false;
                                          auth.controltime = false;
                                          GetStorage().erase();
                                          Get.offAll(LoginScreen());
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                            color: AppColor.mainColor,
                                            fontSize: 16.sp,
                                            fontFamily: "poppinssemibold",
                                          ),
                                        )),
                                  ]);
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.mainColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: "poppinssemibold",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ]),
          ),
          // body: Center(
          //   child: Container(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         // Image.asset('assets/images/teja.png'),
          //         // kbox20,
          //         // Text(
          //         //   'Hello, Sudip',
          //         //   style: TextStyle(
          //         //       color: kcolor1, fontWeight: FontWeight.bold, fontSize: 20),
          //         // ),
          //         // kbox20,
          //         // Container(
          //         //   alignment: AlignmentDirectional.center,
          //         //   height: MediaQuery.of(context).size.height / 23,
          //         //   width: MediaQuery.of(context).size.width / 3.6,
          //         //   color: kcolor1,
          //         //   child: Row(
          //         //     children: [
          //         //       Icon(
          //         //         Icons.edit_calendar_outlined,
          //         //         color: Colors.white,
          //         //       ),
          //         //       TextButton(
          //         //           onPressed: () {
          //         //             Navigator.push(
          //         //               context,
          //         //               MaterialPageRoute(
          //         //                   builder: (context) => EditProfile()),
          //         //             );
          //         //           },
          //         //           child: Text(
          //         //             'Edit Profile',
          //         //             style: TextStyle(color: Colors.white),
          //         //           ))
          //         //     ],
          //         //   ),
          //         // ),
          //         // kbox40,
          //         Container(
          //           width: double.maxFinite,
          //           // height: MediaQuery.of(context).size.width / 1.8,
          //           color: kcolor1.withOpacity(0.3),
          //           child: Column(
          //             children: [
          //               InkWell(
          //                 onTap: () {
          //                   Get.to(MyOrder());
          //                 },
          //                 child: ListTile(
          //                   leading: Icon(
          //                     Icons.edit_calendar_outlined,
          //                     color: kcolor1,
          //                   ),
          //                   title: Text(
          //                     '  My Order',
          //                     style: TextStyle(
          //                         color: kcolor1,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               ),
          //               Divider(
          //                 thickness: 1,
          //                 color: kcolor1,
          //               ),
          //               ListTile(
          //                 leading: Icon(
          //                   Icons.key,
          //                   color: kcolor1,
          //                 ),
          //                 title: TextButton(
          //                   onPressed: () {
          //                     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => MyAddress()),
          //                     );
          //                   },
          //                   child: Padding(
          //                     padding: const EdgeInsets.only(right: 200),
          //                     child: Text(
          //                       'Terms and condition',
          //                       style: TextStyle(
          //                           color: kcolor1,
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w600),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Divider(
          //                 thickness: 1,
          //                 color: kcolor1,
          //               ),
          //               ListTile(
          //                 leading: Icon(
          //                   Icons.key,
          //                   color: kcolor1,
          //                 ),
          //                 title: TextButton(
          //                   onPressed: () {
          //                     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => MyAddress()),
          //                     );
          //                   },
          //                   child: Text(
          //                     'Privacy Policy',
          //                     style: TextStyle(
          //                         color: kcolor1,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               ),
          //               Divider(
          //                 thickness: 1,
          //                 color: kcolor1,
          //               ),
          //               InkWell(
          //                 onTap: () {
          //                   GetStorage().remove('UserID');
          //                   Get.to(LoginScreen());
          //                   //auth.signout();
          //                 },
          //                 child: ListTile(
          //                   leading: Icon(
          //                     Icons.logout_outlined,
          //                     color: kcolor1,
          //                   ),
          //                   title: Text(
          //                     '   Logout',
          //                     style: TextStyle(
          //                         color: kcolor1,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               ),
          //               Divider(
          //                 thickness: 1,
          //                 color: kcolor1,
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
