import 'package:datingapp/screens/e-com/orderscreen/individualorderdetails.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * .01,
                                right: width * .03,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        child: Text("# 234ed",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 16,
                                                letterSpacing: .4,
                                                color: primary)),
                                      ),
                                    ],
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
                                            Text("Delivered",
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
                                        Text("12-10-2024",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .4,
                                                color: blackcolor)),
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
                                    child: const Text("Summer Top",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 12,
                                            letterSpacing: .4,
                                            color: blackcolor)),
                                  );
                                }),
                            SizedBox(
                              height: height * .015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    reorderConfirmation(context);
                                  },
                                  child: Container(
                                    width: width * .22,
                                    height: height * .055,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: whitecolor,
                                      border: Border.all(color: primary),
                                    ),
                                    child: const Center(
                                      child: Text("ReOrder",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy',
                                              fontSize: 11,
                                              color: primary)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
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
                                SizedBox(
                                  width: width * .03,
                                ),
                              ],
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

  void reorderConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DialogBox();
      },
    );
  }
}

class DialogBox extends StatefulWidget {
  const DialogBox({
    super.key,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width * .8,
        height: height * .25,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: width * .05, top: height * .01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .01,
                ),
                const Text("Replace Cart?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy',
                        fontSize: 20,
                        color: blackcolor)),
                SizedBox(
                  height: height * .015,
                ),
                SizedBox(
                  width: width * .6,
                  child: const Text(
                      "Are you sure you want to remove item from cart to buy this product.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          color: Color(0xff434343))),
                ),
                SizedBox(
                  height: height * .015,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: width * .35,
                        height: height * .055,
                        decoration: BoxDecoration(
                            color: const Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  color: blackcolor)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * .015,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: width * .35,
                        height: height * .055,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text("Replace Cart",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15,
                                    color: whitecolor))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
