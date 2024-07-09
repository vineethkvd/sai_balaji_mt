// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  bool status;
  String msg;
  List<Datum> data;

  Cart({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
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
  String cartId;
  String proForId;
  String userForId;
  String datumProQuantity;
  String proPrice;
  DateTime cartAddDate;
  DateTime cartUpdatedDate;
  String proDetailsId;
  String proName;
  String proDescription;
  String proRetailPrice;
  String proWholesalePrice;
  String proImage1;
  String proImage2;
  String proImage3;
  String proImage4;
  String proImage5;
  String proQuantity;
  String inSlider;
  String subcatForId;
  String showPrice;
  String user_type;
  String pro_whole_min_qry;
  int totalamount = 0;

  Datum(
      {required this.cartId,
      required this.proForId,
      required this.userForId,
      required this.datumProQuantity,
      required this.proPrice,
      required this.cartAddDate,
      required this.cartUpdatedDate,
      required this.proDetailsId,
      required this.proName,
      required this.proDescription,
      required this.proRetailPrice,
      required this.proWholesalePrice,
      required this.proImage1,
      required this.proImage2,
      required this.proImage3,
      required this.proImage4,
      required this.proImage5,
      required this.proQuantity,
      required this.inSlider,
      required this.subcatForId,
      required this.showPrice,
      required this.user_type,
      required this.pro_whole_min_qry,
      required this.totalamount});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      cartId: json["cart_id"] ?? '',
      proForId: json["pro_for_id"] ?? '',
      userForId: json["user_for_id"] ?? '',
      datumProQuantity: json["pro_quantity"] ?? '',
      proPrice: json["pro_price"] ?? '',
      cartAddDate: DateTime.parse(json["cart_add_date"] ?? ''),
      cartUpdatedDate: DateTime.parse(json["cart_updated_date"] ?? ''),
      proDetailsId: json["pro_details_id"] ?? '',
      proName: json["pro_name"] ?? '',
      proDescription: json["pro_description"] ?? '',
      proRetailPrice: json["pro_retail_price"] ?? '',
      proWholesalePrice: json["pro_wholesale_price"] ?? '',
      proImage1: json["pro_image1"] ?? '',
      proImage2: json["pro_image2"] ?? '',
      proImage3: json["pro_image3"] ?? '',
      proImage4: json["pro_image4"] ?? '',
      proImage5: json["pro_image5"] ?? '',
      proQuantity: json["Pro_quantity"] ?? '',
      inSlider: json["in_slider"] ?? '',
      subcatForId: json["subcat_for_id"] ?? '',
      showPrice: json["show_price"],
      user_type: json["user_type"],
      pro_whole_min_qry: json["pro_whole_min_qry"]?? "",
      totalamount: int.parse(json["pro_quantity"] ?? "0") *
          int.parse(json["show_price"] ?? "0"));

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "pro_for_id": proForId,
        "user_for_id": userForId,
        "pro_quantity": datumProQuantity,
        "pro_price": proPrice,
        "cart_add_date": cartAddDate.toIso8601String(),
        "cart_updated_date": cartUpdatedDate.toIso8601String(),
        "pro_details_id": proDetailsId,
        "pro_name": proName,
        "pro_description": proDescription,
        "pro_retail_price": proRetailPrice,
        "pro_wholesale_price": proWholesalePrice,
        "pro_image1": proImage1,
        "pro_image2": proImage2,
        "pro_image3": proImage3,
        "pro_image4": proImage4,
        "pro_image5": proImage5,
        "Pro_quantity": proQuantity,
        "in_slider": inSlider,
        "subcat_for_id": subcatForId,
        "user_type": user_type,
        "pro_whole_min_qry": pro_whole_min_qry,
        "show_price": showPrice,
      };
}
