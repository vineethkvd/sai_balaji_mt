// To parse this JSON data, do
//
//     final addresslist = addresslistFromJson(jsonString);

import 'dart:convert';

Addresslist addresslistFromJson(String str) =>
    Addresslist.fromJson(json.decode(str));

String addresslistToJson(Addresslist data) => json.encode(data.toJson());

class Addresslist {
  bool status;
  String msg;
  List<Datum> data;

  Addresslist({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Addresslist.fromJson(Map<String, dynamic> json) => Addresslist(
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
  String addStatus;
  String addIsDeleted;

  Datum({
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
    required this.addStatus,
    required this.addIsDeleted,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        addStatus: json["add_status"],
        addIsDeleted: json["add_is_Deleted"],
      );

  Map<String, dynamic> toJson() => {
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
        "add_status": addStatus,
        "add_is_Deleted": addIsDeleted,
      };
}
