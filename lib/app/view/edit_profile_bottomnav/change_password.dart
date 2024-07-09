import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/bottom_nav/profile_bottom_nav.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';
import 'package:purie_ui/app/view/home_screen/home_screen.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: Drawer(child: DrawerWidget(),),
        appBar: AppBar(
          iconTheme: IconThemeData(color: kcolor1),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          title: Text(
            'Change Password',
            style: TextStyle(
                color: kcolor1, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.person,
                  color: kcolor1,
                )),
          ],
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              kbox60,
              Text(
                'Change Your Password',
                style: TextStyle(
                    fontSize: 30, color: kcolor1, fontWeight: FontWeight.bold),
              ),
              kbox40,
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Old Password',
                    labelText: 'Old Password',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kcolor1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  cursorColor: Colors.blue,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              kbox20,
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter New Password',
                    labelText: 'New Password',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kcolor1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(color: kcolor1),
                ),
              ),
              kbox20,
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: ElevatedButton(
                    onPressed: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileBottomNav()));
                    }),
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kcolor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
