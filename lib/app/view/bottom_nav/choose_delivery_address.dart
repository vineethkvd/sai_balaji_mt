import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/controller/init.dart';
import 'package:purie_ui/app/view/bottom_nav/checkout_address.dart';
import 'package:purie_ui/app/view/bottom_nav/delivery_conformation.dart';
import '../../common/colors.dart';
import '../../controller/registration_controller.dart';

class ChooseDeliveryAddress extends StatefulWidget {
  final String pinCode;

  const ChooseDeliveryAddress({Key? key, required this.pinCode})
      : super(key: key);

  @override
  State<ChooseDeliveryAddress> createState() => _ChooseDeliveryAddressState();
}

class _ChooseDeliveryAddressState extends State<ChooseDeliveryAddress> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    await registrationController.fetchDeliveryAddress();
  }

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
              ),
            ),
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Delivery address',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Choose delivery address ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 16.sp,
                      fontFamily: "PoppinsSemibold",
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: registrationController
                            .allDeliveryAddressModel.value.addresses!.isEmpty
                        ? Center(
                            child: Text(
                              "No addresses available",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "PoppinsRegular",
                              ),
                            ),
                          )
                        : ListView(
                            children: registrationController
                                .allDeliveryAddressModel.value.addresses!
                                .where((address) =>
                                    address.pincode == widget.pinCode)
                                .map((address) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: RadioListTile<String>(
                                                  title: Column(
                                                    children: [
                                                      Text(
                                                        address.userAddress ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines:
                                                            registrationController
                                                                    .isReadMore
                                                                    .value
                                                                ? 10
                                                                : 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              "PoppinsRegular",
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          registrationController
                                                                  .isReadMore
                                                                  .value =
                                                              !registrationController
                                                                  .isReadMore
                                                                  .value;
                                                        },
                                                        child: Text(
                                                            registrationController
                                                                    .isReadMore
                                                                    .value
                                                                ? "Read less"
                                                                : "Read more"),
                                                      )
                                                    ],
                                                  ),
                                                  value: address.delAdId!,
                                                  groupValue:
                                                      registrationController
                                                          .selectedAddressId
                                                          .value,
                                                  onChanged: (String? value) {
                                                    registrationController
                                                        .selectedAddressId
                                                        .value = value!;
                                                  },
                                                  activeColor:
                                                      AppColor.mainColor,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete,
                                                    color: Colors.red),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: Text(
                                                          "Delete Address"),
                                                      content: Text(
                                                          "Are you sure you want to delete this address?"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () async {
                                                            registrationController
                                                                .deleteAddress(
                                                                    addressId:
                                                                        address
                                                                            .delAdId!)
                                                                .then((_) {
                                                              registrationController
                                                                  .fetchDeliveryAddress();
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Yes"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("No"),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 60,
                      width: Get.width,
                      color: Colors.black.withOpacity(0.3),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
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
                                        CheckoutAddressPage(
                                            pinCode: widget.pinCode),
                                        transition: Transition.native,
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Add new address',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "PoppinsRegular",
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
                          const SizedBox(width: 10),
                          Expanded(
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
                                          .selectedAddressId.value.isNotEmpty) {
                                        Get.to(
                                          OrderDetailPage(
                                            delAdId: registrationController
                                                .selectedAddressId.value,
                                          ),
                                          transition: Transition.native,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Choose delivery address");
                                      }
                                    },
                                    child: Container(
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
                                                'Next',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "PoppinsRegular",
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
