import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/view/myorder/order_details_page.dart';

import '../../common/colors.dart';
import 'controller/order_controller.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  final OrderProductController orderProductController =
  Get.put(OrderProductController());

  @override
  void initState() {
    super.initState();
    orderProductController.fetchOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_backspace,
                size: 20,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: AppColor.mainColor,
            centerTitle: true,
            title: Text(
              'My Orders',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: "poppinssemibold",
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(10),
            child: Obx(() {
              if (orderProductController.loading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (orderProductController.orderProductModel?.data?.isNotEmpty ?? false) {
                return buildOrderList();
              } else {
                return Center(
                  child: Text(
                    'No Ordered product available',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: "poppinssemibold",
                    ),
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget buildOrderList() {
    final product = orderProductController.orderProductModel?.data ?? [];

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              final item = product[index];
              return InkWell(
                onTap: () {
                  Get.to(OrderDetailsPage(index: index),transition: Transition.cupertino);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order ID: ${item.orderId ?? ''}",
                                style: TextStyle(
                                  fontFamily: "poppinsSemiBold",
                                  fontSize: 14.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Amount: Rs ${item.finalAmount ?? ''}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontFamily: "poppinsRegular",
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Order Status: ${getOrderStatusText(item.orderStatus ?? '')}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "poppinsRegular",
                                  fontSize: 12.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  String getOrderStatusText(String? status) {
    switch (status) {
      case "0":
        return "Processing";
      case "2":
        return "Pickup for Delivery";
      case "3":
        return "On The Way";
      case "1":
        return "Delivered";
      default:
        return "Unknown";
    }
  }
}
