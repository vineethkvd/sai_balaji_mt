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
import '../../controller/payment_controller.dart';
import '../../controller/registration_controller.dart';
import '../../model/address_model.dart';
import '../login/login_screen.dart';

class PaymentOptionsPage extends StatefulWidget {
  final addId;
  final pincode;
  final fAmount;
  const PaymentOptionsPage(
      {super.key,
      required this.addId,
      required this.pincode,
      required this.fAmount});

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    registrationController.fetchCartData();
    registrationController.fetchProfile();
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
              child: Obx(() => Column(
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
                                    Get.to(
                                        PayOnlinePage(
                                          addId: widget.addId,
                                          pincode: widget.pincode,
                                          fAmount: widget.fAmount,
                                        ),
                                        transition: Transition.native);
                                  },
                                  child: Container(
                                    width: Get.width,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
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
                      registrationController
                                  .profileModel.value.data?.userType ==
                              "Distributors"
                          ? Padding(
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
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          Get.to(
                                              CheckPaymentPage(
                                                addId: widget.addId,
                                                pincode: widget.pincode,
                                                fAmount: widget.fAmount,
                                              ),
                                              transition: Transition.native);
                                        },
                                        child: Container(
                                          width: Get.width,
                                          height: 40,
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: const Text(
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
                            )
                          : const SizedBox(),
                      registrationController
                                  .profileModel.value.data?.userType ==
                              "Distributors"
                          ? const SizedBox()
                          : Padding(
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
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          paymentController.placeOrder(
                                              type: "Cash on Delivery ${registrationController
                                                  .profileModel.value.data?.userType}",
                                              addressId:
                                                  widget.addId.toString(),
                                              pinCode:
                                                  widget.pincode.toString(),
                                              amount: widget.fAmount.toString(),
                                              finalAmount:
                                                  widget.fAmount.toString(),
                                              chkNo: '', transId: '');
                                          // Get.to(CashonDeliveryPage(), transition: Transition.native);
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
                    ],
                  ))),
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
