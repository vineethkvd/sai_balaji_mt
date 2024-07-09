// To parse this JSON data, do
//
//     final updateprofile = updateprofileFromJson(jsonString);

import 'dart:convert';

Updateprofile updateprofileFromJson(String str) =>
    Updateprofile.fromJson(json.decode(str));

String updateprofileToJson(Updateprofile data) => json.encode(data.toJson());

class Updateprofile {
  bool status;
  String msg;

  Updateprofile({
    required this.status,
    required this.msg,
  });

  factory Updateprofile.fromJson(Map<String, dynamic> json) => Updateprofile(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
