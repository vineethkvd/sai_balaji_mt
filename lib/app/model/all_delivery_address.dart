class AllDeliveryAddressModel {
  bool? status;
  String? msg;
  List<Addresses>? addresses;

  AllDeliveryAddressModel({this.status, this.msg, this.addresses});

  AllDeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? delAdId;
  String? userId;
  String? userAddress;
  String? pincode;
  String? addressType;
  String? createdDate;

  Addresses(
      {this.delAdId,
        this.userId,
        this.userAddress,
        this.pincode,
        this.addressType,
        this.createdDate});

  Addresses.fromJson(Map<String, dynamic> json) {
    delAdId = json['del_ad_id'];
    userId = json['user_id'];
    userAddress = json['user_address'];
    pincode = json['pincode'];
    addressType = json['address_type'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['del_ad_id'] = this.delAdId;
    data['user_id'] = this.userId;
    data['user_address'] = this.userAddress;
    data['pincode'] = this.pincode;
    data['address_type'] = this.addressType;
    data['created_date'] = this.createdDate;
    return data;
  }
}
