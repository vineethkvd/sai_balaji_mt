import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../api_endpoints.dart';
import '../../common/common.dart';
import '../../controller/init.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    InitCon init = Get.put(InitCon());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: kcolor1, borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Order Detail',
          style: TextStyle(color: kcolor1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kcolor1),
                    onPressed: ()async{
                      Random random = new Random();
                      int randomNumber = random.nextInt(400);

                      await Dio().download(
                         "https://teckzy.co.in/seafood/mpdf/"+ init.orderdata!.data[0].orderUniqId+".pdf",
                          "/storage/emulated/0/Download" + "/" + "pay history${randomNumber!.toString()}.pdf");

                      Fluttertoast.showToast(msg: 'Downloaded');

                    }, child: Text('Download Invoice')),
              ),
              ListView.builder(
                shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemCount: init.orderdetaildata?.data.items.length ?? 0,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          // color: Colors.amber,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                API().imagebaseURL +
                                    init.orderdetaildata!.data.items[index]
                                        .proImage1,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                       // TextButton(onPressed: (){}, child: Text('Download Invoice'))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              init.orderdetaildata?.data.items[index].proName ??
                                  '',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 300,
                              child: Text(
                                'Weight :  500g',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                          Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 30,
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    shape: BoxShape.rectangle,
                                    color: kcolor1),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '₹ ' +
                                            init.orderdetaildata!.data
                                                .items[index].proPrice,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Not included GST',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                         /*
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [

                                Column(
                                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [


                                  ],
                                ),
                              ],
                            ),
                          ),
                          */
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //           width: 300,
                    //           child: Html(
                    //             data: init.orderdetaildata!.data.items[index]
                    //                 .proDescription,
                    //             // style: TextStyle(
                    //             //     color: Colors.black87,
                    //             //     fontSize: 16,
                    //             //     fontWeight: FontWeight.w500),
                    //           )),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [
                          Container(
                              width: 300,
                              child: Text(
                                'Quantity :  ${init.orderdetaildata!.data.items[index].proForQuantity}',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              width: 300,
                              child: Text(
                                'Order Date :  ' +
                                    DateFormat.MMMEd().format(init
                                        .orderdetaildata!
                                        .data
                                        .items[index]
                                        .orderCreated),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Address:  ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            width: 350,
                            child: Column(
                              children: [
                                Text(
                                  init.orderdetaildata!.data.deliveredAddress.flatNum +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.town +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.area +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.district +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.state +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.country +
                                      ', ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.landMark +
                                      ' - ' +
                                      init.orderdetaildata!.data
                                          .deliveredAddress.pincode,
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                ),
                               // Text('Hi')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Divider(
                        color: kcolor1,
                        thickness: 2,
                      ),
                    )
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
