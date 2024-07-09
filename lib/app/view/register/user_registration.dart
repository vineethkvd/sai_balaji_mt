import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../common/colors.dart';
import '../../controller/registration_controller.dart';
import '../login/login_screen.dart';
import 'distributor_registration.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  void initState() {
    registrationController.chkCountryList();
    super.initState();
  }



  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController.clearFields();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondarycolor,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: AppColor.secondarycolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          borderRadius: BorderRadius.circular(15.0),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                            elevation: 5.0,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: AppColor.txtColorMain,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black12),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  Get.to(const DistributorRegistrationPage(),
                                      transition: Transition.cupertino);
                                },
                                child: Container(
                                  width: 130,
                                  height: 40,
                                  alignment: Alignment.center,
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
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'User Registration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 20.sp,
                    fontFamily: "poppinsSemibold",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: ListView(children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: _customTextField(
                                    labelTxt: "Name",
                                    hintTxt: "Enter Name",
                                    controller:
                                        registrationController.nameController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: _customTextField(
                                    labelTxt: "Email",
                                    hintTxt: "Enter Email",
                                    controller:
                                        registrationController.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            _customTextField(
                              labelTxt: "Phone",
                              hintTxt: "Enter phone number",
                              controller:
                                  registrationController.phoneController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'User Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 14.sp,
                                fontFamily: "poppinsSemibold",
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: _customTextField(
                                    labelTxt: "Flat No/House No",
                                    hintTxt: "Enter Flat No/House No",
                                    controller:
                                        registrationController.flatNoController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: _customTextField(
                                    labelTxt: "Town/Block",
                                    hintTxt: "Enter town/block",
                                    controller:
                                        registrationController.townController,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: _customTextField(
                                    labelTxt: "Society Area",
                                    hintTxt: "Enter society Area",
                                    controller: registrationController
                                        .societyAreaController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Obx(
                                        () => Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: const Color(0xffd9d9d9)),
                                      ),
                                      height: 50,
                                      child: DropdownSearch<String>(
                                        dropdownDecoratorProps: const DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "Country",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "poppinsRegular",
                                              color: Colors.black,
                                            ),
                                            contentPadding: EdgeInsets.only(left: 10),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        items: registrationController.countryList.map((country) => country.name).toList(),
                                        selectedItem: registrationController.selectedCountryName.value.isEmpty
                                            ? null
                                            : registrationController.selectedCountryName.value,
                                        dropdownBuilder: (context, selectedItem) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                selectedItem ?? "Country",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          );
                                        },
                                        onChanged: (val) {
                                          var selectedCountry = registrationController.countryList.firstWhere((country) => country.name == val);
                                          registrationController.selectedCountryId.value = selectedCountry.value;
                                          registrationController.selectedCountryName.value = selectedCountry.name;
                                          registrationController.chkStateList(countryId: registrationController.selectedCountryId.value);
                                        },
                                        popupProps: PopupProps.dialog(
                                          showSearchBox: true,
                                          searchFieldProps: TextFieldProps(
                                            decoration: InputDecoration(
                                              hintText: 'Search country',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "poppinsRegular",
                                                color: Colors.black,
                                              ),
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Obx(
                                        () => Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: const Color(0xffd9d9d9)),
                                      ),
                                      height: 50,
                                      child: DropdownSearch<String>(
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "State",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "poppinsRegular",
                                              color: Colors.black,
                                            ),
                                            contentPadding: EdgeInsets.only(left: 10),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        items: registrationController.stateList.map((state) => state.name).toList(),
                                        selectedItem: registrationController.selectedStateName.value.isEmpty
                                            ? null
                                            : registrationController.selectedStateName.value,
                                        dropdownBuilder: (context, selectedItem) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                selectedItem ?? "State",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          );
                                        },
                                        onChanged: (val) {
                                          var selectedState = registrationController.stateList.firstWhere((state) => state.name == val);
                                          registrationController.selectedStateId.value = selectedState.value;
                                          registrationController.selectedStateName.value = selectedState.name;
                                          registrationController.chkCityList(stateId: registrationController.selectedStateId.value);
                                        },
                                        popupProps: PopupProps.dialog(
                                          showSearchBox: true,
                                          searchFieldProps: TextFieldProps(
                                            decoration: InputDecoration(
                                              hintText: 'Search state',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "poppinsRegular",
                                                color: Colors.black,
                                              ),
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Obx(
                                        () => Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        border: Border.all(color: const Color(0xffd9d9d9)),
                                      ),
                                      height: 50,
                                      child: DropdownSearch<String>(
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "City",
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "poppinsRegular",
                                              color: Colors.black,
                                            ),
                                            contentPadding: EdgeInsets.only(left: 10),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        items: registrationController.cityList.map((city) => city.name).toList(),
                                        selectedItem: registrationController.selectedCityName.value.isEmpty
                                            ? null
                                            : registrationController.selectedCityName.value,
                                        dropdownBuilder: (context, selectedItem) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                selectedItem ?? "City",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          );
                                        },
                                        onChanged: (val) {
                                          var selectedCity = registrationController.cityList.firstWhere((city) => city.name == val);
                                          registrationController.selectedCityId.value = selectedCity.value;
                                          registrationController.selectedCityName.value = selectedCity.name;
                                        },
                                        popupProps: PopupProps.dialog(
                                          showSearchBox: true,
                                          searchFieldProps: TextFieldProps(
                                            decoration: InputDecoration(
                                              hintText: 'Search city',
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "poppinsRegular",
                                                color: Colors.black,
                                              ),
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 12),
                            _customTextField(
                              labelTxt: "PinCode",
                              hintTxt: "Enter PinCode",
                              controller:
                                  registrationController.pinCodeController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 12),
                            _customTextField(
                              labelTxt: "LandMark",
                              hintTxt: "Enter landmark",
                              controller:
                                  registrationController.landMarkController,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 12),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15.0),
                                  elevation: 5.0,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: AppColor.mainColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        if (registrationController
                                            .nameController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter the name');
                                        } else if (registrationController
                                            .emailController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Please enter email address');
                                        } else if (registrationController
                                            .phoneController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter phone number');
                                        } else if (registrationController
                                                .phoneController.text.length <
                                            10) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Please enter the correct mobile number');
                                        } else if (registrationController
                                            .flatNoController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter flat number');
                                        } else if (registrationController
                                            .townController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter town');
                                        } else if (registrationController
                                            .societyAreaController
                                            .text
                                            .isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter society area');
                                        } else if (registrationController
                                            .pinCodeController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter pincode');
                                        } else if (registrationController
                                            .landMarkController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'Please enter landmark');
                                        } else {
                                          registrationController
                                              .userRegistration(
                                                  userType: "retail")
                                              .then((_) {
                                            registrationController
                                                .clearFields();
                                            Get.to(const LoginScreen(),
                                                transition: Transition.native);
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 130,
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: registrationController
                                                  .loading.value
                                              ? SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        "poppinsRegular",
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                          ])
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextField({
    required String labelTxt,
    required String hintTxt,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintTxt,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "poppinsRegular",
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.fromLTRB(15.0, 10, 0, 10),
        labelText: labelTxt,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "poppinsRegular",
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xffd9d9d9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xffd9d9d9)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
