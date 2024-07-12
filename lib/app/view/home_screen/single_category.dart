import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:purie_ui/app/view/home_screen/list_of_cate.dart';
import '../../../api_endpoints.dart';
import '../../common/colors.dart';
import '../../common/common.dart';
import '../../controller/init.dart';
import '../product/product_detail.dart';

class SingleCategory extends StatefulWidget {
  final String topic;
  const SingleCategory({required this.topic, super.key});

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

InitCon init = Get.put(InitCon());

class _SingleCategoryState extends State<SingleCategory> {
  List checklist = init.productbysubcatedata?.data ?? [];

  void searchitemto(String query) {
    final suggestions = init.productbysubcatedata!.data.where((s) {
      final partname = s.proName.toString().toLowerCase();
      final input = query.toLowerCase();
      return partname.contains(input);
    }).toList();
    setState(() => checklist = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondarycolor,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        title: Text(
          widget.topic,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "poppinssemibold",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColor.mainColor,
                    width: 2,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.mainColor,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search ${widget.topic}',
                    hintStyle: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 15.sp,
                      fontFamily: "poppinsregular",
                    ),
                  ),
                  cursorColor: AppColor.mainColor,
                  onChanged: (value) {
                    searchitemto(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.4,
                ),
                itemCount: checklist.length,
                itemBuilder: (BuildContext context, int index) {
                  final search = checklist[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                await init.catdetail(
                                  init.productbysubcatedata!.data[index]
                                      .proDetailsId,
                                );
                                Get.to(ProductDetail());
                              },
                              child:  Container(
                                height: 100.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    API().imagebaseURL +
                                        checklist[index].proImage1,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                         Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [ Text(
                           checklist[index].proName ?? '',
                           textAlign: TextAlign.center,
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 14.sp,
                             fontFamily: "poppinssemibold",
                           ),
                         ),
                           SizedBox(
                             height: 5,
                           ),
                           Text(
                             '₹  ' + checklist[index].showPrice,
                             style: const TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                             ),
                           ),],),
                          SizedBox(
                            height: 8,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await init.addcart(
                                init.productbysubcatedata!.data[index]
                                    .proDetailsId
                              );
                            },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.mainColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
