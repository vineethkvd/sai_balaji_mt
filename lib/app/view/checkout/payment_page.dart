// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:purie_ui/app/view/checkout/payment.dart';
// import 'package:worldline_pg/worldline_pg.dart';

// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   Uint8List _bytes = Uint8List(0);
//   final GlobalKey _webViewKey = GlobalKey();
//   final _orderID = '123456';
//   bool _isLoading = true;
//   final worldlinePg = WorldlinePg.instance;

//   @override
//   void initState() {
//     super.initState();
//     getRequestHash();
//   }

//   Future<void> getRequestHash() async {
//     String requestHash;
//     try {
//       requestHash = await worldlinePg.getTrnRequestHash(
//         orderId: _orderID,
//         trnAmt: '100',
//         trnCurrency: 'INR',
//         meTransReqType: 'S',
//         responseUrl: 'https://www.google.com',
//         trnRemarks: 'College Fee',
//       );
//     } on PlatformException {
//       requestHash = 'Failed to get request hash.';
//     }

//     _bytes = Uint8List.fromList(
//         utf8.encode("merchantRequest=$requestHash&MID=$MID"));

//     if (!mounted) return;

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pop(
//           context,
//           _orderID,
//         );
//         return false;
//       },
//       child: Scaffold(
//         body: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : InAppWebView(
//                 key: _webViewKey,
//                 initialUrlRequest: URLRequest(
//                   url: Uri.parse(FORM_ACTION_URL),
//                   method: 'POST',
//                   body: _bytes,
//                   headers: {
//                     'Content-Type': 'application/x-www-form-urlencoded'
//                   },
//                 ),
//                 onReceivedServerTrustAuthRequest:
//                     (controller, challenge) async {
//                   //Do some checks here to decide if CANCELS or PROCEEDS
//                   return ServerTrustAuthResponse(
//                       action: ServerTrustAuthResponseAction.PROCEED);
//                 },
//               ),
//       ),
//     );
//   }
// }