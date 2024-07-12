import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:purie_ui/app/common/common.dart';

import '../../common/colors.dart';
import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';
import 'order_detail.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  InitCon init = Get.put(InitCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color:Colors.white,
          ),
        ),
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
      body: SingleChildScrollView(
        child: init.orderdata?.data == null
            ? Column(
                children: [
                  Lottie.asset('assets/images/noorder.json',
                      fit: BoxFit.fitHeight),
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: Text(
                      'No Order Placed',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            : Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: init.orderdata?.data.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            await init.myordersdetail(
                                init.orderdata?.data[index].orderId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 0.1,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          init.orderdata?.data[index]
                                                  .orderUniqId ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.15,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(DateFormat.MMMEd().format(
                                                  init.orderdata!.data[index]
                                                      .orderCreatedDt)),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '₹ ' +
                                                  init.orderdata!.data[index]
                                                      .paidAmount
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var snackdemo = SnackBar(
                                                  content: Text(
                                                    '₹ ' +
                                                        init
                                                            .orderdata!
                                                            .data[index]
                                                            .totalAmount
                                                            .toString() +
                                                        '  (GST)  ' +
                                                        '₹ ' +
                                                        init
                                                            .orderdata!
                                                            .data[index]
                                                            .gstAmount
                                                            .toString() +
                                                        '  =  ' +
                                                        '₹ ' +
                                                        init
                                                            .orderdata!
                                                            .data[index]
                                                            .paidAmount
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  backgroundColor: Colors.green,
                                                  elevation: 10,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  margin: EdgeInsets.all(5),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackdemo);
                                              },
                                              child: Text(
                                                'GST Included',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        init.orderdata!.data[index].orderStatus
                                                    .toString() ==
                                                '1'
                                            ? Text(
                                                'Received',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            : Text('Pending'),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ]),
      ),
    );
  }
}
