class AddressModel {
  String? name;
  String? email;
  String? phone;
  String? flatNo;
  String? town;
  String? area;
  String? country;
  String? state;
  String? city;
  String? pincode;
  String? landMark;

  AddressModel(
      {this.name,
        this.email,
        this.phone,
        this.flatNo,
        this.town,
        this.area,
        this.country,
        this.state,
        this.city,
        this.pincode,
        this.landMark});

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    flatNo = json['flat_no'];
    town = json['town'];
    area = json['area'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    landMark = json['land_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['flat_no'] = this.flatNo;
    data['town'] = this.town;
    data['area'] = this.area;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['land_mark'] = this.landMark;
    return data;
  }
}
