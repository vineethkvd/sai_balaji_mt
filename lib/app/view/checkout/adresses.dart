import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/checkout/checkout2.dart';
import 'package:purie_ui/app/view/edit_profile_bottomnav/my_address.dart';

import '../../controller/init.dart';

class Addresses extends StatefulWidget {
  const Addresses({super.key});

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  InitCon init = Get.put(InitCon());

  callapi() async {
    await init.addresslist();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () async {
              // await init.checkout();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace,
              color: kcolor1,
            )),
        backgroundColor: Colors.white,
        title: Text(
          'My Address',
          style: TextStyle(
              color: kcolor1, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: init.addresslistdata?.data.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      init.indexSelected.value = index;
                      showDialog(
                          context: context,
                          builder: (context) {
                            // bool dismiss = false;
                            return AlertDialog(
                                title: const Text(
                                    "Are you sure you want to Change this address"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        await init.changeaddress(init
                                            .addresslistdata
                                            ?.data[index]
                                            .addId);
                                        await init.checkout();
                                        Get.off(CheckoutAnother());
                                        setState(() {});
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        // dismiss = false;
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ]);
                          });
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: init.indexSelected.value == index
                                      ? Colors.green
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            // textDirection: TextDirection.ltr,
                                            children: [
                                              Container(
                                                // color: Colors.amber,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Address : ',
                                                      style: TextStyle(
                                                          // color: kcolor1,
                                                          // fontWeight: FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.5,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .flatNum +
                                                                ',' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .town +
                                                                ',' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .area +
                                                                ',' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .district +
                                                                ',' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .state +
                                                                ',' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .country +
                                                                ' - ' +
                                                                init
                                                                    .addresslistdata!
                                                                    .data[index]
                                                                    .pincode,
                                                            style: TextStyle(
                                                                color: kcolor1,
                                                                // fontWeight: FontWeight.bold,
                                                                fontSize: 15),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'LandMark : ',
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                        Text(
                                                          init
                                                              .addresslistdata!
                                                              .data[index]
                                                              .landMark,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: kcolor1),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                // bool dismiss = false;
                                                return AlertDialog(
                                                    title: const Text(
                                                        "Are you sure you want to delete this address"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () async {
                                                            await init
                                                                .deleteaddresslist(init
                                                                    .addresslistdata
                                                                    ?.data[
                                                                        index]
                                                                    .addId);
                                                            setState(() {
                                                              callapi();
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: const Text(
                                                              "Yes")),
                                                      TextButton(
                                                          onPressed: () {
                                                            // dismiss = false;
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text("No")),
                                                    ]);
                                              });
                                          // await init.deleteaddresslist(init
                                          //     .addresslistdata
                                          //     ?.data[index]
                                          //     .addId);
                                          // setState(() {
                                          //   callapi();
                                          // });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          kbox10,
                        ],
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAddress()),
                    );
                  },
                  child: Text(
                    'ADD NEW ADDRESS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
