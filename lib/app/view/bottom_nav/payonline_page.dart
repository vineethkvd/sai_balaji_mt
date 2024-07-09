import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/payment_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PayOnlinePage extends StatefulWidget {
  const PayOnlinePage({super.key});

  @override
  State<PayOnlinePage> createState() => _PayOnlinePageState();
}

class _PayOnlinePageState extends State<PayOnlinePage> {
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  void initState() {
    paymentController.fetchBankDetails();
    super.initState();
  }
  //
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
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'PayOnline',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => SizedBox(
                        width: Get.width,
                        height: 400,
                        child: CachedNetworkImage(
                          imageUrl: paymentController.bankDetailsModel.value
                                  ?.data?.first.bankDetails?.first.bankQr ??
                              '',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Center(child: Icon(Icons.error)),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Bank account details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 16.sp,
                        fontFamily: "poppinsSemibold",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                          () => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                        color: Colors.black12,
                        width: Get.width,
                        height: 200,
                        child: HtmlWidget(
                            paymentController.bankDetailsModel.value?.data?.first.bankDetails?.first.bankDetails ?? '',
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'poppinsRegular',
                              color: Colors.black,
                            ),
                        ),
                      ),
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    Column(
                      children: [
                        SizedBox(height: 12),
                        _customTextField(
                          labelTxt: "Amount",
                          hintTxt: "Enter amount",
                          controller: paymentController.amountPayOnline,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 12),
                        _customTextField(
                          labelTxt: "Transaction ID",
                          hintTxt: "Enter transaction id",
                          controller: paymentController.transactionID,
                          keyboardType: TextInputType.text,
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
                                      // Get.to(CashonDeliveryPage(),transition: Transition.native);
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
