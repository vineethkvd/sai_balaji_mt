import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../api_endpoints.dart';
import '../../base_client.dart';
import '../model/bank_detail_model.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/delivery_address_model.dart';
import '../model/registration_model.dart';
import '../model/state_model.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class PaymentController extends GetxController with BaseController {
  TextEditingController amountPayOnline = TextEditingController();
  TextEditingController amountCheckPayment = TextEditingController();
  TextEditingController transactionID = TextEditingController();
  TextEditingController checkNumber = TextEditingController();
  // Pick image from gallery
  var imagePath = ''.obs;

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (imageFile != null) {
      return File(imageFile.path);
    }
    return null;
  }

  //available pincode
  final bankDetailsModel = BankDetailsModel().obs;
  Future<void> fetchBankDetails() async {
    var body = {};
    print(body);

    var response =
        await BaseClient().post(API().getBank, body).catchError(handleError);

    var data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      bankDetailsModel.value = BankDetailsModel.fromJson(data);
      // Fluttertoast.showToast(msg: data['msg']);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }
}
