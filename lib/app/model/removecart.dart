// To parse this JSON data, do
//
//     final removecart = removecartFromJson(jsonString);

import 'dart:convert';

Removecart removecartFromJson(String str) =>
    Removecart.fromJson(json.decode(str));

String removecartToJson(Removecart data) => json.encode(data.toJson());

class Removecart {
  bool status;
  String msg;

  Removecart({
    required this.status,
    required this.msg,
  });

  factory Removecart.fromJson(Map<String, dynamic> json) => Removecart(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
