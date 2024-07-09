// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    bool? status;
    String? msg;
    Data? data;

    Profile({
        this.status,
        this.msg,
        this.data,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    String? userId;
    String? userUsername;
    String? userName;
    String? userEmailid;
    String? userMobileno;
    String? userState;
    String? userDistrict;
    String? userType;
    String? restraruntName;
    String? restraruntGst;
    String? userFlatNum;
    String? userTown;
    String? userArea;
    String? userCountry;
    String? userLandMark;

    Data({
        this.userId,
        this.userUsername,
        this.userName,
        this.userEmailid,
        this.userMobileno,
        this.userState,
        this.userDistrict,
        this.userType,
        this.restraruntName,
        this.restraruntGst,
        this.userFlatNum,
        this.userTown,
        this.userArea,
        this.userCountry,
        this.userLandMark,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userUsername: json["user_username"],
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userState: json["user_state"],
        userDistrict: json["user_district"],
        userType: json["user_type"],
        restraruntName: json["restrarunt_name"],
        restraruntGst: json["restrarunt_gst"],
        userFlatNum: json["user_flat_num"],
        userTown: json["user_town"],
        userArea: json["user_area"],
        userCountry: json["user_country"],
        userLandMark: json["user_land_mark"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_username": userUsername,
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_state": userState,
        "user_district": userDistrict,
        "user_type": userType,
        "restrarunt_name": restraruntName,
        "restrarunt_gst": restraruntGst,
        "user_flat_num": userFlatNum,
        "user_town": userTown,
        "user_area": userArea,
        "user_country": userCountry,
        "user_land_mark": userLandMark,
    };
}
