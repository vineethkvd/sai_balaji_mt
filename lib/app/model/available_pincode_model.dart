class AvailablePinCodeModel {
  bool? status;
  String? msg;
  List<Data>? data;

  AvailablePinCodeModel({this.status, this.msg, this.data});

  AvailablePinCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Pincodes>? pincodes;

  Data({this.pincodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['pincodes'] != null) {
      pincodes = <Pincodes>[];
      json['pincodes'].forEach((v) {
        pincodes!.add(new Pincodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pincodes != null) {
      data['pincodes'] = this.pincodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pincodes {
  String? avlId;
  String? locationName;
  String? pincode;

  Pincodes({this.avlId, this.locationName, this.pincode});

  Pincodes.fromJson(Map<String, dynamic> json) {
    avlId = json['avl_id'];
    locationName = json['location_name'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avl_id'] = this.avlId;
    data['location_name'] = this.locationName;
    data['pincode'] = this.pincode;
    return data;
  }
}
