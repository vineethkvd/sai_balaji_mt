import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api_endpoints.dart';
import '../../common/colors.dart';
import '../../controller/registration_controller.dart';
import '../bottom_nav/payment_options.dart';

class OrderDetailPage extends StatefulWidget {
  final String delAdId;
  const OrderDetailPage({Key? key, required this.delAdId}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final RegistrationController registrationController =
  Get.put(RegistrationController());

  @override
  void initState() {
    super.initState();
    fetchAddresses();
    registrationController.fetchCartData();
  }

  Future<void> fetchAddresses() async {
    await registrationController.fetchDeliveryAddress().then((_) {
      registrationController.allDeliveryAddressModel.value.addresses!
          .map((value) {
        if (value.delAdId == widget.delAdId) {
          registrationController.currentAddress.value = value.userAddress!;
        }
      }).toList();
    });
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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColor.mainColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Order Details',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery address',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: 16.sp,
                                    fontFamily: "poppinsSemibold",
                                  ),
                                ),
                                Divider(
                                  color: Colors.black54,
                                  thickness: 1,
                                ),
                                Obx(() => Text(
                                  "${registrationController.currentAddress.value}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontFamily: "poppinsRegular",
                                  ),
                                ))
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Product details',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontSize: 16.sp,
                              fontFamily: "poppinsSemibold",
                            ),
                          ),
                          const Divider(
                            color: Colors.black54,
                            thickness: 1,
                          ),
                          Obx(() {
                            if (registrationController.isLoading.value) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (registrationController.cartdata.value.data.isEmpty) {
                              return const Center(child: Text('No items in cart'));
                            }
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: registrationController.cartdata.value.data.length,
                                itemBuilder: (context, index) {
                                  var item = registrationController.cartdata.value.data[index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width + 30,
                                          height: 80,
                                          child: Card(
                                            elevation: 2,
                                            color: AppColor.primarycolor,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width / 7,
                                                    height: MediaQuery.of(context).size.height / 18,
                                                    child: Image.network(
                                                      API().imagebaseURL + item.proImage1,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 120,
                                                      child: Text(
                                                        item.proName,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontFamily: "poppinsRegular",
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    Text(
                                                      ' ₹ ' + item.showPrice,
                                                      style: TextStyle(
                                                        color: AppColor.mainColor,
                                                        fontSize: 16.sp,
                                                        fontFamily: "poppinsRegular",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Qty',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontFamily: "poppinsRegular",
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          item.datumProQuantity,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp,
                                                            fontFamily: "poppinsRegular",
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'Total',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontFamily: "poppinsRegular",
                                                      ),
                                                    ),
                                                    Text(
                                                      ' ₹ ' + item.totalamount.toString(),
                                                      style: TextStyle(
                                                        color: AppColor.mainColor,
                                                        fontSize: 16.sp,
                                                        fontFamily: "poppinsRegular",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }),
                          SizedBox(height: 10),
                          Card(
                            color: AppColor.secondarycolor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ Text(
                                    'Total Amount',
                                    style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontSize: 14.sp,
                                      fontFamily: "poppinsSemibold",
                                    ),
                                  ),
                                    Obx(() => Text(
                                      '₹${registrationController.cartdata.value.data.fold(0, (sum, item) => sum + item.totalamount)}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: "poppinsRegular",
                                      ),
                                    ))
                                    ,],),
                                  Divider(color: Colors.black26,thickness: 1,),
                                  Center(
                                    child: Text(
                                      'Above total is inclusive of all taxes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: "poppinsRegular",
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                            onTap: () {
                              Get.to(const PaymentOptionsPage(),
                                  transition: Transition.native);
                            },
                            child: Container(
                              width: 130,
                              height: 40,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'Pay Now',
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
            ),
          ),
        ),
      ),
    );
  }
}
