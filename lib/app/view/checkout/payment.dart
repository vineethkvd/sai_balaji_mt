// // ignore_for_file: constant_identifier_names

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:worldline_pg/worldline_pg.dart';

// import 'package:http/http.dart' as http;

// import 'payment_page.dart';

// const String ENC_KEY = 'd866e1d3d75031feb5b4a46a08dc0577';
// const String FORM_ACTION_URL = "https://ipg.in.worldline.com/doMEPayRequest";
// const String GET_TRANS_STATUS =
//     "https://ipg.in.worldline.com/getTransactionStatus";
// const String MID = 'WL0000000037608';


// class PaymentStatus extends StatefulWidget {
//   const PaymentStatus({super.key});

//   @override
//   State<PaymentStatus> createState() => _PaymentStatusState();
// }

// class _PaymentStatusState extends State<PaymentStatus> {
//   final _worldlinePg = WorldlinePg(
//     enckey: ENC_KEY,
//     mid: MID,
//   );
//   String _paymentStatus = 'Payment not initiated';

//   _loadPaymentStatus(String orderId) async {
//     var trnResParams =
//         await _getPaymentStatus(orderId: orderId, url: GET_TRANS_STATUS);
//     var url = Uri.parse(GET_TRANS_STATUS);
//     var encryptedResponse = await http.post(
//       url,
//       body: trnResParams,
//       headers: {
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//     ).then((value) => value.body);
//     log('Encrypted Response: $encryptedResponse');

//     var decryptedResponse = await _worldlinePg.getParsedTrnResMsg(
//       response: encryptedResponse,
//     );
//     log('Decrypted Response: ${decryptedResponse.toJson()}');

//     setState(() {
//       _paymentStatus = decryptedResponse.statusDesc;
//     });
//   }

//   Future<String> _getPaymentStatus({
//     required String orderId,
//     required String url,
//   }) async {
//     String paymentStatus;
//     try {
//       paymentStatus = await _worldlinePg.getTrnResParams(
//         orderId: orderId,
//         url: url,
//       );
//     } on PlatformException {
//       paymentStatus = 'Failed to get payment status.';
//     }

//     log('Payment Status: $paymentStatus');
//     return paymentStatus;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Status'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _paymentStatus,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(
//                   MaterialPageRoute(
//                     builder: (context) =>  PaymentPage(),
//                   ),
//                 )
//                     .then((value) {
//                   _loadPaymentStatus(value);
//                 });
//               },
//               child: const Text('Initiate Payment'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

