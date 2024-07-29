import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import 'controller/order_controller.dart';

class OrderDetailsPage extends StatefulWidget {
  final int index;

  const OrderDetailsPage({super.key, required this.index});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final OrderProductController orderProductController = Get.put(OrderProductController());

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
              'Orders details',
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
                return buildOrderDetails(widget.index);
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

  Widget buildOrderDetails(int index) {
    final product = orderProductController.orderProductModel?.data?[index];
    if (product == null) {
      return Center(
        child: Text(
          'Order details not found',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailItem(label: "Order ID", value: product.orderId ?? ''),
          _detailItem(label: "Unique Order ID", value: product.orderUniqId ?? ''),
          _detailItem(label: "Payment Type", value: product.paymentType ?? ''),
          _detailItem(label: "Order Status", value: getOrderStatusText(product.orderStatus)),
          _detailItem(label: "Order Created", value: product.orderCreatedDt ?? ''),
          _detailItem(label: "Order Updated", value: product.orderUpdatedDt ?? ''),
          _detailItem(label: "Total Amount", value: 'Rs ${product.totalAmount ?? ''}'),
          _detailItem(label: "Final Amount", value: 'Rs ${product.finalAmount ?? ''}'),
          _detailItem(label: "Payment ID", value: product.paymentId ?? ''),
          // Add more fields as needed
        ],
      ),
    );
  }
  Widget _detailItem({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Material(
          color: Colors.transparent,
          elevation: 5.0,
          child: Ink(
            decoration: BoxDecoration(
              color: const Color(0xffededed),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black12),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              width: Get.width,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "$label: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "poppinsSemiBold",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "poppinsRegular",
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
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
