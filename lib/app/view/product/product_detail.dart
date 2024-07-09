import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/api_endpoints.dart';
import 'package:purie_ui/app/common/common.dart';
import '../../common/colors.dart';
import '../../controller/init.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    InitCon init = Get.put(InitCon());
    String dropdownvalue = 'Item1';

    List<String> product_images = [
      'assets/images/nature4.jpg',
      'assets/images/nature2.jpg',
      'assets/images/nature3.jpg'
    ];

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
                    'Product details',
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
          child: Column(
            children: [
              //SizedBox(height: 10,),
              Container(
                  width: MediaQuery.of(context).size.width / 0.8,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(),
                  child: Image.network(
                      API().imagebaseURL + init.catdetaildata!.images[0].the0)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      init.catdetaildata!.data[0].proName,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        shape: BoxShape.rectangle,
                        color: AppColor.mainColor),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '₹ ' + init.catdetaildata!.data[0].show_price,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  /*Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/weight.png',
                      height: 30,
                      width: 40,
                    ),
                  ),*/
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.scale_outlined,
                      size: 30,
                      color: AppColor.mainColor,
                    ),
                  ),
                  Text(
                    '500 g',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: "poppinssemibold",
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Item description:',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.1,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ]
                      //border: Border.all()
                      ),
                  child: Html(
                    data: init.catdetaildata!.data[0].proDescription,
                    //  Text(
                    //  ,
                    //   style: TextStyle(color: Colors.black, fontSize: 12),
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton.icon(
                      onPressed: (() async {
                        await init
                            .addcart(init.catdetaildata!.data[0].proDetailsId);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CartBottomNav()),
                        // );
                      }),
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      label: Text(
                        'ADD TO CART',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
