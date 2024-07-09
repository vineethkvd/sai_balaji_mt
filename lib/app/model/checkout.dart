// To parse this JSON data, do
//
//     final checkout = checkoutFromJson(jsonString);

import 'dart:convert';

Checkout checkoutFromJson(String str) =>
    Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  bool status;
  bool isAddress;
  Address address;
  String msg;
  Data data;
  UserDetails userDetails;
  PaymentDetails paymentDetails;
  String shippingCharge;
  String surgeAmount;

  Checkout({
    required this.status,
    required this.isAddress,
    required this.address,
    required this.msg,
    required this.data,
    required this.userDetails,
    required this.paymentDetails,
    required this.shippingCharge,
    required this.surgeAmount,
  });

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        status: json["status"],
        isAddress: json["is_address"],
        address: Address.fromJson(json["address"]),
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        userDetails: UserDetails.fromJson(json["user_details"]),
        paymentDetails:
            PaymentDetails.fromJson(json["payment_details"]),
        shippingCharge: json["shipping_charge"].toString(),
        surgeAmount: json["surge_amount"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "is_address": isAddress,
        "address": address.toJson(),
        "msg": msg,
        "data": data.toJson(),
        "user_details": userDetails.toJson(),
        "payment_details": paymentDetails.toJson(),
        "shipping_charge": shippingCharge,
        "surge_amount": surgeAmount,
      };
}

class Address {
  String addId;
  String userForId;
  String billMobileNo;
  String flatNum;
  String town;
  String area;
  String district;
  String state;
  String country;
  String landMark;
  String pincode;
  String addStatus;
  String addIsDeleted;

  Address({
    required this.addId,
    required this.userForId,
    required this.billMobileNo,
    required this.flatNum,
    required this.town,
    required this.area,
    required this.district,
    required this.state,
    required this.country,
    required this.landMark,
    required this.pincode,
    required this.addStatus,
    required this.addIsDeleted,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addId: json["add_id"],
        userForId: json["user_for_id"],
        billMobileNo: json["bill_mobile_no"],
        flatNum: json["flat_num"],
        town: json["town"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        landMark: json["land_mark"],
        pincode: json["pincode"],
        addStatus: json["add_status"],
        addIsDeleted: json["add_is_Deleted"],
      );

  Map<String, dynamic> toJson() => {
        "add_id": addId,
        "user_for_id": userForId,
        "bill_mobile_no": billMobileNo,
        "flat_num": flatNum,
        "town": town,
        "area": area,
        "district": district,
        "state": state,
        "country": country,
        "land_mark": landMark,
        "pincode": pincode,
        "add_status": addStatus,
        "add_is_Deleted": addIsDeleted,
      };
}

class Data {
  int numItems;
  int totalAmount;
  int gst;
  int gstAmount;
  int payableAmount;

  Data({
    required this.numItems,
    required this.totalAmount,
    required this.gst,
    required this.gstAmount,
    required this.payableAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        numItems: json["num_items"],
        totalAmount: json["total_amount"],
        gst: json["gst"],
        gstAmount: json["gst_amount"],
        payableAmount: json["payable_amount"],
      );

  Map<String, dynamic> toJson() => {
        "num_items": numItems,
        "total_amount": totalAmount,
        "gst": gst,
        "gst_amount": gstAmount,
        "payable_amount": payableAmount,
      };
}

class PaymentDetails {
  String orderId;
  int amount;
  String currencyName;
  String mid;
  String meTransReqType;
  String enckey;
  String responseUrl;

  PaymentDetails({
    required this.orderId,
    required this.amount,
    required this.currencyName,
    required this.mid,
    required this.meTransReqType,
    required this.enckey,
    required this.responseUrl,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      PaymentDetails(
        orderId: json["OrderId"],
        amount: json["amount"],
        currencyName: json["currencyName"],
        mid: json["mid"],
        meTransReqType: json["meTransReqType"],
        enckey: json["enckey"],
        responseUrl: json["responseUrl"],
      );

  Map<String, dynamic> toJson() => {
        "OrderId": orderId,
        "amount": amount,
        "currencyName": currencyName,
        "mid": mid,
        "meTransReqType": meTransReqType,
        "enckey": enckey,
        "responseUrl": responseUrl,
      };
}

class UserDetails {
  String userName;
  String userEmailid;
  String userMobileno;

  UserDetails({
    required this.userName,
    required this.userEmailid,
    required this.userMobileno,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      UserDetails(
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
      };
}
