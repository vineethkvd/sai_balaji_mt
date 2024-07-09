import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';

import '../../common/common.dart';
import '../../controller/auth.dart';
import '../../controller/init.dart';
import 'my_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  InitCon init = Get.put(InitCon());
  late SingleValueDropDownController _cnt;
  late SingleValueDropDownController _cnt1;
  late SingleValueDropDownController _cnt2;
  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cnt1 = SingleValueDropDownController();
    _cnt2 = SingleValueDropDownController();

    call();

    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cnt1.dispose();
    _cnt2.dispose();
    super.dispose();
  }

  call() async {
    await init.myprofile();
    _cnt.dropDownValue = DropDownValueModel(
        name: init.profiledata!.data!.userCountry.toString(), value: "");
    _cnt1.dropDownValue = DropDownValueModel(
        name: init.profiledata!.data!.userState.toString(), value: "");
    _cnt2.dropDownValue = DropDownValueModel(
        name: init.profiledata!.data!.userDistrict.toString(), value: "");

    await init.countryapi();
    setState(() {});
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.mainColor,
            )),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kbox20,
            Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.editname,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Name',
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.editemail,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Email',
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.editflat,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Flat No',
                          labelText: 'Flat No',
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
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.edittown,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Town',
                          labelText: 'Town',
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
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.editarea,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Area',
                          labelText: 'Area',
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
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 60,
                      //width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: DropDownTextField(
                          textFieldDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Country'.tr,
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          controller: _cnt,
                          clearOption: true,
                          //keyboardType: TextInputType.none,
                          enableSearch: true,
                          clearIconProperty:
                              IconProperty(color: Colors.green, size: 20),
                          dropDownItemCount: 6,
                          dropdownColor: Colors.white,
                          dropDownIconProperty:
                              IconProperty(color: Colors.black),
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          onChanged: (val) async {
                            init.countrylist.clear();
                            await init
                                .stateapi(_cnt.dropDownValue?.value ?? '');
                            setState(() {});
                          },
                          dropDownList: init.countrylist,
                        ),
                      ),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 60,
                      //width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: DropDownTextField(
                          textFieldDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'State'.tr,
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          controller: _cnt1,
                          clearOption: true,
                          //keyboardType: TextInputType.none,
                          enableSearch: true,
                          clearIconProperty:
                              IconProperty(color: Colors.green, size: 20),
                          dropDownItemCount: 6,
                          dropdownColor: Colors.white,
                          dropDownIconProperty:
                              IconProperty(color: Colors.black),
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          onChanged: (val) async {
                            init.statelist.clear();
                            await init
                                .cityapi(_cnt1.dropDownValue?.value ?? '');
                            setState(() {});
                          },
                          dropDownList: init.statelist,
                        ),
                      ),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 60,
                      //width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: DropDownTextField(
                          textFieldDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'City'.tr,
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          controller: _cnt2,
                          clearOption: true,
                          //keyboardType: TextInputType.none,
                          enableSearch: true,
                          clearIconProperty:
                              IconProperty(color: Colors.green, size: 20),
                          dropDownItemCount: 6,
                          dropdownColor: Colors.white,
                          dropDownIconProperty:
                              IconProperty(color: Colors.black),
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          onChanged: (val) async {
                            init.citylist.clear();
                            //  await auth.cityapi(_cnt1.dropDownValue?.value ?? '');
                            setState(() {});
                          },
                          dropDownList: init.citylist,
                        ),
                      ),
                    ),
                  ),
                  kbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: init.editlandmark,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
                      ],
                      decoration: InputDecoration(
                          hintText: 'Land Mark',
                          labelText: 'Landmark',
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
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      if (init.editname.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Name');
                      } else if (init.editemail.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Email');
                      } else if (init.editflat.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Flat');
                      } else if (init.edittown.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Town');
                      } else if (init.editarea.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Area');
                      } else if (_cnt.dropDownValue!.value == null) {
                        Fluttertoast.showToast(msg: 'Select Country');
                      } else if (_cnt1.dropDownValue!.value == null) {
                        Fluttertoast.showToast(msg: 'Select State');
                      } else if (_cnt2.dropDownValue!.value == null) {
                        Fluttertoast.showToast(msg: 'Select City');
                      } else if (init.editlandmark.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Landmak');
                      } else {
                        if (_validateEmail(init.editemail.text)) {
                          await init.updateprofile(
                              _cnt.dropDownValue!.name,
                              _cnt1.dropDownValue!.name,
                              _cnt2.dropDownValue!.name);
                          Get.to(MyProfile());
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Enter Valid Email Address");
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.mainColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 48.0, right: 48, top: 10, bottom: 10),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(email) {
    // Regular expression pattern for email validation
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(init.editemail.text);
  }
}
