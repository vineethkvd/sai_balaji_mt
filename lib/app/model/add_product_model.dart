class AddProductCartModel {
  bool? status;
  String? msg;
  Data? data;

  AddProductCartModel({this.status, this.msg, this.data});

  AddProductCartModel.fromJson(Map<String, dynamic> json) {
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
  String? cartId;
  String? proForId;
  String? userForId;
  String? proQuantity;
  String? proPrice;
  String? cartAddDate;
  String? cartUpdatedDate;

  Data(
      {this.cartId,
        this.proForId,
        this.userForId,
        this.proQuantity,
        this.proPrice,
        this.cartAddDate,
        this.cartUpdatedDate});

  Data.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    proForId = json['pro_for_id'];
    userForId = json['user_for_id'];
    proQuantity = json['pro_quantity'];
    proPrice = json['pro_price'];
    cartAddDate = json['cart_add_date'];
    cartUpdatedDate = json['cart_updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['pro_for_id'] = this.proForId;
    data['user_for_id'] = this.userForId;
    data['pro_quantity'] = this.proQuantity;
    data['pro_price'] = this.proPrice;
    data['cart_add_date'] = this.cartAddDate;
    data['cart_updated_date'] = this.cartUpdatedDate;
    return data;
  }
}
