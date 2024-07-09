import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/api_endpoints.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/controller/auth.dart';
import 'package:purie_ui/app/view/drawer/drawer.dart';
import 'package:purie_ui/app/view/home_screen/single_category.dart';
import 'package:purie_ui/app/view/product/product_detail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/init.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

AuthCon auth = Get.put(AuthCon());

class _HomeScreenState extends State<HomeScreen> {
  // var currentIndex = 0;
  // final pages = [
  //   const HomeScreen(),
  //   const CartBottomNav(),
  //   const ShopBottomNav(),
  //   const ReferBottomNav(),
  //   const CategoryBottomNav(),
  //   const ProfileBottomNav(),
  // ];

  int activePage = 0;
  List<String> imagesSlider = [
    'assets/images/balaji_sea_food_banner1.jpg',
    'assets/images/balaji_sea_food_banner2.jpg',
    'assets/images/balaji_sea_food_banner3.jpg'
  ];

  List<String> circleAvatar = [
    'assets/images/slider1.jpg',
    'assets/images/slider2.jpg',
    'assets/images/slider3.jpg',
    'assets/images/slider4.jpg',
    'assets/images/slider1.jpg',
  ];
  InitCon init = Get.put(InitCon());
  /*var citylist = [
    DropDownValueModel(
      name: 'Thirupathi',
      value: "value1",
    ),
    DropDownValueModel(
      name: 'Chennai',
      value: "value2",
    ),
    DropDownValueModel(name: 'Trichy', value: "value3"),
    DropDownValueModel(
      name: 'Madurai',
      value: "value4",
    ),
    DropDownValueModel(name: 'Coimbatore', value: "value5"),
    
  ];*/
  var citylist = [
    const DropDownValueModel(name: 'Thirupathi', value: "value1"),
    const DropDownValueModel(name: 'Chennai', value: "value2"),
    const DropDownValueModel(name: 'Trichy', value: "value3"),
    const DropDownValueModel(name: 'Madurai', value: "value4"),
    const DropDownValueModel(name: 'Coimbatore', value: "value5"),
    const DropDownValueModel(name: 'vellore', value: "value6"),
  ];

  callapi() async {
    // locationdata().checkGps();
    await init.homecall();
    await auth.timecount();
    // await timecount();
    setState(() {});
  }

  SingleValueDropDownController _cnt = SingleValueDropDownController();
  @override
  initState() {
    callapi();
    _cnt = SingleValueDropDownController();
    // setState(() {});
  }

