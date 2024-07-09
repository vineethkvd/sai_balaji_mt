import 'package:flutter/material.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';

import '../drawer/drawer.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: kcolor1),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
              color: kcolor1, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: (() {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const ProfileBottomNav()),
        //         );
        //       }),
        //       icon: Icon(
        //         Icons.person,
        //         color: kcolor1,
        //       )),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: kcolor1),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width / 1,
                      child: Container(
                        // color: Colors.amber,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                90,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[100],
                                    radius: 25,
                                    child: IconButton(
                                      icon: Image.asset(
                                        'assets/images/nature8.png',
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Order Placed',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '10:00 pm',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              300,
                                        ),
                                        Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s,',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              }),
        ]),
      ),
    );
  }
}
