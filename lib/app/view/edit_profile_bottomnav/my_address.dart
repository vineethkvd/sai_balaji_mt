import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';
import 'package:purie_ui/app/view/home_screen/home_screen.dart';

import '../../controller/init.dart';
import '../checkout/checkout2.dart';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = 'AIzaSyC0q0wLhTHPjGaNAF6qvtRMNHIb0ETRmS0';
var p;
double? lat;
double? lng;

class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  InitCon init = Get.put(InitCon());
  Future<void> displayPrediction(
      Prediction? p, ScaffoldMessengerState messengerState) async {
    if (p == null) {
      return;
    }

    // get detail (lat/lng)
    final _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    final detail = await _places.getDetailsByPlaceId(p.placeId!);
    final geometry = detail.result.geometry!;

    lat = geometry.location.lat;
    lng = geometry.location.lng;
    init.deliverynewcon.text = p.description.toString();

    messengerState.showSnackBar(
      SnackBar(
        content: Text('${p.description}  - $lat/$lng'),
      ),
    );
  }

  Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    Future<void> _handlePressButton() async {
      void onError(PlacesAutocompleteResponse response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.errorMessage ?? 'Unknown error'),
          ),
        );
      }

      // show input autocomplete with selected mode
      // then get the Prediction selected
      p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'in',
        components: [Component(Component.country, 'in')],
        // TODO: Since we supports Flutter >= 2.8.0
        // ignore: deprecated_member_use
        resultTextStyle: Theme.of(context).textTheme.titleMedium,
      );

      await displayPrediction(p, ScaffoldMessenger.of(context));
    }

    InitCon init = Get.put(InitCon());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // drawer: Drawer(
        //   child: DrawerWidget(),
        // ),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: kcolor1),
          backgroundColor: Colors.white,
          title: Text(
            'Address',
            style: TextStyle(
                color: kcolor1,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: (() {}),
          //       icon: Icon(
          //         Icons.person,
          //         color: kcolor1,
          //       )),
          // ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                kbox20,
                InkWell(
                  onTap: () {
                    _handlePressButton();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber,
                            border: Border.all(color: kcolor1)),
                        child: p == null
                            ? Center(
                                child: Text(
                                'Select Address From Google',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))
                            : Center(
                                child: Text(
                                'Change Address',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                  ),
                ),
                //   Text(lat ?? ''),
                kbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.deliverynewcon,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Select from above',
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                kbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.flatnonewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter Flat No/House No',
                      labelText: 'Flat No/House No',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.blue,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.phonenewcon,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      labelText: 'Phone Number ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.townnewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter Town/Block',
                      labelText: 'Town/Block ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.areanewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter Society/Area',
                      labelText: 'Society/Area ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.districtnewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter District',
                      labelText: 'District ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.statenewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter State',
                      labelText: 'State ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.pincodenewcon,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      hintText: 'Enter Pincode',
                      labelText: 'Pincode ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.landmarknewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter Landmark',
                      labelText: 'Landmark ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: init.countrynewcon,
                    decoration: InputDecoration(
                      hintText: 'Enter Country',
                      labelText: 'Country ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kcolor1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    cursorColor: Colors.black,
                    style: TextStyle(color: kcolor1),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: ElevatedButton(
                      onPressed: (() async {
                        if (init.flatnonewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the name');
                        } else if (init.phonenewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the phone number');
                        } else if (init.townnewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the town name');
                        } else if (init.areanewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the area');
                        } else if (init.districtnewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the District ');
                        } else if (init.statenewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the State');
                        } else if (init.pincodenewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the pinCode');
                        } else if (init.landmarknewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the landmark');
                        } else if (init.countrynewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter the country');
                        } else if (init.phonenewcon.text.length <
                            10) {
                          Fluttertoast.showToast(
                              msg:
                                  'Please enter the phone number correctly');
                        } else if (init.pincodenewcon.text.length <
                            6) {
                          Fluttertoast.showToast(
                              msg:
                                  'Please enter the pin code correctly');
                        } else if (init.deliverynewcon.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  'Please select the address from google');
                        } else {
                          await init.changeaddresscart();
                          await init.checkout();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CheckoutAnother()));
                        }
                      }),
                      child: Text(
                        'Save Details',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcolor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
