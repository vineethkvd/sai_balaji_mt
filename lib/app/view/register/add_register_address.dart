import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/common.dart';
import '../../common/colors.dart';
import '../../controller/auth.dart';

const kGoogleApiKey = 'AIzaSyC0q0wLhTHPjGaNAF6qvtRMNHIb0ETRmS0';

class AddRegisterAddress extends StatefulWidget {
  const AddRegisterAddress({super.key});

  @override
  State<AddRegisterAddress> createState() => _AddRegisterAddressState();
}

AuthCon auth = Get.put(AuthCon());

class _AddRegisterAddressState extends State<AddRegisterAddress> {
  @override
  void initState() {
    // _cnt = SingleValueDropDownController();
    // _cnt1 = SingleValueDropDownController();
    // _cnt2 = SingleValueDropDownController();
    call();
    super.initState();
  }

  call() async {
    await auth.countryapi();
    setState(() {});
  }

  @override
  void dispose() {
    auth.cnt.dispose();
    auth.cnt1.dispose();
    auth.cnt2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.secondarycolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: kcolor1),
          backgroundColor: AppColor.secondarycolor,
          title: Center(
            child: Text(
              ' Register Address',
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 20.sp,
                fontFamily: "poppinsbold",
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: auth.flatnocon,
                    decoration: InputDecoration(
                        hintText: 'Enter Flat No/House No',
                        labelText: 'Flat No/House No',
                        labelStyle: const TextStyle(color: Colors.black),
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
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: auth.towncon,
                    decoration: InputDecoration(
                        hintText: 'Enter Town/Block',
                        labelText: 'Town/Block ',
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
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: auth.areacon,
                    decoration: InputDecoration(
                        hintText: 'Enter Society/Area',
                        labelText: 'Society/Area ',
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
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
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
                        controller: auth.cnt,
                        clearOption: true,
                        //keyboardType: TextInputType.none,
                        enableSearch: true,
                        clearIconProperty:
                            IconProperty(color: Colors.green, size: 20),
                        dropDownItemCount: 6,
                        dropdownColor: Colors.white,
                        dropDownIconProperty: IconProperty(color: Colors.black),
                        textStyle: TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (val) async {
                          // auth.countrylist.clear();
                          await auth
                              .stateapi(auth.cnt.dropDownValue?.value ?? '');
                          setState(() {});
                        },
                        dropDownList: auth.countrylist,
                      ),
                    ),
                  ),
                ),
                kbox10,
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
                        controller: auth.cnt1,
                        clearOption: true,
                        //keyboardType: TextInputType.none,
                        enableSearch: true,
                        clearIconProperty:
                            IconProperty(color: Colors.green, size: 20),
                        dropDownItemCount: 6,
                        dropdownColor: Colors.white,
                        dropDownIconProperty: IconProperty(color: Colors.black),
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (val) async {
                          // auth.statelist.clear();
                          await auth
                              .cityapi(auth.cnt1.dropDownValue?.value ?? '');
                          setState(() {});
                        },
                        dropDownList: auth.statelist,
                      ),
                    ),
                  ),
                ),
                kbox10,
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
                        controller: auth.cnt2,
                        clearOption: true,
                        //keyboardType: TextInputType.none,
                        enableSearch: true,
                        clearIconProperty:
                            IconProperty(color: Colors.green, size: 20),
                        dropDownItemCount: 6,
                        dropdownColor: Colors.white,
                        dropDownIconProperty: IconProperty(color: Colors.black),
                        textStyle: TextStyle(fontSize: 16, color: Colors.black),
                        onChanged: (val) async {
                          // print(
                          //     'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq' +
                          //         val);
                          // auth.citylist.clear();
                          await auth
                              .cityapi(auth.cnt1.dropDownValue?.value ?? '');

                          setState(() {});
                        },
                        dropDownList: auth.citylist,
                      ),
                    ),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: auth.pincodecon,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Pincode',
                        labelText: 'Pincode ',
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
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: auth.landmarkcon,
                    decoration: InputDecoration(
                        hintText: 'Enter Landmark',
                        labelText: 'Landmark ',
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
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: ElevatedButton(
                      onPressed: (() {
                        // if (auth.val == 0) {
                        //   if (auth.nameCon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the name');
                        //   } else if (auth.mailCon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the email');
                        //   } else if (auth.mobilecon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the mobile number');
                        //   } else if (auth.flatnocon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the Flat Number');
                        //   } else if (auth.towncon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the Town');
                        //   } else if (auth.areacon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the Area');
                        //   } else if (_cnt2.dropDownValue!.value == null) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the district');
                        //   } else if (_cnt1.dropDownValue!.value == null) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the state');
                        //   } else if (auth.pincodecon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the pin code');
                        //   } else if (auth.pincodecon.text.length < 6) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the pincode correctly');
                        //   } else if (auth.landmarkcon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the landmark');
                        //   } else if (_cnt.dropDownValue!.value == null) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the country');
                        //   } else {
                        //     auth.registercall(
                        //         _cnt.dropDownValue?.name ?? '',
                        //         _cnt1.dropDownValue?.name,
                        //         _cnt2.dropDownValue?.name);
                        //   }
                        // } else {
                        //   if (auth.nameCon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the name');
                        //   } else if (auth.mailCon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the email');
                        //   } else if (auth.mailCon.text.isEmpty) {
                        //     Fluttertoast.showToast(
                        //         msg: 'Please enter the mbile number');
                        //   } else
                        if (auth.flatnocon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the Flat Number');
                        } else if (auth.towncon.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please enter the Town');
                        } else if (auth.areacon.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'Please enter the Area');
                        } else if (auth.pincodecon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the pin code');
                        } else if (auth.landmarkcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the landmark');
                        } else if (auth.cnt.dropDownValue?.value == null) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the country');
                        } else if (auth.cnt1.dropDownValue?.value == null) {
                          Fluttertoast.showToast(msg: 'Please enter the state');
                        } else if (auth.cnt2.dropDownValue?.value == null) {
                          Fluttertoast.showToast(msg: 'Please enter the city');
                        } else {
                          auth.registercall(
                              // auth.cnt.dropDownValue?.name ?? '',
                              // auth.cnt1.dropDownValue?.name,
                              // auth.cnt2.dropDownValue?.name
                              );
                        }
                        // }

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginScreen()));
                      }),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
