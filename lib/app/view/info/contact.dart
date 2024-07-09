import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/colors.dart';
import '../../common/common.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // final Uri _url = Uri.parse('support@Seafoodexpress.com');
  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

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
                  'Contact us',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 20.sp,
                    fontFamily: "poppinssemibold",
                  ),
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.justify,
            "Please contact us for any questions or comments (including all inquiries unrelated to copyright infringement) regarding this Platform.",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Grievance Officer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.justify,
            "The name and contact details of the Grievance Officer are provided below:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Mr. Rama Krishnan',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Sai Balaji Sea Foods',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Reg Office:  #48, Venkatesan Street,',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Chintadripet, Chennai – 600 002',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Email:  support@Seafoodexpress.com',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Time:  Mon - Fri (9: 00 - 18: 00)',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
