class BankDetailsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  BankDetailsModel({this.status, this.msg, this.data});

  BankDetailsModel.fromJson(Map<String, dynamic> json) {
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
  List<BankDetails>? bankDetails;

  Data({this.bankDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bank_details'] != null) {
      bankDetails = <BankDetails>[];
      json['bank_details'].forEach((v) {
        bankDetails!.add(new BankDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankDetails != null) {
      data['bank_details'] = this.bankDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankDetails {
  String? bankId;
  String? bankQr;
  String? bankDetails;

  BankDetails({this.bankId, this.bankQr, this.bankDetails});

  BankDetails.fromJson(Map<String, dynamic> json) {
    bankId = json['bank_id'];
    bankQr = json['bank_qr'];
    bankDetails = json['bank_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_id'] = this.bankId;
    data['bank_qr'] = this.bankQr;
    data['bank_details'] = this.bankDetails;
    return data;
  }
}
