import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/info/about_us.dart';
import 'package:purie_ui/app/view/info/shipping.dart';
import 'package:purie_ui/app/view/login/login_screen.dart';

import '../../controller/auth.dart';
import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';
import '../home_screen/category_all.dart';
import '../info/contact.dart';
import '../info/info.dart';
import '../info/privacy_policy.dart';
import '../myorder/my_order.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    InitCon init = Get.put(InitCon());
    AuthCon auth = Get.put(AuthCon());

    return Drawer(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primarycolor
        ),
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
                    width: 150,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ))),
            ListTile(
              leading: Icon(
                Icons.category,
                color: AppColor.mainColor,
              ),
              title: Text(
                'Category',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(CategoryAll(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.work_outline_sharp,
                color: AppColor.mainColor,
              ),
              title: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () async {
                await init.myorders();
                Get.back();
                Get.to(MyOrderPage(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.insert_drive_file,
                color: AppColor.mainColor,
              ),
              title: Text(
                'Terms and condition',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(Info(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_rounded,
                color: AppColor.mainColor,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(aboutus(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: AppColor.mainColor,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(Policy(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone_outlined,
                color: AppColor.mainColor,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(Contact(),
                    transition: Transition.leftToRight,
                    duration: Duration(milliseconds: 300),
                    preventDuplicates: true);
              },
            ),
            const Divider(
              thickness: 0.3,
              color: AppColor.mainColor,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: AppColor.mainColor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "poppinssemibold",
                  color: AppColor.mainColor,
                ),
              ),
              onTap: () {
                Get.back();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text("Are you sure you want to logout"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "poppinssemibold",
                                    color: AppColor.mainColor,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  auth.controltime = false;
                                  GetStorage().erase();
                                  Get.offAll(LoginScreen());
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "poppinssemibold",
                                    color: AppColor.mainColor,
                                  ),
                                )),
                          ]);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
