import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/payment_controller.dart';
import '../../controller/registration_controller.dart';
import '../../model/address_model.dart';
import '../login/login_screen.dart';

class CheckPaymentPage extends StatefulWidget {
  final addId;
  final pincode;
  final fAmount;
  const CheckPaymentPage(
      {super.key,
      required this.addId,
      required this.pincode,
      required this.fAmount});

  @override
  State<CheckPaymentPage> createState() => _CheckPaymentPageState();
}

class _CheckPaymentPageState extends State<CheckPaymentPage> {
  final PaymentController paymentController = Get.put(PaymentController());
  void initState() {
    paymentController.payableAmount.text = widget.fAmount.toString();
    paymentController.fetchBankDetails();
    super.initState();
  }
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     registrationController.clearFields();
  //   });
  //   super.dispose();
  // }

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
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Check Payment',
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
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fill Following details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 16.sp,
                            fontFamily: "poppinsSemibold",
                          ),
                        ),
                        SizedBox(height: 12),
                        _customTextField(
                          labelTxt: "Payable Amount",
                          hintTxt: "Enter amount",
                          readOnly: true,
                          controller: paymentController.payableAmount,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 12),
                        _customTextField(
                          labelTxt: "Amount",
                          hintTxt: "Enter amount",
                          controller: paymentController.amountCheckPayment,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 12),
                        _customTextField(
                          labelTxt: "Check Number",
                          hintTxt: "Enter check number",
                          controller: paymentController.checkNumber,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Upload check image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 16.sp,
                            fontFamily: "poppinsSemibold",
                          ),
                        ),
                        SizedBox(height: 12),
                        Obx(
                          () => Center(
                            child: paymentController.imagePath.value.isEmpty
                                ? Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 100.sp,
                                              width: Get.width.sp,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      File? imageFile =
                                                          await paymentController
                                                              .pickImage(
                                                                  ImageSource
                                                                      .camera);
                                                      if (imageFile != null) {
                                                        paymentController
                                                                .imagePath
                                                                .value =
                                                            imageFile.path;
                                                      }
                                                      Navigator.pop(
                                                          context); // Close the bottom sheet after selecting image
                                                    },
                                                    icon: const Icon(
                                                      CupertinoIcons.camera,
                                                      size: 30,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  IconButton(
                                                    onPressed: () async {
                                                      File? imageFile =
                                                          await paymentController
                                                              .pickImage(
                                                                  ImageSource
                                                                      .gallery);
                                                      if (imageFile != null) {
                                                        paymentController
                                                                .imagePath
                                                                .value =
                                                            imageFile.path;
                                                      }
                                                      Navigator.pop(
                                                          context); // Close the bottom sheet after selecting image
                                                    },
                                                    icon: const Icon(
                                                      CupertinoIcons.photo,
                                                      size: 30,
                                                      color: Colors.brown,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(12.r),
                                      splashColor: Colors.grey.withOpacity(0.5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 120,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffd9d9d9),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.upload,
                                                size: 30,
                                                color: Color(0xff222222)),
                                            Text(
                                              "Upload check image",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: "poppinsRegular",
                                                color: const Color(0xff222222),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: Get.width,
                                    height: 120.sp,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: const Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: DecorationImage(
                                        image: FileImage(File(
                                            paymentController.imagePath.value)),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: 12),
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
                                      if (paymentController
                                          .amountCheckPayment.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'Please enter the amount');
                                      } else if (paymentController
                                          .checkNumber.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Please enter the correct number');
                                      } else if (paymentController
                                          .imagePath.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: 'Please select image');
                                      } else {
                                        paymentController.placeOrder(
                                            type: "Cheque",
                                            addressId: widget.addId.toString(),
                                            pinCode: widget.pincode.toString(),
                                            amount: paymentController
                                                .amountCheckPayment.text,
                                            finalAmount:
                                                widget.fAmount.toString(),
                                            chkNo: paymentController
                                                .checkNumber.text,
                                            transId: '');
                                      }
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Submit',
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
                    )
                  ]),
            ),
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
