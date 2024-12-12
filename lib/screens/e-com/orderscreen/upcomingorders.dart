import 'package:datingapp/screens/e-com/orderscreen/individualorderdetails.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingOrders extends StatefulWidget {
  const UpcomingOrders({super.key});

  @override
  State<UpcomingOrders> createState() => _UpcomingOrdersState();
}

class _UpcomingOrdersState extends State<UpcomingOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          width: width,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: shadowcolor.withOpacity(.4),
                              // offset: const Offset(2, 6),
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * .02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * .01,
                                right: width * .03,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "images/ordericon.png",
                                    height: height * .11,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                    child: Text("3 Items",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 14,
                                            letterSpacing: .4,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                    child: Text("# 3212w",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 16,
                                            letterSpacing: .4,
                                            color: primary)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * .03,
                                right: width * .03,
                              ),
                              child: Container(
                                width: width,
                                decoration: BoxDecoration(
                                    color: offwhite,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * .03,
                                      right: width * .03,
                                      top: 10,
                                      bottom: 10),
                                  child: const Center(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Estimated Arrival",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 12,
                                                    letterSpacing: .4,
                                                    color: Color(0xff747474))),
                                            Text('10:00AM',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 12,
                                                    letterSpacing: .4,
                                                    color: blackcolor)),
                                          ],
                                        ),
                                        Spacer(),
                                        Text("On The Way",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 14,
                                                letterSpacing: .4,
                                                color: green)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * .03,
                                right: width * .03,
                              ),
                              child: const Text("Product Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Gilroy',
                                      fontSize: 12,
                                      letterSpacing: .4,
                                      color: Color(0xff747474))),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: 3,
                                itemBuilder: (context, dataindex) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: width * .03, top: 2, bottom: 2),
                                    child: const Text("Jacket",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 12,
                                            letterSpacing: .4,
                                            color: blackcolor)),
                                  );
                                }),
                            Padding(
                              padding: EdgeInsets.only(right: width * .03),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => const IndividualOrderDetails());
                                  },
                                  child: Container(
                                    width: width * .3,
                                    height: height * .055,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primary.withOpacity(.3),
                                    ),
                                    child: const Center(
                                      child: Text("Order Detailes",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy',
                                              fontSize: 11,
                                              color: whitecolor)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                          ],
                        ),
                      )));
            },
          ),
        ),
        SizedBox(
          height: height * .08,
        )
      ])),
    );
  }
}
