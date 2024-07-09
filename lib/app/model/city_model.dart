// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    bool? status;
    int? totalStates;
    List<Datum>? data;

    CityModel({
        this.status,
        this.totalStates,
        this.data,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        totalStates: json["total_states"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total_states": totalStates,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? cityId;
    String? cityName;

    Datum({
        this.cityId,
        this.cityName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cityId: json["city_id"],
        cityName: json["city_name"],
    );

    Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "city_name": cityName,
    };
}
