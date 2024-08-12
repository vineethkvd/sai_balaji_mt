class NotificationModel {
  bool? status;
  String? msg;
  List<Data>? data;

  NotificationModel({this.status, this.msg, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? notifyId;
  String? notifications;
  String? notifyCreate;

  Data({this.notifyId, this.notifications, this.notifyCreate});

  Data.fromJson(Map<String, dynamic> json) {
    notifyId = json['notify_id'];
    notifications = json['notifications'];
    notifyCreate = json['notify_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notify_id'] = this.notifyId;
    data['notifications'] = this.notifications;
    data['notify_create'] = this.notifyCreate;
    return data;
  }
}
