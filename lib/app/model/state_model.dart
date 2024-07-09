// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
    bool? status;
    int? totalStates;
    List<Datum>? data;

    StateModel({
        this.status,
        this.totalStates,
        this.data,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
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
    String? stateId;
    String? stateName;

    Datum({
        this.stateId,
        this.stateName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stateId: json["state_id"],
        stateName: json["state_name"],
    );

    Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
    };
}
