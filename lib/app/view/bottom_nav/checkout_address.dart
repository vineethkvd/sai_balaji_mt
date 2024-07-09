import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purie_ui/app/view/bottom_nav/choose_delivery_address.dart';
import 'package:purie_ui/app/view/bottom_nav/delivery_conformation.dart';
import 'dart:io';
import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/registration_controller.dart';
import '../../model/address_model.dart';
import '../login/login_screen.dart';

class CheckoutAddressPage extends StatefulWidget {
  final pinCode;
  const CheckoutAddressPage({super.key, required this.pinCode});

  @override
  State<CheckoutAddressPage> createState() => _CheckoutAddressPageState();
}

class _CheckoutAddressPageState extends State<CheckoutAddressPage> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  AddressModel? addressModel;
  @override
  void initState() {
    registrationController.pinCodeController.text = widget.pinCode;
    registrationController.chkCountryList();
    call();
    super.initState();
  }

  call() {
    registrationController.fetchProfile().then((_) {
      registrationController.nameController.text =
          registrationController.profileModel.value?.data?.userName ?? '';
      registrationController.emailController.text =
          registrationController.profileModel.value?.data?.userEmailid ?? '';
      registrationController.phoneController.text =
          registrationController.profileModel.value?.data?.userMobileno ?? '';
      registrationController.flatNoController.text =
          registrationController.profileModel.value?.data?.userFlatNum ?? '';
      registrationController.townController.text =
          registrationController.profileModel.value?.data?.userTown ?? '';
      registrationController.phoneController.text =
          registrationController.profileModel.value?.data?.userMobileno ?? '';
    });
    setState(() {});
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
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Delivery Address',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: Container(
              height: Get.height,
              width: Get.width,
              color: AppColor.secondarycolor,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: ListView(children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fill delivery address ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: 16.sp,
                                    fontFamily: "poppinsSemibold",
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: _customTextField(
                                        labelTxt: "Name",
                                        hintTxt: "Enter Name",
                                        controller: registrationController
                                            .nameController,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _customTextField(
                                        labelTxt: "Email",
                                        hintTxt: "Enter Email",
                                        controller: registrationController
                                            .emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _customTextField(
                                  labelTxt: "Phone",
                                  hintTxt: "Enter phone number",
                                  controller:
                                      registrationController.phoneController,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: _customTextField(
                                        labelTxt: "Flat No/House No",
                                        hintTxt: "Enter Flat No/House No",
                                        controller: registrationController
                                            .flatNoController,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _customTextField(
                                        labelTxt: "Town/Block",
                                        hintTxt: "Enter town/block",
                                        controller: registrationController
                                            .townController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color: const Color(0xffd9d9d9)),
                                          ),
                                          height: 50,
                                          child: DropdownSearch<String>(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                hintText: "Country",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                            items: registrationController
                                                .countryList
                                                .map((country) => country.name)
                                                .toList(),
                                            selectedItem: registrationController
                                                    .selectedCountryName
                                                    .value
                                                    .isEmpty
                                                ? null
                                                : registrationController
                                                    .selectedCountryName.value,
                                            dropdownBuilder:
                                                (context, selectedItem) {
                                              return Center(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    selectedItem ?? "Country",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "poppinsRegular",
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              );
                                            },
                                            onChanged: (val) {
                                              var selectedCountry =
                                                  registrationController
                                                      .countryList
                                                      .firstWhere((country) =>
                                                          country.name == val);
                                              registrationController
                                                      .selectedCountryId.value =
                                                  selectedCountry.value;
                                              registrationController
                                                  .selectedCountryName
                                                  .value = selectedCountry.name;
                                              registrationController
                                                  .chkStateList(
                                                      countryId:
                                                          registrationController
                                                              .selectedCountryId
                                                              .value);
                                            },
                                            popupProps: PopupProps.dialog(
                                              showSearchBox: true,
                                              searchFieldProps: TextFieldProps(
                                                decoration: InputDecoration(
                                                  hintText: 'Search country',
                                                  hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        "poppinsRegular",
                                                    color: Colors.black,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.all(8),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color: const Color(0xffd9d9d9)),
                                          ),
                                          height: 50,
                                          child: DropdownSearch<String>(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                hintText: "State",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                            items: registrationController
                                                .stateList
                                                .map((state) => state.name)
                                                .toList(),
                                            selectedItem: registrationController
                                                    .selectedStateName
                                                    .value
                                                    .isEmpty
                                                ? null
                                                : registrationController
                                                    .selectedStateName.value,
                                            dropdownBuilder:
                                                (context, selectedItem) {
                                              return Center(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    selectedItem ?? "State",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "poppinsRegular",
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              );
                                            },
                                            onChanged: (val) {
                                              var selectedState =
                                                  registrationController
                                                      .stateList
                                                      .firstWhere((state) =>
                                                          state.name == val);
                                              registrationController
                                                  .selectedStateId
                                                  .value = selectedState.value;
                                              registrationController
                                                  .selectedStateName
                                                  .value = selectedState.name;
                                              registrationController
                                                  .chkCityList(
                                                      stateId:
                                                          registrationController
                                                              .selectedStateId
                                                              .value);
                                            },
                                            popupProps: PopupProps.dialog(
                                              showSearchBox: true,
                                              searchFieldProps: TextFieldProps(
                                                decoration: InputDecoration(
                                                  hintText: 'Search state',
                                                  hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        "poppinsRegular",
                                                    color: Colors.black,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.all(8),
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
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                                color: const Color(0xffd9d9d9)),
                                          ),
                                          height: 50,
                                          child: DropdownSearch<String>(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                hintText: "City",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(left: 10),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                            items: registrationController
                                                .cityList
                                                .map((city) => city.name)
                                                .toList(),
                                            selectedItem: registrationController
                                                    .selectedCityName
                                                    .value
                                                    .isEmpty
                                                ? null
                                                : registrationController
                                                    .selectedCityName.value,
                                            dropdownBuilder:
                                                (context, selectedItem) {
                                              return Center(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    selectedItem ?? "City",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "poppinsRegular",
                                                      color: Colors.black,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              );
                                            },
                                            onChanged: (val) {
                                              var selectedCity =
                                                  registrationController
                                                      .cityList
                                                      .firstWhere((city) =>
                                                          city.name == val);
                                              registrationController
                                                  .selectedCityId
                                                  .value = selectedCity.value;
                                              registrationController
                                                  .selectedCityName
                                                  .value = selectedCity.name;
                                            },
                                            popupProps: PopupProps.dialog(
                                              showSearchBox: true,
                                              searchFieldProps: TextFieldProps(
                                                decoration: InputDecoration(
                                                  hintText: 'Search city',
                                                  hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        "poppinsRegular",
                                                    color: Colors.black,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.all(8),
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
                                  readOnly: true,
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
                                Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                          color: const Color(0xffd9d9d9)),
                                    ),
                                    height: 50,
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.white,
                                      underline: Container(),
                                      value: registrationController
                                              .selectedType.value.isEmpty
                                          ? null
                                          : registrationController
                                              .selectedType.value,
                                      hint: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Type',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontFamily: "poppinsRegular",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      isExpanded: true,
                                      iconSize: 30.0,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "poppinsRegular",
                                        color: Colors.black,
                                      ),
                                      items: registrationController.type
                                          .map((type) {
                                        return DropdownMenuItem<String>(
                                          value: type,
                                          onTap: () {
                                            registrationController.selectedType
                                                .value = type.toString();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Center(
                                              child: Text(
                                                type,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "poppinsRegular",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                    ),
                                  ),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.black12),
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
                                                  msg:
                                                      'Please enter phone number');
                                            } else if (registrationController
                                                    .phoneController
                                                    .text
                                                    .length <
                                                10) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please enter the correct mobile number');
                                            } else if (registrationController
                                                .flatNoController
                                                .text
                                                .isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please enter flat number');
                                            } else if (registrationController
                                                .townController.text.isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg: 'Please enter town');
                                            } else if (registrationController
                                                .societyAreaController
                                                .text
                                                .isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please enter society area');
                                            } else if (registrationController
                                                .pinCodeController
                                                .text
                                                .isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg: 'Please enter pincode');
                                            } else if (registrationController
                                                .landMarkController
                                                .text
                                                .isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg: 'Please enter landmark');
                                            } else if (registrationController
                                                .selectedType.isEmpty) {
                                              Fluttertoast.showToast(
                                                  msg: 'Please enter type');
                                            } else {
                                              addressModel = AddressModel(
                                                name: registrationController
                                                    .nameController.text,
                                                email: registrationController
                                                    .emailController.text,
                                                phone: registrationController
                                                    .phoneController.text,
                                                flatNo: registrationController
                                                    .flatNoController.text,
                                                town: registrationController
                                                    .townController.text,
                                                area: registrationController
                                                    .societyAreaController.text,
                                                country: registrationController
                                                    .selectedCountryName.value,
                                                state: registrationController
                                                    .selectedStateName.value,
                                                city: registrationController
                                                    .selectedCityName.value,
                                                pincode: registrationController
                                                    .pinCodeController.text,
                                                landMark: registrationController
                                                    .landMarkController.text,
                                              );
                                              var result =
                                                  addressModel?.toJson();
                                              registrationController
                                                  .addDeliveryAddress(
                                                      address: "$result",
                                                      type:
                                                          registrationController
                                                              .selectedType
                                                              .value)
                                                  .then((_) {
                                                if (registrationController
                                                        .deliveryAddressModel
                                                        ?.status ==
                                                    true) {
                                                  registrationController
                                                      .clearFields();
                                                  Get.to(
                                                       ChooseDeliveryAddress(pinCode: widget.pinCode),
                                                      transition:
                                                          Transition.native);
                                                }
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
              )),
        ),
      ),
    );
  }

  Widget _customTextField({
    required String labelTxt,
    required String hintTxt,
    bool readOnly = false,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    return TextFormField(
      readOnly: readOnly,
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
