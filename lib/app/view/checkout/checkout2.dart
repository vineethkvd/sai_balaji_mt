import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/checkout/adresses.dart';
import 'package:purie_ui/app/view/checkout/ccavenue.dart';
import 'package:purie_ui/app/view/checkout/fail.dart';
import 'package:purie_ui/app/view/checkout/success.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:weipl_checkout_flutter/weipl_checkout_flutter.dart';

import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';
import '../myorder/my_order.dart';

class CheckoutAnother extends StatefulWidget {
  const CheckoutAnother({super.key});

  @override
  State<CheckoutAnother> createState() => _CheckoutAnotherState();
}

class _CheckoutAnotherState extends State<CheckoutAnother> {
  InitCon init = Get.put(InitCon());

  callapi() async {
    await init.checkout();
    setState(() {});
  }

  @override
  initState() {
    callapi();
    // setState(() {});
  }

  // WeiplCheckoutFlutter wlCheckoutFlutter = WeiplCheckoutFlutter();

  // void handleResponse(Map<dynamic, dynamic> response) {
  //   // Do something when payment succeeds
  //   print('Succersssssssssssssssssssssssssssssssssssssssssssssssss');
  //   print(response['msg'].toString().split('|'));

  //   if (response['msg'].toString().split('|')[1] == 'failure' ||
  //       response['msg'].toString().split('|')[1] == 'User Aborted') {
  //     print('failureeee');
  //     Get.to(Failurepage());
  //   } else {
  //     print('success');
  //     init.getpaid(init.checkoutdata!.address.addId);
  //     init.myorders();
  //     Get.to(successpage());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: kcolor1,
          ),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Title(
              color: kcolor1,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  'CheckOut',
                  style: TextStyle(color: kcolor1),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          height:
                              MediaQuery.of(context).size.height / 12,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.off(Addresses(),
                                        transition:
                                            Transition.upToDown,
                                        preventDuplicates: true);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: kcolor1,
                                          borderRadius:
                                              BorderRadiusDirectional
                                                  .circular(8)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Change Address',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    init.checkoutdata!.address
                                                .flatNum ==
                                            ''
                                        ? Text(
                                            'Please Select dropping address',
                                            style: TextStyle(
                                                color: Colors.red),
                                          )
                                        : Container(
                                            width: 280,
                                            // color: Colors.amber,
                                            child: Text(
                                              init
                                                      .checkoutdata!
                                                      .address
                                                      .flatNum +
                                                  ' ' +
                                                  init.checkoutdata!
                                                      .address.town +
                                                  ' ' +
                                                  init.checkoutdata!
                                                      .address.area +
                                                  ' ' +
                                                  init
                                                      .checkoutdata!
                                                      .address
                                                      .district +
                                                  ' ' +
                                                  init.checkoutdata!
                                                      .address.state +
                                                  ' ' +
                                                  init
                                                      .checkoutdata!
                                                      .address
                                                      .country +
                                                  ' - ' +
                                                  init
                                                      .checkoutdata!
                                                      .address
                                                      .pincode,
                                            )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        // height: MediaQuery.of(context).size.height / 3.4,
                        width: MediaQuery.of(context).size.width,

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Bill Details ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item Total ' +
                                        '( ' +
                                        init.checkoutdata!.data
                                            .numItems
                                            .toString() +
                                        '  Item' +
                                        ' )',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '₹ ' +
                                        init.checkoutdata!.data
                                            .totalAmount
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'GST ' +
                                        '( ' +
                                        init.checkoutdata!.data.gst
                                            .toString() +
                                        ' % )',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '₹ ' +
                                        init.checkoutdata!.data
                                            .gstAmount
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping Charges',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '₹ ' +
                                        init.checkoutdata!
                                            .shippingCharge
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Surge Amount',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '₹ ' +
                                        init.checkoutdata!.surgeAmount
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         'Delivery fee',
                            //         style: TextStyle(
                            //             fontSize: 13,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       Text(
                            //         'RS.10/-',
                            //         style: TextStyle(
                            //             fontSize: 13,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         'Total Discount',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w500,
                            //             color: kcolor1),
                            //       ),
                            //       Text(
                            //         'RS.1884/-',
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w500,
                            //             color: kcolor1),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TO PAY',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '₹ ' +
                                        init.checkoutdata!.data
                                            .payableAmount
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red[900]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,

              //   children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height/15,
              //       alignment: Alignment.bottomCenter,
              //       color: Colors.orange[900],

              //     ),
              //   ],
              // )
              init.checkoutdata!.address.flatNum == ''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 168.0),
                      child: Text(
                        'Please Select Address for Payment',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 150, right: 8.0, left: 8.0),
                      child: Container(
                        height:
                            MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.white,
                        child: ElevatedButton(
                          onPressed: () async {
                            await init.getpaid(
                                init.checkoutdata!.address.addId,
                                init.checkoutdata!.surgeAmount
                                    .toString(),
                                init.checkoutdata!.shippingCharge);
                            //await init.paymentworldline();
                            await Get.to(webCC(
                              paymentLink:
                                  init.getpaiddata?.url ?? '',
                            ));
                            Get.offAll(Bottomsheet());
                          },
                          child: Text(
                            'PAY NOW',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kcolor1),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

// class ccavanue extends StatelessWidget {
//   const ccavanue({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // final HomeCon init = Get.put(HomeCon());
//     InitCon init = Get.put(InitCon());
//     return WebViewWidget(
//         controller: WebViewController()
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           ..setBackgroundColor(const Color(0x00000000))
//           ..setNavigationDelegate(
//             NavigationDelegate(
//               onProgress: (int progress) {
//                 // Update loading bar.
//               },
//               onPageStarted: (String url) {},
//               onPageFinished: (String url) {},
//               onWebResourceError: (WebResourceError error) {},
//               onNavigationRequest: (NavigationRequest request) {
//                 if (request.url.startsWith('https://www.youtube.com/')) {
//                   return NavigationDecision.prevent;
//                 }
//                 return NavigationDecision.navigate;
//               },
//             ),
//           )
//           ..loadRequest(Uri.parse(init.paymentdata!.data.toString())));
//   }
// }
