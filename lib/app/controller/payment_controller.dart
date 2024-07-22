import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:purie_ui/app/view/bottom_nav/bottom_main.dart';

import '../../api_endpoints.dart';
import '../../base_client.dart';
import '../custom_snackbar.dart';
import '../model/bank_detail_model.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/delivery_address_model.dart';
import '../model/payment_model.dart';
import '../model/registration_model.dart';
import '../model/state_model.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class PaymentController extends GetxController with BaseController {
  TextEditingController amountPayOnline = TextEditingController();
  TextEditingController payableAmount = TextEditingController();
  TextEditingController amountCheckPayment = TextEditingController();
  TextEditingController transactionID = TextEditingController();
  TextEditingController checkNumber = TextEditingController();
  // Pick image from gallery
  var imagePath = ''.obs;
  var loading = false.obs;

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (imageFile != null) {
      imagePath.value = imageFile.path;
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

  // Registration
  final paymentModel = PaymentModel().obs;
  Future<void> placeOrder(
      {required String type,
        required String addressId,
        required String pinCode,
        required String amount,
        required String finalAmount,
        required String chkNo,required String transId}) async {
    final uri = Uri.parse(API.userBaseURL + API.placeOrder);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({
      'x-api-key': 'saibalaji@teckzy',
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    var userid = GetStorage().read('UserID').toString();
    request.fields["user_id"] = userid;
    request.fields["pay_type"] = type;
    request.fields["add_id"] = addressId;
    request.fields["pincode"] = pinCode;
    request.fields["final_amount"] = finalAmount;
    request.fields["amount"] = amount;
    request.fields["cheque_no"] = chkNo.trim();
    request.fields["transfer_id"] = transId;

    if (imagePath.value.isNotEmpty) {
      var profileImage = await http.MultipartFile.fromPath(
          "cheque_image", imagePath.value);
      request.files.add(profileImage);
    }

    try {
      loading.value = true;
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var decodedData = json.decode(responseData);
      print("decodedData.............................$decodedData");
      paymentModel(PaymentModel.fromJson(decodedData));
      if (response.statusCode == 200) {
        if (paymentModel.value.status == true) {
          CustomSnackBar.showCustomSnackBar(
              message: "Success", title: '${paymentModel.value.msg.toString()}');
          Get.offAll(Bottomsheet(),transition: Transition.cupertino);
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Error", title: '${paymentModel.value.msg.toString()}');
        }
      } else {
        Fluttertoast.showToast(msg: 'Failed to register');
      }
    } catch (e) {
      if (e is SocketException) {
        Fluttertoast.showToast(msg: 'No Internet connection');
      } else if (e is HttpException) {
        Fluttertoast.showToast(msg: 'Couldn\'t find the post');
      } else if (e is FormatException) {
        Fluttertoast.showToast(msg: 'Bad response format');
      } else {
        Fluttertoast.showToast(msg: 'An unexpected error occurred');
      }
    } finally {
      loading.value = false;
    }
  }
}
