import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/common/colors.dart';
import 'package:purie_ui/app/common/common.dart';
import 'package:purie_ui/app/view/home_screen/list_of_cate.dart';
import 'package:purie_ui/app/view/home_screen/single_category.dart';

import '../../../api_endpoints.dart';
import '../../controller/init.dart';
import '../bottom_nav/bottom_main.dart';
import '../drawer/drawer.dart';

class CategoryAll extends StatefulWidget {
  const CategoryAll({super.key});

  @override
  State<CategoryAll> createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  InitCon init = Get.put(InitCon());

  callapi() async {
    await init.mostpopularcate();
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
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        backgroundColor: AppColor.secondarycolor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),

          // leading: IconButton(
          //   icon: Icon(
          //     Icons.keyboard_backspace,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     Get.to(Bottomsheet());
          //   },
          // ),
          backgroundColor:  AppColor.mainColor,
          centerTitle: true,
          title: Text(
            'Category',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: "poppinssemibold",
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          init.mostppcdata?.data == null
              ? Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Center(child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 150,
                          childAspectRatio: 1 / 1.1),
                      itemCount: init.mostppcdata?.data.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            await init.productbysubcatecall(
                                init.mostppcdata!.data[index].catId);
                            Get.to(
                              transition: Transition.leftToRight,
                              preventDuplicates: true,
                              SingleCategory(
                                topic: init.mostppcdata!.data[index].catName,
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SingleCategory(
                            //             topic: init
                            //                 .mostppcdata!.data[index].catName,
                            //           )),
                            // );
                          },
                          child: Card(
                            color: AppColor.primarycolor,
                            elevation: 5,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 7,
                              // height: MediaQuery.of(context).size.height / 15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: CircleAvatar(
                                        radius: 45,
                                        backgroundImage: NetworkImage(
                                            API().imagebaseURL +
                                                init.mostppcdata!.data[index]
                                                    .catImg)
                                        // child: Column(children: [
                                        //   // Image.network(API().imagebaseURL +
                                        //   //     init.mostppcdata!.data[index].catImg),
                                        // ]),
                                        ),
                                  ),
                                  kbox10,
                                  Column(
                                    children: [
                                      Text(
                                        init.mostppcdata!.data[index].catName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: "poppinssemibold",
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ])));
  }
}
