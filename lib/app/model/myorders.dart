// To parse this JSON data, do
//
//     final myorder = myorderFromJson(jsonString);

import 'dart:convert';

Myorder myorderFromJson(String str) => Myorder.fromJson(json.decode(str));

String myorderToJson(Myorder data) => json.encode(data.toJson());

class Myorder {
  bool status;
  String msg;
  List<Datum> data;

  Myorder({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Myorder.fromJson(Map<String, dynamic> json) => Myorder(
    status: json["status"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String orderId;
  String orUserForId;
  String orderUniqId;
  String paymentType;
  String userAddForId;
  String orderStatus;
  DateTime orderCreatedDt;
  DateTime orderUpdatedDt;
  String totalAmount;
  String surgeCharge;
  String shippingCharge;
  String paymentId;
  String isCancel;
  String isRefund;
  String pickupOtp;
  String customerOtp;
  String returnOtp;
  String paymentStatus;
  String storeId;
  String userType;
  int gstPercentage;
  int gstAmount;
  int paidAmount;

  Datum({
    required this.orderId,
    required this.orUserForId,
    required this.orderUniqId,
    required this.paymentType,
    required this.userAddForId,
    required this.orderStatus,
    required this.orderCreatedDt,
    required this.orderUpdatedDt,
    required this.totalAmount,
    required this.surgeCharge,
    required this.shippingCharge,
    required this.paymentId,
    required this.isCancel,
    required this.isRefund,
    required this.pickupOtp,
    required this.customerOtp,
    required this.returnOtp,
    required this.paymentStatus,
    required this.storeId,
    required this.userType,
    required this.gstPercentage,
    required this.gstAmount,
    required this.paidAmount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["order_id"],
    orUserForId: json["or_user_for_id"],
    orderUniqId: json["order_uniq_id"],
    paymentType: json["payment_type"],
    userAddForId: json["user_add_for_id"],
    orderStatus: json["order_status"],
    orderCreatedDt: DateTime.parse(json["order_created_dt"]),
    orderUpdatedDt: DateTime.parse(json["order_updated_dt"]),
    totalAmount: json["total_amount"],
    surgeCharge: json["surge_charge"],
    shippingCharge: json["shipping_charge"],
    paymentId: json["payment_id"],
    isCancel: json["is_cancel"],
    isRefund: json["is_refund"],
    pickupOtp: json["pickup_otp"],
    customerOtp: json["customer_otp"],
    returnOtp: json["return_otp"],
    paymentStatus: json["payment_status"],
    storeId: json["store_id"],
    userType: json["user_type"],
    gstPercentage: json["gst_percentage"],
    gstAmount: json["gst_amount"],
    paidAmount: json["paid_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "or_user_for_id": orUserForId,
    "order_uniq_id": orderUniqId,
    "payment_type": paymentType,
    "user_add_for_id": userAddForId,
    "order_status": orderStatus,
    "order_created_dt": orderCreatedDt.toIso8601String(),
    "order_updated_dt": orderUpdatedDt.toIso8601String(),
    "total_amount": totalAmount,
    "surge_charge": surgeCharge,
    "shipping_charge": shippingCharge,
    "payment_id": paymentId,
    "is_cancel": isCancel,
    "is_refund": isRefund,
    "pickup_otp": pickupOtp,
    "customer_otp": customerOtp,
    "return_otp": returnOtp,
    "payment_status": paymentStatus,
    "store_id": storeId,
    "user_type": userType,
    "gst_percentage": gstPercentage,
    "gst_amount": gstAmount,
    "paid_amount": paidAmount,
  };
}
