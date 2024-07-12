import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:purie_ui/api_endpoints.dart';
import 'package:purie_ui/app/common/common.dart';
import '../../common/colors.dart';
import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    InitCon init = Get.put(InitCon());

    return Scaffold(
      backgroundColor: AppColor.secondarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Get.to(Bottomsheet());
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: init.catdetaildata!.images.length,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: API().imagebaseURL + init.catdetaildata!.images[itemIndex].the0,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 3,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        enableInfiniteScroll: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {},
                      ),
                    ),
                    SizedBox(height: 15),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              init.catdetaildata!.data[0].proName,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.sp,
                                fontFamily: "PoppinsSemibold",
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '500 g',
                                      style: TextStyle(
                                        color: AppColor.mainColor,
                                        fontSize: 14.sp,
                                        fontFamily: "PoppinsSemibold",
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.mainColor,
                                  ),
                                  child: Text(
                                    '₹ ${init.catdetaildata!.data[0].show_price}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontFamily: "PoppinsSemibold",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontFamily: "PoppinsSemibold",
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (quantity > 1) quantity--;
                                        });
                                      },
                                      icon: Icon(Icons.remove_circle_outline),
                                      color: AppColor.mainColor,
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "PoppinsSemibold",
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon: Icon(Icons.add_circle_outline),
                                      color: AppColor.mainColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Item Description:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: "PoppinsSemibold",
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Html(
                                  data: init.catdetaildata!.data[0].proDescription,
                                ),
                              ),
                            ),
                            SizedBox(height: 20), // Add some space below the description
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                await init.addcart(init.catdetaildata!.data[0].proDetailsId);
              },
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              label: Text(
                'ADD TO CART',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: "PoppinsSemibold",
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColor.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
