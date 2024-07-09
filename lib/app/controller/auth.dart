import 'dart:convert';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../api_endpoints.dart';
import '../../base_client.dart';
import '../model/active_model.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/login.dart';
import '../model/register.dart';
import '../model/state_model.dart';
import '../view/login/login_screen.dart';
import '../view/login/otp.dart';

class AuthCon extends GetxController with BaseController {
  //Register Controller
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController mailCon = TextEditingController();
  final TextEditingController mobilecon = TextEditingController();
  final TextEditingController restaurntnamecon = TextEditingController();
  final TextEditingController restaurntgstcon = TextEditingController();
  final TextEditingController flatnocon = TextEditingController();
  final TextEditingController towncon = TextEditingController();
  final TextEditingController areacon = TextEditingController();
  final TextEditingController districtcon = TextEditingController();
  final TextEditingController statecon = TextEditingController();
  final TextEditingController pincodecon = TextEditingController();
  final TextEditingController landmarkcon = TextEditingController();
  final TextEditingController countrycon = TextEditingController();

  //Rx<PlatformFile?> kycDoc = Rx<PlatformFile?>(null);

  final TextEditingController otpCon = TextEditingController();
  String selectedtype = 'retail';
  bool value = false;
  int val = 0;
  // int val = -1;
  final database = GetStorage();

  SingleValueDropDownController cnt = SingleValueDropDownController();
  SingleValueDropDownController cnt1 = SingleValueDropDownController();
  SingleValueDropDownController cnt2 = SingleValueDropDownController();
  //
  //
  //
  //
  //
  void signout() {
    database.erase();
    Get.to(LoginScreen());
    // database.read('login');
  }

  bool controltime = true;
  timecount() async {
    while (controltime) {
      await Future.delayed(Duration(milliseconds: 900));
      await active();
      print('object');
    }
  }

  //model api name request
  Register? register;
  // Future<void> registercall(country, state, city) async {
  Future<void> registercall() async {
    var body = {
      "name": nameCon.text,
      "email": mailCon.text,
      "mobile_no": mobilecon.text,
      "user_type": selectedtype,
      // "user_type": 'retail',
      "restrarunt_name": selectedtype == 'retail' ? '' : restaurntnamecon.text,
      "restrarunt_gst": selectedtype == 'retail' ? '' : restaurntgstcon.text,
      "flat_num": selectedtype == 'retail' ? '' : flatnocon.text,
      "town": selectedtype == 'retail' ? '' : towncon.text,
      "area": selectedtype == 'retail' ? '' : areacon.text,
      "district": selectedtype == 'retail' ? '' : cnt.dropDownValue?.name,
      "state": selectedtype == 'retail' ? '' : cnt1.dropDownValue?.name,
      "pincode": selectedtype == 'retail' ? '' : pincodecon.text,
      "land_mark": selectedtype == 'retail' ? '' : landmarkcon.text,
      "country": selectedtype == 'retail' ? '' : cnt2.dropDownValue?.name,
      //"kycDoc": kycDoc.value?.path,
    };
    print(body);

    var response =
        await BaseClient().post(API().register, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      register = registerFromJson(response);
      Get.to(LoginScreen());
      print(register!.data.userId);
      nameCon.clear();
      mailCon.clear();
      // mobilecon.clear();
      selectedtype = '';
      restaurntnamecon.clear();
      restaurntgstcon.clear();
      flatnocon.clear();
      towncon.clear();
      areacon.clear();
      pincodecon.clear();
      landmarkcon.clear();
      // country = '';
      // city = '';
      // cnt2 = '';

      Fluttertoast.showToast(msg: register!.data.userEmailid);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  CountryModel? countrydata;
  List<DropDownValueModel> countrylist = [];
  Future<void> countryapi() async {
    var body = {};
    print(body);
    var response =
        await BaseClient().post(API().country, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);
    if (data['status'] == true) {
      countrydata = countryModelFromJson(response);
      for (int i = 0; i < countrydata!.data!.length; i++) {
        countrylist.add(DropDownValueModel(
            name: '${countrydata!.data![i].name}',
            value: countrydata!.data![i].id));
      }
    }
  }

  StateModel? statedata;
  List<DropDownValueModel> statelist = [];
  Future<void> stateapi(countryid) async {
    var body = {"country_id": countryid};
    print(body);
    var response =
        await BaseClient().post(API().state, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);
    if (data['status'] == true) {
      statedata = stateModelFromJson(response);
      for (int i = 0; i < statedata!.data!.length; i++) {
        statelist.add(DropDownValueModel(
            name: '${statedata!.data![i].stateName}',
            value: statedata!.data![i].stateId));
      }
    }
  }

  CityModel? citydata;
  List<DropDownValueModel> citylist = [];
  Future<void> cityapi(stateid) async {
    var body = {"state_id": stateid};
    print(body);
    var response =
        await BaseClient().post(API().city, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);
    if (data['status'] == true) {
      citydata = cityModelFromJson(response);
      for (int i = 0; i < citydata!.data!.length; i++) {
        citylist.add(DropDownValueModel(
            name: '${citydata!.data![i].cityName}',
            value: citydata!.data![i].cityId));
      }
    }
  }

  Login? logindata;
  Future<void> logincall() async {
    var body = {
      "mobile_no": mobilecon.text,
    };
    print(body);

    var response =
        await BaseClient().post(API().logIn, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      logindata = loginFromJson(response);
      Get.to(otpscreen());
      GetStorage().write('UserID', logindata?.data.userId.toString() ?? '');
      print(logindata?.data.userId);

      Fluttertoast.showToast(msg: logindata!.otp.toString());
      nameCon.clear();
      mailCon.clear();
      mobilecon.clear();
      restaurntnamecon.clear();
      restaurntgstcon.clear();
      flatnocon.clear();
      areacon.clear();
      districtcon.clear();
      statecon.clear();
      pincodecon.clear();
      landmarkcon.clear();
      countrycon.clear();
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  ActiveModel? activedata;
  Future<void> active() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().active, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      activedata = activeModelFromJson(response);
      print(activedata?.msg);
      // Fluttertoast.showToast(msg: mostppcdata!.msg);
    } else {
      // Fluttertoast.showToast(msg: activedata!.msg.toString());
      GetStorage().remove('UserID');
      Get.to(LoginScreen());
    }
  }
}
