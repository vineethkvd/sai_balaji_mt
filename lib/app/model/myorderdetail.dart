// To parse this JSON data, do
//
//     final myorderdetail = myorderdetailFromJson(jsonString);

import 'dart:convert';

Myorderdetail myorderdetailFromJson(String str) =>
    Myorderdetail.fromJson(json.decode(str));

String myorderdetailToJson(Myorderdetail data) => json.encode(data.toJson());

class Myorderdetail {
  bool status;
  String msg;
  Data data;

  Myorderdetail({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Myorderdetail.fromJson(Map<String, dynamic> json) => Myorderdetail(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  List<Item> items;
  DeliveredAddress deliveredAddress;

  Data({
    required this.items,
    required this.deliveredAddress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        deliveredAddress: DeliveredAddress.fromJson(json["delivered_address"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "delivered_address": deliveredAddress.toJson(),
      };
}

class DeliveredAddress {
  String orderId;
  String userAddForId;
  String orderStatus;
  String totalAmount;
  String paymentId;
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

  DeliveredAddress({
    required this.orderId,
    required this.userAddForId,
    required this.orderStatus,
    required this.totalAmount,
    required this.paymentId,
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
  });

  factory DeliveredAddress.fromJson(Map<String, dynamic> json) =>
      DeliveredAddress(
        orderId: json["order_id"],
        userAddForId: json["user_add_for_id"],
        orderStatus: json["order_status"],
        totalAmount: json["total_amount"],
        paymentId: json["payment_id"],
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
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user_add_for_id": userAddForId,
        "order_status": orderStatus,
        "total_amount": totalAmount,
        "payment_id": paymentId,
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
      };
}

class Item {
  String orderItemsId;
  String proForQuantity;
  String proPrice;
  DateTime orderCreated;
  String proDetailsId;
  String proName;
  String proDescription;
  String proImage1;
  String proImage2;
  String proImage3;
  String proImage4;
  String proImage5;

  Item({
    required this.orderItemsId,
    required this.proForQuantity,
    required this.proPrice,
    required this.orderCreated,
    required this.proDetailsId,
    required this.proName,
    required this.proDescription,
    required this.proImage1,
    required this.proImage2,
    required this.proImage3,
    required this.proImage4,
    required this.proImage5,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        orderItemsId: json["order_items_id"],
        proForQuantity: json["pro_for_quantity"],
        proPrice: json["pro_price"],
        orderCreated: DateTime.parse(json["order_created"]),
        proDetailsId: json["pro_details_id"],
        proName: json["pro_name"],
        proDescription: json["pro_description"],
        proImage1: json["pro_image1"],
        proImage2: json["pro_image2"],
        proImage3: json["pro_image3"],
        proImage4: json["pro_image4"],
        proImage5: json["pro_image5"],
      );

  Map<String, dynamic> toJson() => {
        "order_items_id": orderItemsId,
        "pro_for_quantity": proForQuantity,
        "pro_price": proPrice,
        "order_created": orderCreated.toIso8601String(),
        "pro_details_id": proDetailsId,
        "pro_name": proName,
        "pro_description": proDescription,
        "pro_image1": proImage1,
        "pro_image2": proImage2,
        "pro_image3": proImage3,
        "pro_image4": proImage4,
        "pro_image5": proImage5,
      };
}
