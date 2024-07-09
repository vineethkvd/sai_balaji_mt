import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../api_endpoints.dart';
import '../../common/common.dart';
import '../../controller/init.dart';
import '../bottom_nav/cart_bottom_nav.dart';
import '../bottom_nav/profile_bottom_nav.dart';
import '../product/product_detail.dart';

class CategoryListEach extends StatefulWidget {
  const CategoryListEach({super.key});

  @override
  State<CategoryListEach> createState() => _CategoryListEachState();
}

class _CategoryListEachState extends State<CategoryListEach> {
  @override
  Widget build(BuildContext context) {
    InitCon init = Get.put(InitCon());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kcolor1),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Each Cate',
          style: TextStyle(
              color: kcolor1, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 1.5),
                itemCount: init.productbysubcatedata?.data.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 5,
                      color: Colors.white70,
                      // shadowColor: kcolor1.shade300,
                      // color: Colors.white24,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 15,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () async {
                                      await init.catdetail(init
                                          .productbysubcatedata!
                                          .data[index]
                                          .proDetailsId);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail()));
                                    },
                                    child: Image.network(API().imagebaseURL +
                                        init.productbysubcatedata!.data[index]
                                            .proImage1)),
                              ),
                            ),
                            kbox20,
                            Text(
                              init.productbysubcatedata?.data[index].proName ??
                                  '',
                              style: TextStyle(
                                  color: kcolor1, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹  ' +
                                  init.productbysubcatedata!.data[index]
                                      .showPrice,
                              style: TextStyle(
                                  color: kcolor1, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await init.addcart(init.productbysubcatedata!
                                    .data[index].proDetailsId);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => CartBottomNav()),
                                // );
                              },
                              child: Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kcolor1,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
