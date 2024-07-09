import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/edit_profile_bottomnav/change_password.dart';
import 'package:purie_ui/app/view/login/login_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/images/teja.png'),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: kcolor1),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sai Balaji Sea Foods',
                    style: TextStyle(
                      fontSize: 25,
                      color: kcolor1,
                    ),
                  ),
                ),
              ),
              kbox60,
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: kcolor1, fontWeight: FontWeight.bold, fontSize: 30),
              ),
              kbox20,
              Text(
                'Recover your password',
                style: TextStyle(
                    color: kcolor1,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              kbox20,
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kcolor1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(color: kcolor1),
                ),
              ),
              kbox40,
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  }),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcolor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              kbox20,
              TextButton(
                  onPressed: (() {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
                  child: Text(
                    'Go to Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kcolor1,
                        fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
