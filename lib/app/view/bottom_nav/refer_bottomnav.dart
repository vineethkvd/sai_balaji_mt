import 'package:flutter/material.dart';
import 'package:purie_ui/app/common/common.dart';

import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';

class ReferBottomNav extends StatelessWidget {
  const ReferBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: kcolor1),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Refer Page',
            style: TextStyle(
                color: kcolor1, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileBottomNav()),
                  );
                }),
                icon: Icon(
                  Icons.person,
                  color: kcolor1,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height * .82),
                width: (MediaQuery.of(context).size.width),
                // color: Colors.red,
                decoration: const BoxDecoration(
                    //  borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.asset('assets/images/nature12.png')),
                    kbox20,
                    const Text(
                      'Refer Your Friends, Earn Cashback',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 25,
                          //color: Colors.transparent,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Center(
                              child: Text(
                            'SURAJ3025',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                        Container(
                          width: 50,
                          height: 25,
                          //color: Colors.transparent,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                              child: Text(
                            'COPY',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Invite your friends to join crediplus and get Rs 50 paytm cashback for each friend that joins using your referral code',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Your friend also gets Rs 50 off on his crediplus membership',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'INVITE NOW',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.9,
                                  MediaQuery.of(context).size.height / 20))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
