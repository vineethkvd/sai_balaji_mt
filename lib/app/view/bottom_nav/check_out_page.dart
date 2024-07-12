import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purie_ui/app/controller/init.dart';
import 'package:purie_ui/app/view/bottom_nav/checkout_address.dart';
import 'package:purie_ui/app/view/bottom_nav/choose_delivery_address.dart';

import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/registration_controller.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final InitCon initCon = Get.put(InitCon());
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.mainColor,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: AppColor.secondarycolor,
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
              'Checkout Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffc9f8dc),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(children: [
                      Text(
                        'Enter Delivery Location Pincode',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "poppinssemibold",
                        ),
                      ),
                      SizedBox(height: 6),
                      _customTextField(
                        labelTxt: "Enter pincode",
                        hintTxt: "Enter pincode",
                        controller: initCon.chkPinCode,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 5.0,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await initCon.chkAvailPinCode().then((_) {
                                  bool isAvailable =
                                  initCon.isPinCodeAvailable(
                                      initCon.chkPinCode.text);
                                  if (isAvailable == true) {
                                    registrationController
                                        .fetchDeliveryAddress()
                                        .then((_) {
                                      bool addressFound = false;
                                      for (var value in registrationController
                                          .allDeliveryAddressModel
                                          .value
                                          .addresses!) {
                                        if (value.pincode ==
                                            initCon.chkPinCode.text) {
                                          addressFound = true;
                                          Get.to(
                                              ChooseDeliveryAddress(
                                                  pinCode: initCon
                                                      .chkPinCode.text),
                                              transition: Transition.native);
                                          Fluttertoast.showToast(
                                              msg: "Choose delivery address");
                                          break;
                                        }
                                      }
                                      if (!addressFound) {
                                        Fluttertoast.showToast(
                                            msg: "Add new address");
                                        Get.to(
                                            CheckoutAddressPage(
                                                pinCode:
                                                initCon.chkPinCode.text),
                                            transition: Transition.cupertino);
                                      }else {
                                        Fluttertoast.showToast(
                                            msg:
                                            'Delivery is not available for this place');
                                      }
                                    });
                                  }
                                 if (registrationController
                                          .allDeliveryAddressModel
                                          .value
                                          .status ==
                                      false) {
                                    if (registrationController
                                            .allDeliveryAddressModel
                                            .value
                                            .msg ==
                                        "No addresses found") {
                                      Get.to(
                                        CheckoutAddressPage(
                                            pinCode: initCon.chkPinCode.text),
                                        transition: Transition.native,
                                      );
                                    }
                                  }
                                });
                              },
                              child: Container(
                                width: 130,
                                height: 40,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Check Availabilty',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontFamily: "poppinsRegular",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ]),
          ),
        )));
  }

  Widget _customTextField({
    required String labelTxt,
    required String hintTxt,
    required TextEditingController? controller,
    required TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool obscureText = false,
    IconButton? suffixIcon,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: const Color(0xfff5f5f5),
          suffixIcon: suffixIcon,
          hintText: hintTxt,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontFamily: "poppinsRegular",
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.fromLTRB(15.0, 15, 0, 15),
          labelText: labelTxt,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "poppinsRegular",
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xffd9d9d9)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xffd9d9d9)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
