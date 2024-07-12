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
          automaticallyImplyLeading: false,
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
              :Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 200,
                childAspectRatio: 0.8,
              ),
              itemCount: init.mostppcdata?.data.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    await init.productbysubcatecall(init.mostppcdata!.data[index].catId);
                    Get.to(
                      transition: Transition.leftToRight,
                      preventDuplicates: true,
                      SingleCategory(
                        topic: init.mostppcdata!.data[index].catName,
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: Colors.grey.withOpacity(0.2),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [AppColor.primarycolor.withOpacity(0.7), AppColor.primarycolor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              API().imagebaseURL + init.mostppcdata!.data[index].catImg,
                            ),
                          ),
                          SizedBox(height: 10),
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
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ])));
  }
}
