class UserProfileModel {
  bool? status;
  String? msg;
  Data? data;

  UserProfileModel({this.status, this.msg, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? userUsername;
  String? userName;
  String? userEmailid;
  String? userMobileno;
  String? userState;
  String? userDistrict;
  String? userPincode;
  String? userType;
  String? restraruntName;
  String? restraruntGst;
  String? userFlatNum;
  String? userTown;
  String? userArea;
  String? userCountry;
  String? userLandMark;
  String? gstCertificatePath;

  Data(
      {this.userId,
        this.userUsername,
        this.userName,
        this.userEmailid,
        this.userMobileno,
        this.userState,
        this.userDistrict,
        this.userPincode,
        this.userType,
        this.restraruntName,
        this.restraruntGst,
        this.userFlatNum,
        this.userTown,
        this.userArea,
        this.userCountry,
        this.userLandMark,
        this.gstCertificatePath});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userUsername = json['user_username'];
    userName = json['user_name'];
    userEmailid = json['user_emailid'];
    userMobileno = json['user_mobileno'];
    userState = json['user_state'];
    userDistrict = json['user_district'];
    userPincode = json['user_pincode'];
    userType = json['user_type'];
    restraruntName = json['restrarunt_name'];
    restraruntGst = json['restrarunt_gst'];
    userFlatNum = json['user_flat_num'];
    userTown = json['user_town'];
    userArea = json['user_area'];
    userCountry = json['user_country'];
    userLandMark = json['user_land_mark'];
    gstCertificatePath = json['gst_certificate_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_username'] = this.userUsername;
    data['user_name'] = this.userName;
    data['user_emailid'] = this.userEmailid;
    data['user_mobileno'] = this.userMobileno;
    data['user_state'] = this.userState;
    data['user_district'] = this.userDistrict;
    data['user_pincode'] = this.userPincode;
    data['user_type'] = this.userType;
    data['restrarunt_name'] = this.restraruntName;
    data['restrarunt_gst'] = this.restraruntGst;
    data['user_flat_num'] = this.userFlatNum;
    data['user_town'] = this.userTown;
    data['user_area'] = this.userArea;
    data['user_country'] = this.userCountry;
    data['user_land_mark'] = this.userLandMark;
    data['gst_certificate_path'] = this.gstCertificatePath;
    return data;
  }
}
