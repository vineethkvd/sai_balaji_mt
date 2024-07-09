// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  bool status;
  String msg;
  Data data;

  Register({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
  String userId;
  String userUsername;
  String userName;
  String userEmailid;
  String userMobileno;
  String userType;

  Data({
    required this.userId,
    required this.userUsername,
    required this.userName,
    required this.userEmailid,
    required this.userMobileno,
    required this.userType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userUsername: json["user_username"],
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_username": userUsername,
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_type": userType,
      };
}
