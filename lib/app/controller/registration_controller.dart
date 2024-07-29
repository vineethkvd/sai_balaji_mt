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
import '../model/add_product_model.dart';
import '../model/address_model.dart';
import '../model/all_delivery_address.dart';
import '../model/cart.dart';
import '../model/city_model.dart';
import '../model/country_model.dart';
import '../model/delete_address_model.dart';
import '../model/delivery_address_model.dart';
import '../model/my_profile.dart';
import '../model/registration_model.dart';
import '../model/state_model.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../model/user_profile.dart';

class RegistrationController extends GetxController with BaseController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController restaurantNameController = TextEditingController();
  TextEditingController restaurantGstController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController societyAreaController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();

  var type = ["Office", "Home", "Others"];
  var selectedType = ''.obs;
  // Fetch country
  CountryModel? countryData;
  var countryList = <DropDownValueModel>[].obs;
  var selectedCountryName = ''.obs;
  var selectedCountryId = ''.obs;

  Future<void> chkCountryList() async {
    var body = {};

    var response =
        await BaseClient().post(API().country, body).catchError(handleError);

    var data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      countryData = countryModelFromJson(response);
      if (countryData?.data != null) {
        countryList.clear();
        countryList.addAll(countryData!.data!.map((item) {
          return DropDownValueModel(name: item.name!, value: item.id);
        }).toList());
      }
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  // Fetch state
  StateModel? statedata;
  var stateList = <DropDownValueModel>[].obs;
  var selectedStateName = ''.obs;
  var selectedStateId = ''.obs;

  Future<void> chkStateList({required String countryId}) async {
    var body = {"country_id": countryId.toString()};

    var response =
        await BaseClient().post(API().state, body).catchError(handleError);

    var data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      statedata = stateModelFromJson(response);
      if (statedata?.data != null) {
        stateList.clear();
        stateList.addAll(statedata!.data!.map((item) {
          return DropDownValueModel(name: item.stateName!, value: item.stateId);
        }).toList());
      }
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

  // Fetch city
  CityModel? citydata;
  var cityList = <DropDownValueModel>[].obs;
  var selectedCityName = ''.obs;
  var selectedCityId = ''.obs;

  Future<void> chkCityList({required String stateId}) async {
    var body = {"state_id": stateId.toString()};

    var response =
        await BaseClient().post(API().city, body).catchError(handleError);

    var data = json.decode(response);
    print(data);

    if (data['status'] == true) {
      citydata = cityModelFromJson(response);
      if (citydata?.data != null) {
        cityList.clear();
        cityList.addAll(citydata!.data!.map((item) {
          return DropDownValueModel(name: item.cityName!, value: item.cityId);
        }).toList());
      }
    } else {
      Fluttertoast.showToast(msg: data['msg']);
    }
  }

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

  // Registration
  final registrationModel = RegistrationModel().obs;
  var loading = false.obs;

  Future<void> userRegistration({required String userType}) async {
    final uri = Uri.parse(API.userBaseURL + API.userRegister);
    print("baseUrl ${API.userBaseURL + API.userRegister}");
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({
      'x-api-key': 'saibalaji@teckzy',
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    // Add form fields
    request.fields["name"] = nameController.text.trim() ?? '';
    request.fields["email"] = emailController.text.trim() ?? '';
    request.fields["mobile_no"] = phoneController.text.trim() ?? '';
    request.fields["user_type"] = userType;
    request.fields["restrarunt_name"] =
        restaurantNameController.text.trim() ?? '';
    request.fields["restrarunt_gst"] =
        restaurantGstController.text.trim() ?? '';
    request.fields["flat_num"] = flatNoController.text.trim() ?? '';
    request.fields["town"] = townController.text.trim() ?? '';
    request.fields["area"] = societyAreaController.text.trim() ?? '';
    request.fields["district"] = selectedCityId.value.toString() ?? '';
    request.fields["state"] = selectedStateId.value.toString() ?? '';
    request.fields["pincode"] = pinCodeController.text.trim() ?? '';
    request.fields["land_mark"] = landMarkController.text.trim() ?? '';
    request.fields["country"] = selectedCountryId.value.toString() ?? '';

    // Add image file if selected
    if (imagePath.value.isNotEmpty) {
      var profileImage =
          await http.MultipartFile.fromPath("gst_certificate", imagePath.value);
      request.files.add(profileImage);
    }

    // Send the request
    try {
      loading.value = true;
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var decodedData = json.decode(responseData);
      print("decodedData.............................$decodedData");
      registrationModel(RegistrationModel.fromJson(decodedData));
      if (response.statusCode == 200) {
        if (registrationModel.value.status == true) {
          Fluttertoast.showToast(msg: 'Success to register');
        } else {
          Fluttertoast.showToast(msg: registrationModel.value.msg.toString());
        }
      } else {
        Fluttertoast.showToast(msg: 'Failed to register');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      loading.value = false;
    }
  }

  // Clear all fields
  void clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    restaurantNameController.clear();
    restaurantGstController.clear();
    flatNoController.clear();
    townController.clear();
    societyAreaController.clear();
    pinCodeController.clear();
    landMarkController.clear();

    // Clear dropdown selections
    selectedCountryName.value = '';
    selectedCountryId.value = '';
    selectedStateName.value = '';
    selectedStateId.value = '';
    selectedCityName.value = '';
    selectedCityId.value = '';

    // Clear image path
    imagePath.value = '';
  }

  //add delivery address
//available pincode
  DeliveryAddressModel? deliveryAddressModel;
  Future<void> addDeliveryAddress(
      {required String address,
      required String deliveryMobile,
      required String pinCode}) async {
    try {
      loading.value = true;
      var userid = GetStorage().read('UserID').toString();
      var body = {
        "user_id": userid,
        "new_address": address.toString(),
        "delivery_mobile": type.toString(),
        "pincode": pinCode.toString()
      };
      print(body);

      var response = await BaseClient()
          .post(API().addNewAddress, body)
          .catchError(handleError);

      var data = json.decode(response);
      print(data);

      if (data['status'] == true) {
        deliveryAddressModel = DeliveryAddressModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data['msg']);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e");
    } finally {
      loading.value = false;
    }
  }

//fetch profile
  final profileModel = UserProfileModel().obs;

  Future<void> fetchProfile() async {
    print("called");
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };

    try {
      var response =
          await BaseClient().post(API().profile, body).catchError(handleError);
      var data = json.decode(response);

      if (data['status'] == true) {
        profileModel.value = UserProfileModel.fromJson(data);
        // Fluttertoast.showToast(msg: data['msg']);
      } else {
        Fluttertoast.showToast(msg: data['msg']);
      }
    } catch (e) {
      handleError(e);
    }
  }
  //fetch delivery adddress

  final allDeliveryAddressModel = AllDeliveryAddressModel().obs;
  var selectedAddressId = ''.obs;
  var currentAddress = ''.obs;
  var isReadMore = false.obs;
  Future<void> fetchDeliveryAddress() async {
    print("called");
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };

    try {
      var response = await BaseClient()
          .post(API().deliveryAddress, body)
          .catchError(handleError);
      var data = json.decode(response);

      if (data['status'] == true) {
        allDeliveryAddressModel.value = AllDeliveryAddressModel.fromJson(data);
      } else {
        allDeliveryAddressModel.value = AllDeliveryAddressModel.fromJson(data);
        Fluttertoast.showToast(msg: "${allDeliveryAddressModel.value.msg}");
      }
    } catch (e) {
      handleError(e);
    }
  }

  //delete address
  final deleteAddressModel = DeleteAddressModel().obs;
  Future<void> deleteAddress({required String addressId}) async {
    print("called");
    var userid = GetStorage().read('UserID').toString();
    var body = {"user_id": userid, "address_id": addressId};

    try {
      var response = await BaseClient()
          .post(API().deleteDelAddress, body)
          .catchError(handleError);
      var data = json.decode(response);

      if (data['status'] == true) {
        deleteAddressModel.value = DeleteAddressModel.fromJson(data);
        Fluttertoast.showToast(msg: data['msg']);
      } else {
        Fluttertoast.showToast(msg: data['msg']);
      }
    } catch (e) {
      handleError(e);
    }
  }

  //cart
  var cartdata = Cart(status: false, msg: '', data: []).obs;
  var isLoading = false.obs;

  Future<void> fetchCartData() async {
    var userid = GetStorage().read('UserID').toString();
    var body = {
      "user_id": userid,
    };

    try {
      isLoading(true);
      var response =
      await BaseClient().post(API().cart, body).catchError(handleError);
      var data = json.decode(response);

      if (data['status'] == true) {
        cartdata.value = Cart.fromJson(data);
        Fluttertoast.showToast(msg: data['msg']);
      } else {
        Fluttertoast.showToast(msg: data['msg']);
      }
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

  var addProductCartModel = AddProductCartModel().obs;
  Future<void> addToCart({required int proId, required int quantity}) async {
    var userId = GetStorage().read('UserID').toString();
    const apiUrl = "https://saks.teckzy.co.in/User_api/add_to_cart";
    final headers = {
      'x-api-key': 'saibalaji@teckzy',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final requestData = {
      "user_id": userId,
      "pro_id": proId,
      "quantity": quantity
    };
    final jsonBody = json.encode(requestData);

    try {
      final response =
      await http.post(Uri.parse(apiUrl), headers: headers, body: jsonBody);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final addToCart = AddProductCartModel.fromJson(responseData);
        Fluttertoast.showToast(msg: responseData['msg']);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('HTTP Client Exception: $e');
    } on SocketException catch (e) {
      throw Exception('Socket Exception: $e');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }



}
