// To parse this JSON data, do
//
//     final mostpopularall = mostpopularallFromJson(jsonString);

import 'dart:convert';

Mostpopularall mostpopularallFromJson(String str) =>
    Mostpopularall.fromJson(json.decode(str));

String mostpopularallToJson(Mostpopularall data) => json.encode(data.toJson());

class Mostpopularall {
  bool status;
  String msg;
  List<Datum> data;

  Mostpopularall({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Mostpopularall.fromJson(Map<String, dynamic> json) => Mostpopularall(
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
  String catId;
  String catImg;
  String catName;
  String catDescription;
  DateTime catAddDate;
  DateTime catUpdateDate;
  String catStatus;
  String catIsdeleted;

  Datum({
    required this.catId,
    required this.catImg,
    required this.catName,
    required this.catDescription,
    required this.catAddDate,
    required this.catUpdateDate,
    required this.catStatus,
    required this.catIsdeleted,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        catId: json["cat_id"],
        catImg: json["cat_img"],
        catName: json["cat_name"],
        catDescription: json["cat_description"],
        catAddDate: DateTime.parse(json["cat_add_date"]),
        catUpdateDate: DateTime.parse(json["cat_update_date"]),
        catStatus: json["cat_status"],
        catIsdeleted: json["cat_isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_img": catImg,
        "cat_name": catName,
        "cat_description": catDescription,
        "cat_add_date": catAddDate.toIso8601String(),
        "cat_update_date": catUpdateDate.toIso8601String(),
        "cat_status": catStatus,
        "cat_isdeleted": catIsdeleted,
      };
}
