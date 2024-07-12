import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/bottom_nav/check_out_page.dart';

import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/checkout/checkout2.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';

import '../../../api_endpoints.dart';
import '../../controller/init.dart';

class CartBottomNav extends StatefulWidget {
  const CartBottomNav({super.key});

  @override
  State<CartBottomNav> createState() => _CartBottomNavState();
}

class _CartBottomNavState extends State<CartBottomNav> {
  InitCon init = Get.put(InitCon());
  int totalcart = 0;

  callapi() async {
    await init.cart();
    for (int i = 0; i < init.cartdata!.data.length; i++) {
      totalcart = totalcart + init.cartdata!.data[i].totalamount;
      print(totalcart.toString());
    }
    setState(() {});
  }

  @override
  initState() {
    callapi();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<int> itemCount = [];
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(

          backgroundColor: AppColor.secondarycolor,
          // bottomNavigationBar: BottomNavBar(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: AppColor.mainColor,
            centerTitle: true,
            title: Text(
              'Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: "poppinssemibold",
              ),
            ),
            // actions: [
            //   IconButton(
            //       onPressed: (() {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const ProfileBottomNav()),
            //         );
            //       }),
            //       icon: Icon(
            //         Icons.person,
            //         color: kcolor1,
            //       )),
            // ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                init.cartdata?.data == null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 300, bottom: 190),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : init.cartdata!.data.isEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(top: 270, bottom: 210),
                  child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.shopping_cart_outlined),
                          Text('no item in cart'),
                        ],
                      )),
                )
                    : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Swipe right to remove item',
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontSize: 13.sp,
                              fontFamily: "poppinssemibold",
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: init.cartdata?.data.length ?? 0,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.horizontal,
                            key: UniqueKey(),
                            background: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              alignment: Alignment.centerRight,
                            ),
                            onDismissed: (direction) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    // bool dismiss = false;
                                    return AlertDialog(
                                        title: const Text(
                                            "Are you sure you want to remove the item"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                await init.removecart(init
                                                    .cartdata
                                                    ?.data[index]
                                                    .cartId);
                                                totalcart = 0;
                                                await callapi();
                                                Get.back();
                                                setState(() {});
                                                // Get.to(CartBottomNav());

                                                // dismiss = true;
                                              },
                                              child: const Text("Yes")),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                totalcart = 0;
                                                await callapi();
                                              },
                                              child: const Text("No")),
                                        ]);
                                  });
                            },
                            child: Column(
                              children: [
                                // Text('data')
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            1.05,
                                        height: 80,
                                        child: Card(
                                          elevation: 2,
                                          color: AppColor.primarycolor,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                child: Container(
                                                  // color: Colors.amber,
                                                  width:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      7,
                                                  height:
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                      18,
                                                  child: Image.network(
                                                    API().imagebaseURL +
                                                        init
                                                            .cartdata!
                                                            .data[index]
                                                            .proImage1,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [

                                                  SizedBox(
                                                    width: 120,
                                                    child: Text(
                                                      init
                                                          .cartdata!
                                                          .data[index]
                                                          .proName,
                                                      style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 14.sp,
                                                        fontFamily: "poppinsRegular",
                                                      ),
                                                      textAlign: TextAlign
                                                          .center,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' ₹ ' +
                                                        init
                                                            .cartdata!
                                                            .data[index]
                                                            .showPrice,
                                                    style: TextStyle(
                                                      color: AppColor
                                                          .mainColor,
                                                      fontSize: 16.sp,
                                                      fontFamily: "poppinsRegular",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
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
                                                      InkWell(
                                                        onTap: () async {
                                                          if (init
                                                              .cartdata!
                                                              .data[
                                                          index]
                                                              .datumProQuantity ==
                                                              '1') {
                                                            // Delete the product if the quantity is 1
                                                            await init.removecart(init
                                                                .cartdata
                                                                ?.data[
                                                            index]
                                                                .cartId);
                                                            totalcart = 0;
                                                            await callapi();
                                                            setState(
                                                                    () {});
                                                          } else {
                                                            // Decrement quantity
                                                            await init.addqty(
                                                                init
                                                                    .cartdata!
                                                                    .data[
                                                                index]
                                                                    .cartId,
                                                                int.parse(init
                                                                    .cartdata!
                                                                    .data[index]
                                                                    .datumProQuantity) -
                                                                    1);
                                                            totalcart = 0;
                                                            await callapi();
                                                            setState(
                                                                    () {});
                                                          }
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(100),
                                                          child: Container(
                                                            height: 20,
                                                            width: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .width /
                                                                18,
                                                            color: Colors
                                                                .white,
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      kboxw10,
                                                      Text(
                                                        init
                                                            .cartdata!
                                                            .data[index]
                                                            .datumProQuantity,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .black,
                                                          fontSize: 15.sp,
                                                          fontFamily: "poppinsRegular",
                                                        ),
                                                      ),
                                                      kboxw10,
                                                      InkWell(
                                                        onTap: () async {
                                                          await init.addqty(
                                                              init
                                                                  .cartdata!
                                                                  .data[
                                                              index]
                                                                  .cartId,
                                                              int.parse(init
                                                                  .cartdata!
                                                                  .data[index]
                                                                  .datumProQuantity) +
                                                                  1);
                                                          totalcart = 0;
                                                          await callapi();
                                                          setState(() {});
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(100),
                                                          child: Container(
                                                            height: 20,
                                                            width: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .width /
                                                                18,
                                                            color: Colors
                                                                .white,
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
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
                                                    ' ₹ ' +
                                                        init
                                                            .cartdata!
                                                            .data[index]
                                                            .totalamount
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: AppColor
                                                          .mainColor,
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
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                init.cartdata?.data == null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 300, bottom: 190),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : init.cartdata!.data.isEmpty
                    ? SizedBox()
                    : Container(
                  height: 80.h,
                  color: Colors.white,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 1,
                    color: AppColor.primarycolor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '₹  ${totalcart.toString()}',
                                        style: TextStyle(
                                          color: AppColor.mainColor,
                                          fontSize: 16.sp,
                                          fontFamily: "poppinssemibold",
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(1, 2.3),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              AppColor.mainColor),
                                          onPressed: () async {
                                            Get.to(const CheckOutPage(),
                                                transition:
                                                Transition.native);
                                            // print(
                                            //     'Checkout button pressed');
                                            // try {
                                            //   await init.checkout();
                                            //   print(
                                            //       'Checkout completed successfully');
                                            //   Get.to(
                                            //     const CheckoutAnother(),
                                            //     transition: Transition
                                            //         .rightToLeft,
                                            //   );
                                            // } catch (e) {
                                            //   print(
                                            //       'Error during checkout: $e');
                                            // }
                                          },
                                          child: Text(
                                            'Checkout  >',
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}