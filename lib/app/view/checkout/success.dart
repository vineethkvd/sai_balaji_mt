import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../bottom_nav/bottom_main.dart';

class successpage extends StatefulWidget {
  const successpage({super.key});

  @override
  State<successpage> createState() => _FailurepageState();
}

class _FailurepageState extends State<successpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/success.png',
          ),
          InkWell(
            onTap: () {
              Get.to(Bottomsheet());
            },
            child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
                child: Center(
                    child: Text(
                  'Go Home',
                  style: TextStyle(color: Colors.white),
                ))),
          )
        ],
      ),
    );
  }
}
