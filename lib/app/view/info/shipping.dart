import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../common/common.dart';
import '../../controller/init.dart';

class shipping extends StatefulWidget {
  const shipping({super.key});

  @override
  State<shipping> createState() => _shippingState();
}

class _shippingState extends State<shipping> {
  InitCon init = Get.put(InitCon());

  callapi() async {
    await init.allinfo();
    setState(() {});
  }

  @override
  initState() {
    callapi();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: kcolor1,
          ),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Title(
              color: kcolor1,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  'Shipping',
                  style: TextStyle(color: kcolor1),
                ),
              )),
        ),
      ),
      body: Column(children: [
        Column(children: [
          Html(
            data: init.allinfodata?.data[0].refund ?? '',
          )
        ]),
      ]),
    );
  }
}
