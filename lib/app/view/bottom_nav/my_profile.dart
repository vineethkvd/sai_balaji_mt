
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';

import '../../common/common.dart';
import '../../controller/init.dart';
import 'bottom_main.dart';
import 'edit_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  InitCon init = Get.put(InitCon());

  callapi() async {
    await init.myprofile();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.secondarycolor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.mainColor,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () async {
                Get.back();
              },
              icon: const Icon(
              Icons.arrow_back_sharp,
                color:Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              'My Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: init.profiledata!.data == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColor.primarycolor,
                            child: Icon(
                              Icons.person,
                              size: 70,
                              color: AppColor.mainColor,
                            ),
                            radius: 60,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            init.profiledata!.data?.userUsername.toString() ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: "poppinsbold",
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "${init.profiledata!.data?.userType?.toUpperCase()} USER",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: "poppinssemibold",
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (init.profiledata!.data!.userType != 'retail')
                            Column(
                              children: [
                                _buildProfileDetail(
                                  label: "Restaurant Name",
                                  value:
                                      init.profiledata!.data?.restraruntName ?? '',
                                ),
                                _buildProfileDetail(
                                  label: "GST Number",
                                  value:
                                      init.profiledata!.data?.restraruntGst ?? '',
                                ),
                              ],
                            ),
                          _buildProfileDetail(
                            label: "Mobile Number",
                            value: init.profiledata!.data?.userMobileno ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Email",
                            value: init.profiledata!.data?.userEmailid ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Flat Number",
                            value: init.profiledata!.data?.userFlatNum ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Town",
                            value: init.profiledata!.data?.userTown ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Area",
                            value: init.profiledata!.data?.userArea ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Country",
                            value: init.profiledata!.data?.userCountry ?? '',
                          ),
                          _buildProfileDetail(
                            label: "State",
                            value: init.profiledata!.data?.userState ?? '',
                          ),
                          _buildProfileDetail(
                            label: "City",
                            value: init.profiledata!.data?.userDistrict ?? '',
                          ),
                          _buildProfileDetail(
                            label: "Landmark",
                            value: init.profiledata!.data?.userLandMark ?? '',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(EditProfile());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColor.mainColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 48),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildProfileDetail({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColor.txtColorMain,
                fontFamily: "poppinsRegular",
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.mainColor,
            fontFamily: "poppinsSemiBold",
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}

//old code 
/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';

import '../../common/common.dart';
import '../../controller/init.dart';
import 'bottom_main.dart';
import 'edit_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  InitCon init = Get.put(InitCon());
  callapi() async {
    await init.myprofile();
    setState(() {});
  }

  @override
  initState() {
    callapi();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondarycolor,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColor.secondarycolor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () async {
              // await init.checkout();
              Get.to(Bottomsheet());
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.mainColor,
            )),
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: init.profiledata!.data == null
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColor.primarycolor,
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: AppColor.mainColor,
                        ),
                        radius: 60,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        init.profiledata!.data?.userUsername.toString() ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: "poppinsbold",
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${init.profiledata!.data?.userType?.toUpperCase()}" +
                            "USER",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: "poppinssemibold",
                        ),
                      ),
                      init.profiledata!.data!.userType == 'retail'
                          ? const SizedBox()
                          : Column(
                              children: [
                                _buildProfileDetail(
                                    label: "",
                                    value: init.profiledata!.data
                                            ?.restraruntName ??
                                        "")
                              ],
                            )

                      /*Column(
                            children: [
                              init.profiledata!.data!.userType == 'retail'
                                  ? SizedBox()
                                  : Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            init.profiledata!.data
                                                    ?.restraruntName ??
                                                '',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            init.profiledata!.data?.restraruntGst
                                                    .toString() ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ],
                                    ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 18.0, left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Mobile Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Email',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Flat Number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Town',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Area',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Country',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('State',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('City',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Landmark',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 18.0, left: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          ':',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 18.0, left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            init.profiledata!.data?.userMobileno ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userEmailid ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userFlatNum ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(init.profiledata!.data?.userTown ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(init.profiledata!.data?.userArea ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userCountry ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userState ?? "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userDistrict ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                            init.profiledata!.data?.userLandMark ??
                                                '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 18)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(EditProfile());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kcolor1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 48.0, right: 48, top: 10, bottom: 10),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )*/
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildProfileDetail({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColor.txtColorMain,
                fontFamily: "poppinsRegular",
              ),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColor.txtColorMain,
            fontFamily: "poppinsSemiBold",
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColor.secondarycolor,
        ),
      ],
    );
  }
}*/
