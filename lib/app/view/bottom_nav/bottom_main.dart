import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/view/bottom_nav/cart_bottom_nav.dart';
import 'package:purie_ui/app/view/bottom_nav/notification.dart';
import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/bottom_nav/refer_bottomnav.dart';
import 'package:purie_ui/app/view/bottom_nav/shop_bottom_nav.dart';
import 'package:purie_ui/app/view/home_screen/home_screen.dart';

import '../../common/common.dart';
import '../../controller/init.dart';
import '../drawer/drawer.dart';
import '../home_screen/category_all.dart';

enum ThemeStyle {
  Light,
}

class Bottomsheet extends StatefulWidget {
  @override
  _BottomsheetState createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  int _currentIndex = 0;
  //ThemeStyle _currentStyle = ThemeStyle.NotificationBadge;
  final pages = [
    const HomeScreen(),
    CategoryAll(),
    CartBottomNav(),
    // MyNotification(),
    ProfileBottomNav()
  ];
  void onTap(int index) {
    _currentIndex = index;
    setState(() {});
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
      drawer: DrawerWidget(),
      extendBody: true,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('wakkas'),
      // ),

      body: pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    ThemeStyle.Light;
    return _buildLightDesign();
  }

  Widget _buildLightDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: AppColor.secondarycolor,
      unSelectedColor: AppColor.primarycolor,
      backgroundColor: AppColor.mainColor,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: Text(
            "Home",
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "poppinsregular",
              color: Colors.white,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          title: Text(
            "Category",
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "poppinsregular",
              color: Colors.white,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: Text(
            "Cart",
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "poppinsregular",
              color: Colors.white,
            ),
          ),
        ),
        // CustomNavigationBarItem(
        //   icon: Icon(Icons.notifications_active),
        //   title: Text(
        //     "Notification",
        //     style: TextStyle(fontSize: 10, color: Colors.white),
        //   ),
        // ),
        CustomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(
            "profile",
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "poppinsregular",
              color: Colors.white,
            ),
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