  @override
  void dispose() {
    _cnt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.secondarycolor,
          // bottomNavigationBar: BottomNavBar(),
          drawer: const Drawer(
            child: DrawerWidget(),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            automaticallyImplyLeading: true,
            backgroundColor: AppColor.mainColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'SKIPL',
              style: TextStyle(
                color:Colors.white,
                fontSize: 18.sp,
                fontFamily: "poppinssemibold",
              ),
            ),
            actions: [
              /*Container(
                height: 10.h,
                width: 140.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropDownTextField(
                      controller: _cnt,
                      clearOption: true,
                      textFieldDecoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Thirupathi',
                        contentPadding: EdgeInsets.only(left: 10, top: 3),
                        hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      dropDownItemCount: 6,
                      dropdownColor: Colors.white,
                      dropDownIconProperty: IconProperty(color: Colors.black),
                      textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                      dropDownList: citylist,
                      onChanged: (val) {
                        print('Selected: ' + val.toString());
                        if (val.name == 'Thirupathi') {
                          Get.back();
                        } else {
                          Get.to(
                            const Noorder(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),*/
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      itemCount: init.homedata?.data[0].banners.length ?? 0,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                API().imagebaseURL +
                                    init.homedata!.data[0].banners[index].banImg,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: init.homedata!.data[0].banners.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColor.mainColor,
                    dotHeight: 5,
                    dotWidth: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "poppinsbold",
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       // await init.mostpopularcate();
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const CategoryAll()),
                    //       );
                    //     },
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           'View All',
                    //           style: TextStyle(fontSize: 12),
                    //         ),
                    //         SizedBox(
                    //           width: 5,
                    //         ),
                    //         Icon(
                    //           Icons.expand_circle_down,
                    //           color: kcolor1,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                // kbox10,
                init.homedata?.data[0].categories.isEmpty ?? true
                    ? Text(
                        'There is no  category',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "poppinsbold",
                          color: AppColor.mainColor,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 5,
                          child: ListView.builder(
                            itemCount:
                                init.homedata?.data[0].categories.length ?? 0,
                            // padding: const EdgeInsets.all(8.0),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await init.productbysubcatecall(init
                                      .homedata?.data[0].categories[index].catId);
                                  Get.to(
                                    SingleCategory(
                                      topic: init.homedata!.data[0]
                                          .categories[index].catName
                                          .toString(),
                                    ),
                                    transition: Transition.downToUp,
                                    duration: const Duration(milliseconds: 300),
                                    preventDuplicates: true,
                                  );
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SingleCategory(
                                  //             topic: init.homedata?.data[0]
                                  //                 .categories[index].catName
                                  //                 .toString(),
                                  //           )),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColor.primarycolor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                        )
                                      ],
                                    ),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3.4,
                                      // height: MediaQuery.of(context).size.height / 15,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: CircleAvatar(
                                                radius: 40,
                                                backgroundImage: NetworkImage(
                                                    API().imagebaseURL +
                                                        init
                                                            .homedata!
                                                            .data[0]
                                                            .categories[index]
                                                            .catImg)),
                                          ),
                                          kbox10,
                                          Text(
                                            init.homedata!.data[0].categories[index]
                                                .catName,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: "poppinssemibold",
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                kbox10,
                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Text(
                    'Newly Added Products',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "poppinssemibold",
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
                kbox10,
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  child:
                      //  init.homedata!.data[0].getProducts == ''
                      //     ? CircularProgressIndicator()
                      //     :
                      ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: init.homedata?.data[0].getProducts.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.primarycolor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 1,
                                blurRadius: 7,
                              )
                            ],
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          // height: MediaQuery.of(context).size.height / 15,
                          child: Column(
                            children: [
                              Container(
                                // height: MediaQuery.of(context).size.height / 4.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () async {
                                        await init.catdetail(init.homedata?.data[0]
                                            .getProducts[index].proDetailsId);
                                        Get.to(ProductDetail(),
                                            transition: Transition.downToUp,
                                            duration: Duration(milliseconds: 300),
                                            preventDuplicates: true);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ProductDetail()));
                                      },
                                      child: Container(
                                        // color: Colors.amber,

                                        width: 300,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                              API().imagebaseURL +
                                                  init.homedata!.data[0]
                                                      .getProducts[index].proImage1,
                                              fit: BoxFit.cover),
                                        ),
                                      )),
                                ),
                              ),
                              kbox10,
                              Container(
                                width: 150,
                                child: Text(
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  init.homedata!.data[0].getProducts[index].proName,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "poppinssemibold",
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                ' ₹ ' +
                                    init.homedata!.data[0].getProducts[index]
                                        .showPrice,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await init.addcart(init.homedata!.data[0]
                                      .getProducts[index].proDetailsId);
                                  // Fluttertoast.showToast(
                                  //     msg: 'Product added to yhe cart');
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => CartBottomNav()),
                                  // );
                                },
                                child: Text(
                                  'Add to cart',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.mainColor,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /*Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 8, right: 8, top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/img4.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),*/
                //kbox20,
                // Container(
                //   height: MediaQuery.of(context).size.height / 2.5,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Card(
                //         elevation: 5,
                //         color: Colors.white70,
                //         // shadowColor: kcolor1.shade300,
                //         // color: Colors.white24,
                //         child: Container(
                //           width: MediaQuery.of(context).size.width / 2.5,
                //           height: MediaQuery.of(context).size.height / 2.5,
                //           child: Column(
                //             children: [
                //               Container(
                //                   //width: MediaQuery.of(context).size.width,
                //                   height: MediaQuery.of(context).size.height / 4,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: InkWell(
                //                         onTap: () {
                //                           Navigator.pushReplacement(
                //                               context,
                //                               MaterialPageRoute(
                //                                   builder: (context) =>
                //                                       ProductDetail()));
                //                         },
                //                         child: Image.asset(
                //                             'assets/images/display_item1.jpg')),
                //                   )),
                //               kbox10,
                //               Text(
                //                 'Fish Meat/KG.',
                //                 style: TextStyle(
                //                     color: kcolor1, fontWeight: FontWeight.bold),
                //               ),
                //               Text(
                //                 'Rs.65/-',
                //                 style: TextStyle(
                //                     color: kcolor1, fontWeight: FontWeight.bold),
                //               ),
                //               ElevatedButton(
                //                 onPressed: () {
                //                   Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => CartBottomNav()),
                //                   );
                //                 },
                //                 child: Text('Add to cart'),
                //                 style: ElevatedButton.styleFrom(
                //                     backgroundColor: kcolor1,
                //                     elevation: 10,
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(30))),
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     itemCount: 10,
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height / 4,
                //   width: MediaQuery.of(context).size.width,
                //   child: Image.asset(
                //     'assets/images/banner2.jpg',
                //     fit: BoxFit.fill,
                //   ),
                // ),
                // kbox10,
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
