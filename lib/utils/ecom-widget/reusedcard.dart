import 'package:datingapp/screens/e-com/product/individualproductscreen.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const IndividualProductScreen());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: width * .43,
                      height: height * .2,
                      child: Image.asset('images/prdt${index + 1}.png',
                          width: width * .4,
                          height: height * .2,
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
              ],
            ),
            SizedBox(
              width: width * .035,
            ),
            SizedBox(
              width: width * .43,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Crop Top",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          fontSize: 12,
                          letterSpacing: .4,
                          color: blackcolor)),
                  SizedBox(
                    height: height * .006,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * .01,
                      ),
                      const Text('Fashion',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Gilroy',
                              fontSize: 9,
                              letterSpacing: .4,
                              color: grey)),
                    ],
                  ),
                  SizedBox(
                    height: height * .006,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text("₹ 200",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Gilroy',
                                fontSize: 9,
                                letterSpacing: .4,
                                color: grey)),
                      ),
                      SizedBox(
                        width: width * .01,
                      ),
                      const Text("₹ 300",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Gilroy',
                              fontSize: 12,
                              letterSpacing: .4,
                              color: blackcolor)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
