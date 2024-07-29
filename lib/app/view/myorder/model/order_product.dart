class OrderProductModel {
  bool? status;
  String? msg;
  List<Data>? data;

  OrderProductModel({this.status, this.msg, this.data});

  OrderProductModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? orUserForId;
  String? orderUniqId;
  String? paymentType;
  String? userAddForId;
  String? orderStatus;
  String? orderCreatedDt;
  String? orderUpdatedDt;
  String? totalAmount;
  String? paymentId;
  String? isCancel;
  String? isRefund;
  String? userType;
  Null? deliveryCharge;
  Null? gst;
  String? distributorId;
  String? finalAmount;
  String? payStatus;
  int? gstPercentage;
  int? gstAmount;
  int? paidAmount;

  Data(
      {this.orderId,
        this.orUserForId,
        this.orderUniqId,
        this.paymentType,
        this.userAddForId,
        this.orderStatus,
        this.orderCreatedDt,
        this.orderUpdatedDt,
        this.totalAmount,
        this.paymentId,
        this.isCancel,
        this.isRefund,
        this.userType,
        this.deliveryCharge,
        this.gst,
        this.distributorId,
        this.finalAmount,
        this.payStatus,
        this.gstPercentage,
        this.gstAmount,
        this.paidAmount});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orUserForId = json['or_user_for_id'];
    orderUniqId = json['order_uniq_id'];
    paymentType = json['payment_type'];
    userAddForId = json['user_add_for_id'];
    orderStatus = json['order_status'];
    orderCreatedDt = json['order_created_dt'];
    orderUpdatedDt = json['order_updated_dt'];
    totalAmount = json['total_amount'];
    paymentId = json['payment_id'];
    isCancel = json['is_cancel'];
    isRefund = json['is_refund'];
    userType = json['user_type'];
    deliveryCharge = json['delivery_charge'];
    gst = json['gst'];
    distributorId = json['distributor_id'];
    finalAmount = json['final_amount'];
    payStatus = json['pay_status'];
    gstPercentage = json['gst_percentage'];
    gstAmount = json['gst_amount'];
    paidAmount = json['paid_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['or_user_for_id'] = this.orUserForId;
    data['order_uniq_id'] = this.orderUniqId;
    data['payment_type'] = this.paymentType;
    data['user_add_for_id'] = this.userAddForId;
    data['order_status'] = this.orderStatus;
    data['order_created_dt'] = this.orderCreatedDt;
    data['order_updated_dt'] = this.orderUpdatedDt;
    data['total_amount'] = this.totalAmount;
    data['payment_id'] = this.paymentId;
    data['is_cancel'] = this.isCancel;
    data['is_refund'] = this.isRefund;
    data['user_type'] = this.userType;
    data['delivery_charge'] = this.deliveryCharge;
    data['gst'] = this.gst;
    data['distributor_id'] = this.distributorId;
    data['final_amount'] = this.finalAmount;
    data['pay_status'] = this.payStatus;
    data['gst_percentage'] = this.gstPercentage;
    data['gst_amount'] = this.gstAmount;
    data['paid_amount'] = this.paidAmount;
    return data;
  }
}
