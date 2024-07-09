// To parse this JSON data, do
//
//     final paid = paidFromJson(jsonString);

import 'dart:convert';

Paid paidFromJson(String str) => Paid.fromJson(json.decode(str));

String paidToJson(Paid data) => json.encode(data.toJson());

class Paid {
    bool? status;
    String? msg;
    Data? data;
    String? url;

    Paid({
        this.status,
        this.msg,
        this.data,
        this.url,
    });

    factory Paid.fromJson(Map<String, dynamic> json) => Paid(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
        "url": url,
    };
}

class Data {
    String? userId;
    String? orderId;
    int? amount;
    DateTime? createdDt;
    String? name;
    String? city;
    String? state;
    String? citizenship;
    String? mobileNo;
    String? emailId;

    Data({
        this.userId,
        this.orderId,
        this.amount,
        this.createdDt,
        this.name,
        this.city,
        this.state,
        this.citizenship,
        this.mobileNo,
        this.emailId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        orderId: json["order_id"],
        amount: json["amount"],
        createdDt: json["created_dt"] == null ? null : DateTime.parse(json["created_dt"]),
        name: json["name"],
        city: json["city"],
        state: json["state"],
        citizenship: json["citizenship"],
        mobileNo: json["mobile_no"],
        emailId: json["email_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "order_id": orderId,
        "amount": amount,
        "created_dt": createdDt?.toIso8601String(),
        "name": name,
        "city": city,
        "state": state,
        "citizenship": citizenship,
        "mobile_no": mobileNo,
        "email_id": emailId,
    };
}
