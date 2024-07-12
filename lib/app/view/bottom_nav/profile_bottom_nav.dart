import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/common/colors.dart';
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
  const ProfileBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCon auth = Get.put(AuthCon());
    InitCon init = Get.put(InitCon());

    return Scaffold(
      backgroundColor: AppColor.secondarycolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "poppinsSemiBold"
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            InkWell(
              onTap: () {
                Get.to(MyProfile());
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: AppColor.mainColor),
                    SizedBox(width: 16.w),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: AppColor.mainColor,
                          fontSize: 16.sp,
                          fontFamily: "poppinsRegular"
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: AppColor.mainColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // My Orders section
            InkWell(
              onTap: () async {
                await init.myorders();
                Get.to(MyOrder());
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag, color: AppColor.mainColor),
                    SizedBox(width: 16.w),
                    Text(
                      'My Orders',
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 16.sp,
                          fontFamily: "poppinsRegular"
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: AppColor.mainColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Legal Information section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Legal Information',
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 16.sp,
                      fontFamily: "poppinsSemiBold"
                  ),
                ),
                SizedBox(height: 8.h),

                // Terms and Conditions
                _buildLegalItem(
                  Icons.description,
                  'Terms and Conditions',
                      () {
                    Get.to(Info());
                  },
                ),
                SizedBox(height: 8.h),

                // Privacy Policy
                _buildLegalItem(
                  Icons.privacy_tip_outlined,
                  'Privacy Policy',
                      () {
                    Get.to(Policy());
                  },
                ),
                SizedBox(height: 8.h),

                // About Us
                _buildLegalItem(
                  Icons.info_outline,
                  'About Us',
                      () {
                    Get.to(aboutus());
                  },
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Logout button
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          auth.controltime = false;
                          GetStorage().erase();
                          Get.offAll(LoginScreen());
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: AppColor.mainColor),
                    SizedBox(width: 16.w),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 16.sp,
                          fontFamily: "poppinsRegular"
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: AppColor.mainColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColor.mainColor),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 16.sp,
                  fontFamily: "poppinsRegular"
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: AppColor.mainColor),
          ],
        ),
      ),
    );
  }
}
