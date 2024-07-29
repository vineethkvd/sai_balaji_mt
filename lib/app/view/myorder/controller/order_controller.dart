import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../api_endpoints.dart';
import '../../../../base_client.dart';
import '../model/order_product.dart';


class OrderProductController extends GetxController with BaseController {
  OrderProductModel? orderProductModel;
  var loading=false.obs;
  Future<void> fetchOrderDetails() async {
    try {
      loading.value = true;
      var userid = GetStorage().read('UserID').toString();
      var body = {
        "user_id": userid,
      };
      print(body);

      var response = await BaseClient()
          .post(API().userOrder, body)
          .catchError(handleError);

      var data = json.decode(response);
      print(data);

      if (data['status'] == true) {
        orderProductModel = OrderProductModel.fromJson(data);
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