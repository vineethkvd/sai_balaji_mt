// To parse this JSON data, do
//
//     final addaddresscart = addaddresscartFromJson(jsonString);

import 'dart:convert';

Addaddresscart addaddresscartFromJson(String str) =>
    Addaddresscart.fromJson(json.decode(str));

String addaddresscartToJson(Addaddresscart data) => json.encode(data.toJson());

class Addaddresscart {
  bool status;
  String msg;

  Addaddresscart({
    required this.status,
    required this.msg,
  });

  factory Addaddresscart.fromJson(Map<String, dynamic> json) => Addaddresscart(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
