// To parse this JSON data, do
//
//     final activeModel = activeModelFromJson(jsonString);

import 'dart:convert';

ActiveModel activeModelFromJson(String str) => ActiveModel.fromJson(json.decode(str));

String activeModelToJson(ActiveModel data) => json.encode(data.toJson());

class ActiveModel {
    bool? status;
    String? msg;
    List<Datum>? data;

    ActiveModel({
        this.status,
        this.msg,
        this.data,
    });

    factory ActiveModel.fromJson(Map<String, dynamic> json) => ActiveModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? userId;
    String? userUsername;
    String? userName;
    String? userEmailid;
    String? userMobileno;
    String? userAddress;
    String? userState;
    String? userDistrict;
    String? userPincode;
    String? userPassword;
    String? userCpassword;
    String? userType;
    String? restraruntName;
    String? restraruntGst;
    String? userFlatNum;
    String? userTown;
    String? userArea;
    String? userCountry;
    String? userLandMark;
    DateTime? userRegdate;
    dynamic userUpdatedDate;
    String? userIsdeleted;
    String? userStatus;

    Datum({
        this.userId,
        this.userUsername,
        this.userName,
        this.userEmailid,
        this.userMobileno,
        this.userAddress,
        this.userState,
        this.userDistrict,
        this.userPincode,
        this.userPassword,
        this.userCpassword,
        this.userType,
        this.restraruntName,
        this.restraruntGst,
        this.userFlatNum,
        this.userTown,
        this.userArea,
        this.userCountry,
        this.userLandMark,
        this.userRegdate,
        this.userUpdatedDate,
        this.userIsdeleted,
        this.userStatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        userUsername: json["user_username"],
        userName: json["user_name"],
        userEmailid: json["user_emailid"],
        userMobileno: json["user_mobileno"],
        userAddress: json["user_address"],
        userState: json["user_state"],
        userDistrict: json["user_district"],
        userPincode: json["user_pincode"],
        userPassword: json["user_password"],
        userCpassword: json["user_Cpassword"],
        userType: json["user_type"],
        restraruntName: json["restrarunt_name"],
        restraruntGst: json["restrarunt_gst"],
        userFlatNum: json["user_flat_num"],
        userTown: json["user_town"],
        userArea: json["user_area"],
        userCountry: json["user_country"],
        userLandMark: json["user_land_mark"],
        userRegdate: json["user_regdate"] == null ? null : DateTime.parse(json["user_regdate"]),
        userUpdatedDate: json["user_updated_date"],
        userIsdeleted: json["user_isdeleted"],
        userStatus: json["user_status"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_username": userUsername,
        "user_name": userName,
        "user_emailid": userEmailid,
        "user_mobileno": userMobileno,
        "user_address": userAddress,
        "user_state": userState,
        "user_district": userDistrict,
        "user_pincode": userPincode,
        "user_password": userPassword,
        "user_Cpassword": userCpassword,
        "user_type": userType,
        "restrarunt_name": restraruntName,
        "restrarunt_gst": restraruntGst,
        "user_flat_num": userFlatNum,
        "user_town": userTown,
        "user_area": userArea,
        "user_country": userCountry,
        "user_land_mark": userLandMark,
        "user_regdate": userRegdate?.toIso8601String(),
        "user_updated_date": userUpdatedDate,
        "user_isdeleted": userIsdeleted,
        "user_status": userStatus,
    };
}
