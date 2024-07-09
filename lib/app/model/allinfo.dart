// To parse this JSON data, do
//
//     final allinfo = allinfoFromJson(jsonString);

import 'dart:convert';

Allinfo allinfoFromJson(String str) => Allinfo.fromJson(json.decode(str));

String allinfoToJson(Allinfo data) => json.encode(data.toJson());

class Allinfo {
  bool status;
  List<Datum> data;

  Allinfo({
    required this.status,
    required this.data,
  });

  factory Allinfo.fromJson(Map<String, dynamic> json) => Allinfo(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String infoId;
  String about;
  String term;
  String privacy;
  String refund;
  String mobile;
  String email;
  String address;
  dynamic companyName;

  Datum({
    required this.infoId,
    required this.about,
    required this.term,
    required this.privacy,
    required this.refund,
    required this.mobile,
    required this.email,
    required this.address,
    this.companyName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        infoId: json["info_id"],
        about: json["about"],
        term: json["term"],
        privacy: json["privacy"],
        refund: json["refund"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        companyName: json["company_name"],
      );

  Map<String, dynamic> toJson() => {
        "info_id": infoId,
        "about": about,
        "term": term,
        "privacy": privacy,
        "refund": refund,
        "mobile": mobile,
        "email": email,
        "address": address,
        "company_name": companyName,
      };
}
