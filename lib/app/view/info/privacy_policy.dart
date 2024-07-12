import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/init.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
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
        backgroundColor: AppColor.mainColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Html(
            data: init.allinfodata?.data[0].privacy ?? '',
          )
        ]),
      ),
    );
  }
}
