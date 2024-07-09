import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:purie_ui/app/common/common.dart';

import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';

class ShopBottomNav extends StatelessWidget {
  const ShopBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: kcolor1),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Shop',
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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textDirection: TextDirection.ltr,
                        children: [
                          Image.asset('assets/images/nature8.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Fish Masala',
                                  style: TextStyle(
                                      color: kcolor1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Rs.60/-',
                                  style: TextStyle(
                                      color: kcolor1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 35,
                              width: MediaQuery.of(context).size.width / 4,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                    // maximumSize: Size(20, 10),
                                    backgroundColor: kcolor1,
                                    side: BorderSide(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0))),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              );
            }));
  }
}
