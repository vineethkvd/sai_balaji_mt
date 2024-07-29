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
    setState(() {});
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    _cnt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(

        child: Scaffold(
          drawer: const DrawerWidget(),
          key: _key,
          backgroundColor: AppColor.secondarycolor,
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(onPressed: () {
              _key.currentState!.openDrawer();
            }, icon: Icon(Icons.menu)),
            actions: [IconButton(onPressed: () {
              
            }, icon: Icon(Icons.notifications,color: Colors.white,))],
            backgroundColor:  AppColor.mainColor,
            centerTitle: true,
            title: ClipRRect(borderRadius: BorderRadius.circular(10),child: Container(color: Colors.white,child: Image.asset("assets/images/logo.png",width: 100,))),
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
                        child:  Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 5,
                          child: ListView.builder(
                            itemCount: init.homedata?.data[0].categories.length ?? 0,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await init.productbysubcatecall(init.homedata?.data[0].categories[index].catId);
                                  Get.to(
                                    SingleCategory(
                                      topic: init.homedata!.data[0].categories[index].catName.toString(),
                                    ),
                                    transition: Transition.native,
                                    duration: const Duration(milliseconds: 300),
                                    preventDuplicates: true,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(
                                        colors: [AppColor.primarycolor.withOpacity(0.7), AppColor.primarycolor],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width / 3.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                              API().imagebaseURL + init.homedata!.data[0].categories[index].catImg,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            init.homedata!.data[0].categories[index].catName,
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
                        )
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: init.homedata?.data[0].getProducts.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = init.homedata?.data[0].getProducts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await init.catdetail(product?.proDetailsId);
                            Get.to(const ProductDetail(),
                                transition: Transition.native,
                                duration: Duration(milliseconds: 300),
                                preventDuplicates: true);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.network(
                                      API().imagebaseURL + "${product?.proImage1}",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${product?.proName}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: "PoppinsSemiBold",
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '₹ ${product?.showPrice}',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () async {
                                          await init.addcart(product?.proDetailsId);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColor.mainColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add to cart',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
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
