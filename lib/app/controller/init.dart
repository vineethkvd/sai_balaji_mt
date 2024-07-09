import 'dart:convert';
import 'dart:developer';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purie_ui/app/model/cart.dart';
import 'package:purie_ui/app/view/info/shipping.dart';

import '../../api_endpoints.dart';
import '../../base_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/addaddress.dart';
import '../model/addcart.dart';
import '../model/addqty.dart';
import '../model/addresslist.dart';
import '../model/allinfo.dart';
import '../model/available_pincode_model.dart';
import '../model/catdetail.dart';
import '../model/changeaddress.dart';
import '../model/checkout.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/home.dart';
import '../model/mostppc.dart';
import '../model/my_profile.dart';
import '../model/myorderdetail.dart';
import '../model/myorders.dart';
import '../model/paid.dart';
import '../model/payment_world.dart';
import '../model/productbysubcate.dart';
import '../model/removecart.dart';
import '../model/state_model.dart';
import '../model/update_profile.dart';
import '../view/edit_profile_bottomnav/my_address.dart';
import '../view/myorder/order_detail.dart';

class InitCon extends GetxController with BaseController {
  TextEditingController locationSearchController = TextEditingController();
  late TextEditingController deliverynewcon = TextEditingController();
  final TextEditingController flatnonewcon = TextEditingController();
  final TextEditingController townnewcon = TextEditingController();
  final TextEditingController areanewcon = TextEditingController();
  final TextEditingController districtnewcon = TextEditingController();
  final TextEditingController statenewcon = TextEditingController();
  final TextEditingController pincodenewcon = TextEditingController();
  final TextEditingController landmarknewcon = TextEditingController();
  final TextEditingController countrynewcon = TextEditingController();
  final TextEditingController phonenewcon = TextEditingController();

  final TextEditingController chkPinCode = TextEditingController();
  var indexSelected = 20.obs;

  //editprofile

  final TextEditingController editname = TextEditingController();
  final TextEditingController editemail = TextEditingController();
  final TextEditingController editflat = TextEditingController();
  final TextEditingController edittown = TextEditingController();
  final TextEditingController editarea = TextEditingController();
  final TextEditingController editcounrty = TextEditingController();
  final TextEditingController editlandmark = TextEditingController();

  // void getHome() async {
  //   var body = {
  //     "api_key": API().gapikey,
  //   };
  //   var response = await BaseClient()
  //       .post(API().home, json.encode(body))
  //       .catchError(handleError);
  //   if (response == null) return;
  //   var data = json.decode(response);

  //   if (data['status'] == "Success") {
  //     Fluttertoast.showToast(msg: data['msg']);
  //     banner.value = data["Slider"];
  //     homeoption.value = data["home_options"];
  //     secondbanner.value = data["banner"];
  //     servicerequestdata.value = data["home_service"];
  //   }
  // }

