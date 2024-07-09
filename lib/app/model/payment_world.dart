// To parse this JSON data, do
//
//     final paymentapi = paymentapiFromJson(jsonString);

import 'dart:convert';

Paymentapi paymentapiFromJson(String str) =>
    Paymentapi.fromJson(json.decode(str));

String paymentapiToJson(Paymentapi data) => json.encode(data.toJson());

class Paymentapi {
  String data;

  Paymentapi({
    required this.data,
  });

  factory Paymentapi.fromJson(Map<String, dynamic> json) => Paymentapi(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
