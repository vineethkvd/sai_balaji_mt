import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../api_endpoints.dart';
import '../../../../base_client.dart';
import '../model/notification_model.dart';



class NotificationController extends GetxController with BaseController {
  NotificationModel? notificationModel;
  var loading=false.obs;
  Future<void> fetchNotifications() async {
    try {
      loading.value = true;
      var userid = GetStorage().read('UserID').toString();
      var body = {

      };
      print(body);

      var response = await BaseClient()
          .post(API().notification, body)
          .catchError(handleError);

      var data = json.decode(response);
      print(data);

      if (data['status'] == true) {
        notificationModel = NotificationModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data['msg']);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    } finally {
      loading.value = false;
    }
  }

}