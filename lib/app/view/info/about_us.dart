import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';

import '../../common/common.dart';
import '../../controller/init.dart';

class aboutus extends StatefulWidget {
  const aboutus({super.key});

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
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
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.mainColor,
          ),
        ),
        backgroundColor: AppColor.secondarycolor,
        title: Center(
          child: Title(
              color: kcolor1,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  'About us',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 20.sp,
                    fontFamily: "poppinssemibold",
                  ),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Html(
            data: init.allinfodata?.data[0].about ?? '',
          )
        ]),
      ),
    );
  }
}
