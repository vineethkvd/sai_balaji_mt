// To parse this JSON data, do
//
//     final addqty = addqtyFromJson(jsonString);

import 'dart:convert';

Addqty addqtyFromJson(String str) => Addqty.fromJson(json.decode(str));

String addqtyToJson(Addqty data) => json.encode(data.toJson());

class Addqty {
  bool status;
  String msg;

  Addqty({
    required this.status,
    required this.msg,
  });

  factory Addqty.fromJson(Map<String, dynamic> json) => Addqty(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
