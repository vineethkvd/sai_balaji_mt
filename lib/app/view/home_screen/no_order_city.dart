import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../common/common.dart';
import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';

class Noorder extends StatefulWidget {
  const Noorder({super.key});

  @override
  State<Noorder> createState() => _NoorderState();
}

class _NoorderState extends State<Noorder> {
  InitCon init = Get.put(InitCon());
  late SingleValueDropDownController _cnt;
  @override
  initState() {
    _cnt = SingleValueDropDownController();
    // setState(() {});
  }

  @override
  void dispose() {
    _cnt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Now Only Available in Thirupathi')));
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: kcolor1),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            // title: Text(
            //   'Sai Balaji',
            //   style: TextStyle(
            //       color: kcolor1, fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            actions: [
              Container(
                height: 10,
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropDownTextField(
                      // initialValue: "name4",
                      controller: _cnt,
                      clearOption: true,
                      // enableSearch: true,
                      // dropdownColor: Colors.green,
                      // searchDecoration: const InputDecoration(
                      //   hintText: "enter your custom hint text here",
                      // ),
                      textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Select City',
                          contentPadding: EdgeInsets.only(left: 10, top: 3),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 12)),
                      dropDownItemCount: 6,

                      dropdownColor: Colors.white,
                      // initialValue: 'Thirupathi',
                      dropDownIconProperty: IconProperty(color: Colors.black),
                      textStyle: TextStyle(fontSize: 16, color: Colors.black),
                      dropDownList: const [
                        DropDownValueModel(
                          name: 'Thirupathi',
                          value: "value1",
                        ),
                        DropDownValueModel(
                          name: 'Chennai',
                          value: "value2",
                        ),
                        DropDownValueModel(name: 'Trichy', value: "value3"),
                        DropDownValueModel(
                          name: 'Madurai',
                          value: "value4",
                        ),
                        DropDownValueModel(name: 'Coimbatore', value: "value5"),
                        // DropDownValueModel(name: 'name6', value: "value6"),
                        // DropDownValueModel(name: 'name7', value: "value7"),
                        // DropDownValueModel(name: 'name8', value: "value8"),
                      ],
                      onChanged: (val) {
                        // DropDownValueModel cityname = val;
                        if (val.name == 'Thirupathi') {
                          Get.to(Bottomsheet());
                        } else {
                          Get.to(Noorder());
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/nolocation.json'),
              Text(
                textAlign: TextAlign.center,
                'Product Not Available in Your Location',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
