import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purie_ui/app/view/bottom_nav/check_payment_page.dart';
import 'package:purie_ui/app/view/bottom_nav/payonline_page.dart';
import 'dart:io';
import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/registration_controller.dart';
import '../../model/address_model.dart';
import '../login/login_screen.dart';

class PaymentOptionsPage extends StatefulWidget {
  const PaymentOptionsPage({super.key});

  @override
  State<PaymentOptionsPage> createState() =>
      _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  final RegistrationController registrationController =
  Get.put(RegistrationController());
  AddressModel? addressModel;
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
              'Payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            height: Get.height,
            width: Get.width,
            color: AppColor.secondarycolor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
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
                                Get.to(const PayOnlinePage(),transition: Transition.native);
                              },
                              child: Container(
                                width: Get.width,
                                height: 40,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:  const Text(
                                    'Pay Online',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "poppinsRegular",
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
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
                                Get.to(CheckPaymentPage(),transition: Transition.native);
                              },
                              child: Container(
                                width: Get.width,
                                height: 40,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:const Text(
                                    'Check Payment',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "poppinsRegular",
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
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
                                // Get.to(CashonDeliveryPage(),transition: Transition.native);
                              },
                              child: Container(
                                width: Get.width,
                                height: 40,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: const Text(
                                    'Cash on delivery',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "poppinsRegular",
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
                  ),
                ]),
          ),
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
