import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';

import '../../common/common.dart';
import '../../controller/init.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
      backgroundColor: AppColor.secondarycolor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),

        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor:  AppColor.mainColor,
        centerTitle: true,
        title: Text(
          'Terms and conditions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(children: [
            Html(
              data: init.allinfodata?.data[0].term ?? '',
            )
          ]),
        ]),
      ),
    );
  }
}