  Home? homedata;
  Future<void> homecall() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().home, body).catchError(handleError);
    print('rrrrrrrrrrrrrrrr' + response);
    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      homedata = homeFromJson(response);
      print(homedata?.data[0].banners[0].banId);
      // Fluttertoast.showToast(msg: homedata!.data[0].banners[0].banId);
    } else {
      // Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Mostpopularall? mostppcdata;
  Future<void> mostpopularcate() async {
    var body = {
      // "user_id": '1',
    };
    print(body);

    var response =
        await BaseClient().post(API().allmpc, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      mostppcdata = mostpopularallFromJson(response);
      print(mostppcdata?.data[0].catDescription);
      // Fluttertoast.showToast(msg: mostppcdata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  // Subcategory? subcategorydata;
  // Future<void> subcategorycall(CatId) async {
  //   var userid = GetStorage().read('UserID').toString();
  //   var body = {
  //     "cat_id": CatId,
  //     "user_id": userid,
  //   };
  //   print(body);

  //   var response = await BaseClient()
  //       .post(API().subcategory, body)
  //       .catchError(handleError);

  //   var data;
  //   data = json.decode(response);
  //   print(data);

  //   if (data['status'] == true) {
  //     subcategorydata = subcategoryFromJson(response);
  //     print(subcategorydata?.data[0].subCatName);
  //     // Fluttertoast.showToast(msg: subcategorydata!.msg);
  //   } else {
  //     Fluttertoast.showToast(msg: data['msg']);
  //   }
  // }

  //
  //
  Productbysubcategory? productbysubcatedata;
  Future<void> productbysubcatecall(CatId) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "cat_id": CatId,
      "user_id": userid,
    };
    print(body);

    var response = await BaseClient()
        .post(API().productbysub, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      productbysubcatedata = productbysubcategoryFromJson(response);
      print(productbysubcatedata?.data[0].proDescription);
      // Fluttertoast.showToast(msg: productbysubcatedata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Catdetail? catdetaildata;
  Future<void> catdetail(proid) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "pro_id": proid,
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().catdetail, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      catdetaildata = catdetailFromJson(response);
      print(catdetaildata?.data[0].proDescription);
      // Fluttertoast.showToast(msg: catdetaildata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Cart? cartdata;
  Future<void> cart() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().cart, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      cartdata = cartFromJson(response);
      // Fluttertoast.showToast(msg: cartdata!.data[0].proDescription);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Addcart? addcartdata;
  Future<void> addcart(proid) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
      "pro_id": proid,
    };
    print(body);

    var response =
        await BaseClient().post(API().addcart, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      addcartdata = addcartFromJson(response);
      print(addcartdata?.data.cartId);
      Fluttertoast.showToast(msg: addcartdata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Removecart? removecartdata;
  Future<void> removecart(cartid) async {
    var body = {
      "cart_id": cartid,
    };
    print(body);

    var response =
        await BaseClient().post(API().removecart, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      removecartdata = removecartFromJson(response);
      print(removecartdata?.msg);
      // Fluttertoast.showToast(msg: removecartdata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Addqty? addquantity;
  Future<void> addqty(cartid, qtyadd) async {
    showLoading();
    var body = {
      "cart_id": cartid,
      "qty": qtyadd.toString(),
    };
    print(body);

    var response = await BaseClient()
        .post(API().addquantity, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      hideLoading();
      addquantity = addqtyFromJson(response);
      print(addquantity?.msg);
      // Fluttertoast.showToast(msg: addquantity!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Addresslist? addresslistdata;
  Future<void> addresslist() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().addaddress, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      addresslistdata = addresslistFromJson(response);
      print(addresslistdata?.msg);
      // Fluttertoast.showToast(msg: addresslistdata!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  // Addresslist? deleteaddresslistdata;
  Future<void> deleteaddresslist(addressid) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
      "add_id": addressid,
    };
    print(body);

    var response = await BaseClient()
        .post(API().deleteaddaddress, body)
        .catchError(handleError);

    Fluttertoast.showToast(msg: "Address Deleted Succefully");
  }

  Checkout? checkoutdata;
  Future<void> checkout() async {
    var userid = GetStorage().read('UserID').toString();
    //showLoading();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().checkout, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      //hideLoading();
      checkoutdata = checkoutFromJson(response);
      print(checkoutdata?.msg);
      // Fluttertoast.showToast(msg: checkoutdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Changeaddress? changeaddressdata;
  Future<void> changeaddress(addressid) async {
    var userid = GetStorage().read('UserID').toString();
    showLoading();
    var body = {
      "user_id": userid,
      "add_id": addressid,
    };
    print(body);

    var response = await BaseClient()
        .post(API().changeaddress, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      hideLoading();
      changeaddressdata = changeaddressFromJson(response);
      print(changeaddressdata?.msg);
      // Fluttertoast.showToast(msg: changeaddressdata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Addaddresscart? changenewaddress;
  Future<void> changeaddresscart() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
      "bill_mobile_no": phonenewcon.text,
      "flat_num": flatnonewcon.text,
      "town": townnewcon.text,
      "area": areanewcon.text,
      "district": districtnewcon.text,
      "state": statenewcon.text,
      "pincode": pincodenewcon.text,
      "land_mark": landmarknewcon.text,
      "country": countrynewcon.text,
      "glocation": deliverynewcon.text,
      "latitude": lat.toString(),
      "longitude": lng.toString(),
    };
    print(body);

    var response = await BaseClient()
        .post(API().addaddresscart, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      changenewaddress = addaddresscartFromJson(response);
      print(changenewaddress?.msg);

      phonenewcon.clear();
      flatnonewcon.clear();
      townnewcon.clear();
      areanewcon.clear();
      districtnewcon.clear();
      statenewcon.clear();
      pincodenewcon.clear();
      landmarknewcon.clear();
      countrynewcon.clear();
      // Fluttertoast.showToast(msg: changenewaddress!.msg);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Allinfo? allinfodata;
  Future<void> allinfo() async {
    var body = {
      // "user_id": '1',
    };
    print(body);

    var response =
        await BaseClient().post(API().allinfo, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      allinfodata = allinfoFromJson(response);
      print(allinfodata!.data[0].mobile);
      // Fluttertoast.showToast(msg: allinfodata!.msg);
    } else {
      // Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Paid? getpaiddata;
  Future<void> getpaid(
    addressid,
    surgecharge,
    shipcharge,
  ) async {
    var userid = GetStorage().read('UserID').toString();
    showLoading();

    var body = {
      "user_id": userid,
      "payment_type": '1',
      "add_id": addressid,
      "surge_charge": surgecharge,
      "shipping_charge": shipcharge,
    };
    print(body);

    var response =
        await BaseClient().post(API().paid, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      hideLoading();
      getpaiddata = paidFromJson(response);
      print(getpaiddata?.msg);
      print("${getpaiddata?.url}wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      // Fluttertoast.showToast(msg: getpaiddata!.msg);
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Myorder? orderdata;
  Future<void> myorders() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().myorders, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      orderdata = myorderFromJson(response);
      // Fluttertoast.showToast(msg: orderdata!.data[0].orderId);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Myorderdetail? orderdetaildata;
  Future<void> myordersdetail(orderid) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
      "order_id": orderid,
    };
    print(body);

    var response = await BaseClient()
        .post(API().myordersdetail, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      orderdetaildata = myorderdetailFromJson(response);
      // Fluttertoast.showToast(msg: orderdetaildata!.data.items[0].proName);
      Get.to(OrderDetail(),
          transition: Transition.leftToRight,
          duration: Duration(milliseconds: 300),
          preventDuplicates: true);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Profile? profiledata;
  Future<void> myprofile() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response =
        await BaseClient().post(API().profile, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      profiledata = profileFromJson(response);
      editname.text = profiledata!.data!.userName.toString();
      editemail.text = profiledata!.data!.userEmailid.toString();
      editflat.text = profiledata!.data!.userFlatNum.toString();
      edittown.text = profiledata!.data!.userTown.toString();
      editarea.text = profiledata!.data!.userArea.toString();
      editlandmark.text = profiledata!.data!.userLandMark.toString();
      // Fluttertoast.showToast(msg: orderdetaildata!.data.items[0].proName);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  Updateprofile? updateprofiledata;
  Future<void> updateprofile(cnt, cnt1, cnt2) async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
      "user_name": editname.text,
      "user_emailid": editemail.text,
      "user_flat_num": editflat.text,
      "user_town": edittown.text,
      "user_area": editarea.text,
      "user_country": cnt,
      "user_state": cnt1,
      "user_district": cnt2,
      "user_land_mark": editlandmark.text,
    };
    print(body);

    var response = await BaseClient()
        .post(API().updateprofile, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      updateprofiledata = updateprofileFromJson(response);
      Fluttertoast.showToast(msg: data['msg']);
      // Fluttertoast.showToast(msg: orderdetaildata!.data.items[0].proName);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  //
  //
  //
  //
  // Profile? payment;

  // var datafull = '';
  // Future<void> mypayment() async {
  //   var userid = GetStorage().read('UserID').toString();
  //   var body = {
  //     "OrderId": "3423424234",
  //     "amount": "1000",
  //     "currencyName": "INR",
  //     "mid": "WL0000000027698",
  //     "meTransReqType": "S",
  //     "enckey": "6375b97b954b37f956966977e5753ee6",
  //     "responseUrl": "localhost/test/response.php"
  //   };
  //   print(body);

  //   var response =
  //       await BaseClient().post(API().payment, body).catchError(handleError);

  //   var data = response;
  //   // data = json.decode(response);
  //   print(data);
  //   datafull = data;
  //   print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + datafull);

  //   // if (data['status'] == true) {
  //   //   profiledata = profileFromJson(response);

  //   //   // Fluttertoast.showToast(msg: orderdetaildata!.data.items[0].proName);
  //   // } else {
  //   //   Fluttertoast.showToast(msg: data['msg']);
  //   // }
  // }

  //
  //
  Paymentapi? paymentdata;
  Future<void> paymentworldline() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "OrderId": "3423424234",
      "amount": "1000",
      "currencyName": "INR",
      "mid": "WL0000000027698",
      "meTransReqType": "S",
      "enckey": "6375b97b954b37f956966977e5753ee6",
      "responseUrl": "localhost/test/response.php"
    };
    print(body);

    var response =
        await BaseClient().post(API().payment, body).catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    paymentdata = paymentapiFromJson(response);
    // Fluttertoast.showToast(msg: data['msg']);
    print(paymentdata!.data);
  }

  //
  //
  //
  Future<void> reqpayment() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "merchantRequest": "aa",
      "MID": "aa",
    };
    print(body);

    var response = await BaseClient()
        .post(API().updateprofile, body)
        .catchError(handleError);

    var data;
    data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      updateprofiledata = updateprofileFromJson(response);
      Fluttertoast.showToast(msg: data['msg']);
      // Fluttertoast.showToast(msg: orderdetaildata!.data.items[0].proName);
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

  //available pincode
  AvailablePinCodeModel? availablePinCodeModel;
  Future<void> chkAvailPinCode() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };
    print(body);

    var response = await BaseClient()
        .post(API().availablePincode, body)
        .catchError(handleError);

    var data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      availablePinCodeModel = AvailablePinCodeModel.fromJson(data);
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  bool isPinCodeAvailable(String pinCode) {
    if (availablePinCodeModel?.data != null) {
      for (var data in availablePinCodeModel!.data!) {
        for (var pincode in data.pincodes!) {
          if (pincode.pincode == pinCode) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
