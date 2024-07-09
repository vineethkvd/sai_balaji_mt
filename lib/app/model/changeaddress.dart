// To parse this JSON data, do
//
//     final changeaddress = changeaddressFromJson(jsonString);

import 'dart:convert';

Changeaddress changeaddressFromJson(String str) =>
    Changeaddress.fromJson(json.decode(str));

String changeaddressToJson(Changeaddress data) => json.encode(data.toJson());

class Changeaddress {
  bool status;
  String msg;

  Changeaddress({
    required this.status,
    required this.msg,
  });

  factory Changeaddress.fromJson(Map<String, dynamic> json) => Changeaddress(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
