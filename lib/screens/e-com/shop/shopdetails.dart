import 'package:datingapp/screens/e-com/category/categorydetails.dart';
import 'package:datingapp/screens/e-com/product/individualproductscreen.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/ecom-widget/reusedicon.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  bool lovetappped = false;

  List selecteditems = [];

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whitecolor,
          scrolledUnderElevation: 0,
          toolbarHeight: height * .1,
          actions: <Widget>[
            SizedBox(
              height: height * .1,
              child: SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * .04,
                    ),
                    const BackshadowContainer(),
                    const Spacer(),
                    const Text("Fashion",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: 1,
                            color: blackcolor)),
                    const Spacer(),
                    SizedBox(
                      width: width * .1,
                    ),
                  ],
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: width * .03, right: width * .03),
          child: Column(
            children: [
              SizedBox(
                height: height * .01,
              ),
              Container(
                height: height * .05,
                width: width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: blackcolor,
                  controller: searchcontroller,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    fillColor: whitecolor,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 22,
                      color: otpgrey,
                    ),
                    hintText: "Search Products",
                    contentPadding:
                        const EdgeInsets.only(left: 20, top: 9, bottom: 8),
                    hintStyle:
                        const TextStyle(fontSize: 12, color: Color(0xff6B6B6B)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: whitecolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: whitecolor, width: 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 13.0,
                    height: 1,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B6B6B),
                  ),
                  // maxLines: maxLines,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                width: width,
                height: height * .84,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() =>
                                                const IndividualProductScreen());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: primary
                                                        .withOpacity(.5))),
                                            width: width * .25,
                                            height: height * .12,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Image.asset(
                                                'images/shop${index + 1}.png',
                                                width: width * .15,
                                                height: height * .08,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(4.0),
                                        //   child: GestureDetector(
                                        //     child: SizedBox(
                                        //       width: 30,
                                        //       height: 30,
                                        //       child: Center(
                                        //           child: Image.asset(
                                        //         "images/loveicon.png",
                                        //         width: width * .035,
                                        //       )),
                                        //     ).asGlass(
                                        //         tintColor: Colors.white,
                                        //         clipBorderRadius:
                                        //             BorderRadius.circular(100)),
                                        //   ),
                                        // ),
                                      ],
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
                                  width: width * .58,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Kavya Silks",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              letterSpacing: .4,
                                              color: blackcolor)),
                                      SizedBox(
                                        height: height * .002,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 4.0),
                                        child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, consectetur adipiscing elit",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 9,
                                                letterSpacing: .4,
                                                color: blackcolor)),
                                      ),
                                      const Oneh(),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          SvgPicture.asset(
                                              "images/whatsapp.svg"),
                                          const Fivew(),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(() =>
                                                  const IndividualCategoryScreen());
                                            },
                                            child: Container(
                                              width: width * .2,
                                              height: height * .042,
                                              decoration: BoxDecoration(
                                                  color: primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: const Center(
                                                child: Heading12font600(
                                                    heading: "View",
                                                    color: whitecolor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: width,
                              child: const Divider(
                                color: Color(0xffFFC0B1),
                                height: 10,
                                thickness: .4,
                              ),
                            )
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
