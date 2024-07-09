// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  bool status;
  String msg;
  Data data;
  int otp;
  int isUser;

  Login({
    required this.status,
    required this.msg,
    required this.data,
    required this.otp,
    required this.isUser,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        otp: json["otp"],
        isUser: json["is_user"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
        "otp": otp,
        "is_user": isUser,
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
