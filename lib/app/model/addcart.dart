// To parse this JSON data, do
//
//     final addcart = addcartFromJson(jsonString);

import 'dart:convert';

Addcart addcartFromJson(String str) => Addcart.fromJson(json.decode(str));

String addcartToJson(Addcart data) => json.encode(data.toJson());

class Addcart {
  bool status;
  String msg;
  Data data;

  Addcart({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Addcart.fromJson(Map<String, dynamic> json) => Addcart(
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
  String cartId;
  String proForId;
  String userForId;
  String proQuantity;
  String proPrice;
  DateTime cartAddDate;
  DateTime cartUpdatedDate;

  Data({
    required this.cartId,
    required this.proForId,
    required this.userForId,
    required this.proQuantity,
    required this.proPrice,
    required this.cartAddDate,
    required this.cartUpdatedDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartId: json["cart_id"],
        proForId: json["pro_for_id"],
        userForId: json["user_for_id"],
        proQuantity: json["pro_quantity"],
        proPrice: json["pro_price"],
        cartAddDate: DateTime.parse(json["cart_add_date"]),
        cartUpdatedDate: DateTime.parse(json["cart_updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "pro_for_id": proForId,
        "user_for_id": userForId,
        "pro_quantity": proQuantity,
        "pro_price": proPrice,
        "cart_add_date": cartAddDate.toIso8601String(),
        "cart_updated_date": cartUpdatedDate.toIso8601String(),
      };
}
