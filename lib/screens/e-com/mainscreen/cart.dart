import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingapp/screens/e-com/adress/deliveryadres.dart';
import 'package:datingapp/screens/e-com/orders/orderplaced.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  const Cart({super.key, required this.route});
  final String route;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool typing = false;
  final TextEditingController _couponcontroller = TextEditingController();
  final TextEditingController _ordernotecontroller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int couponnumber = 1;
  List coupons = [
    {'offer': '20%', 'name': 'Cf54D'},
    {'offer': '40%', 'name': 'C6RT4D'},
    {'offer': '40%', 'name': 'C654D'},
    {'offer': '70%', 'name': 'CG44D'},
  ];
  List<Map<String, dynamic>> cartitem = [
    {
      'img': 'images/prdt1.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': false,
      'qty': 2
    },
    {
      'img': 'images/prdt2.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true,
      'qty': 2
    },
    {
      'img': 'images/prdt3.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true,
      'qty': 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whitecolor,
            elevation: 0,
            toolbarHeight: height * .1,
            actions: <Widget>[
              SizedBox(
                width: width * .03,
              ),
              SizedBox(
                height: height * .14,
                child: SizedBox(
                    width: width * .95,
                    child: FadeInDown(
                        from: 10,
                        child: const AppbarSection(heading: "My Cart"))),
              )
            ]),
        body: SizedBox(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * .05, right: width * .05),
                  child: Column(
                    children: [
                      SizedBox(
                        width: width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          itemCount: cartitem.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SizedBox(
                                height: height * .14,
                                child: Column(
                                  children: [
                                    Row(children: [
                                      SlideInLeft(
                                        from: 30,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              cartitem[index]['is_active'] ==
                                                      false
                                                  ? Colors.grey
                                                  : Colors.transparent,
                                              BlendMode.saturation,
                                            ),
                                            child: Image.asset(
                                              cartitem[index]['img'],
                                              width: width * .19,
                                              height: height * .09,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * .04,
                                      ),
                                      SizedBox(
                                        width: width * .62,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            Text(cartitem[index]['name'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 13,
                                                    letterSpacing: .4,
                                                    color: blackcolor)),
                                            SizedBox(
                                              height: height * .002,
                                            ),
                                            Text("₹ ${cartitem[index]['sp']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 15,
                                                    letterSpacing: .4,
                                                    color: cartitem[index]
                                                                ['is_active'] ==
                                                            false
                                                        ? grey
                                                        : primary)),
                                            cartitem[index]['is_active'] ==
                                                    false
                                                ? GestureDetector(
                                                    onTap: () {},
                                                    child: SizedBox(
                                                      width: width,
                                                      height: height * .046,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                              "Unavailable",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Gilroy',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      .4,
                                                                  color:
                                                                      primary)),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: width * .2,
                                                              height:
                                                                  height * .04,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .red),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                    "Remove",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            'Gilroy',
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            .4,
                                                                        color:
                                                                            whitecolor)),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      width: width * .25,
                                                      height: height * .046,
                                                      decoration: BoxDecoration(
                                                          color: whitecolor,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: primary
                                                                  .withOpacity(
                                                                      .15),
                                                              blurRadius: 1,
                                                              spreadRadius: 1,
                                                            ),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (cartitem[
                                                                            index]
                                                                        [
                                                                        "qty"] >
                                                                    1) {
                                                                  cartitem[
                                                                          index]
                                                                      ["qty"]--;
                                                                } else {
                                                                  cartitem
                                                                      .removeAt(
                                                                          index);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              width:
                                                                  width * .09,
                                                              height:
                                                                  height * .04,
                                                              color: Colors
                                                                  .transparent,
                                                              child: const Icon(
                                                                Icons.remove,
                                                                size: 16,
                                                                color: primary,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: width * .07,
                                                            height:
                                                                height * .042,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    extralightgrey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                              child: Text(
                                                                  cartitem[index][
                                                                          'qty']
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontFamily:
                                                                          'Gilroy',
                                                                      fontSize:
                                                                          12,
                                                                      letterSpacing:
                                                                          .3,
                                                                      color:
                                                                          blackcolor)),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                cartitem[index]
                                                                    ["qty"]++;
                                                              });
                                                            },
                                                            child: Container(
                                                              width:
                                                                  width * .09,
                                                              height:
                                                                  height * .04,
                                                              color: Colors
                                                                  .transparent,
                                                              child: const Icon(
                                                                Icons.add,
                                                                size: 16,
                                                                color: primary,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                          ],
                                        ),
                                      )
                                    ]),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    SizedBox(
                                      width: width * .89,
                                      height: 10,
                                      child: const Divider(
                                          thickness: .6,
                                          color: Color(0xffDEDEDE)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * .025),
                          child: const Text("Bill Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  color: blackcolor)),
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      Container(
                        width: width * .85,
                        height: height * .29,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: .5,
                              color: const Color(0xffB1B1B1),
                            ),
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * .02, right: width * .02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Sub Total",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 14,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 3000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 14,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .015,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Tax",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 14,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 400",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 14,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .015,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Delivery Charge",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 14,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 14,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              SizedBox(
                                width: width * .76,
                                height: 1,
                                child: const Divider(
                                    thickness: .3, color: Color(0xff5B5B5B)),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Total Amount",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 13,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 4300",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 13,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Coupon Offer",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 13,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("-₹ 200",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 13,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              SizedBox(
                                width: width * .76,
                                height: 1,
                                child: const Divider(
                                    thickness: .3, color: Color(0xff5B5B5B)),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  SizedBox(
                                    width: width * .3,
                                    child: const Text("Amount to Pay",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 13,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 4000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 13,
                                          color: blackcolor)),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * .025),
                          child: const Text("Coupons and Offer ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  color: blackcolor)),
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      GestureDetector(
                        child: Container(
                          width: width * .85,
                          height: height * .06,
                          decoration: BoxDecoration(
                              color: whitecolor,
                              border: Border.all(
                                  color: const Color(0xff666666), width: .3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              SizedBox(
                                height: height * .055,
                                width: width * .4,
                                child: TextField(
                                  controller: _couponcontroller,
                                  onTap: () {
                                    setState(() {
                                      typing = true;
                                    });
                                  },
                                  onEditingComplete: () {
                                    setState(() {
                                      typing = false;
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    fillColor: whitecolor,
                                    filled: true,
                                    hintText: "Coupon Code",
                                    contentPadding: const EdgeInsets.all(8),
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w600,
                                        color: blackcolor),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: whitecolor, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: whitecolor, width: 1),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    height: 1,
                                    fontFamily: 'Gilroy',
                                    color: blackcolor,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: width * .28,
                                  height: height,
                                  decoration: const BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: const Center(
                                    child: Text("Apply",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 11,
                                            color: whitecolor)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      coupons.isEmpty
                          ? const SizedBox()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                    initialPage: 0,
                                    viewportFraction: 1,
                                    height: height * .11,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) =>
                                        setState(() {
                                          Random random = Random();
                                          couponnumber = random.nextInt(5);
                                        })),
                                items: coupons.map((bannerimages) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            width: width * .86,
                                            height: height * .055,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  "images/coupon$couponnumber.png",
                                                  fit: BoxFit.cover,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: width * .04,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: height * .017,
                                                        ),
                                                        const Text(
                                                            "Get 200} % Off",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Gilroy',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    .8,
                                                                color:
                                                                    blackcolor)),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    const Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text("Use Code",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Gilroy',
                                                                fontSize: 13,
                                                                letterSpacing:
                                                                    .8,
                                                                color:
                                                                    blackcolor)),
                                                        Text("3f45ese",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Gilroy',
                                                                fontSize: 20,
                                                                letterSpacing:
                                                                    .8,
                                                                color:
                                                                    blackcolor)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: width * .04,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                      SizedBox(
                        height: height * .01,
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * .025),
                          child: const Text("Order Note",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16,
                                  color: blackcolor)),
                        ),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      SizedBox(
                        height: height * .12,
                        width: width * .85,
                        child: TextField(
                          maxLines: 6,
                          cursorColor: blackcolor,
                          focusNode: _focusNode,
                          textAlignVertical: TextAlignVertical.top,
                          controller: _ordernotecontroller,
                          onTap: () {
                            setState(() {
                              typing = true;
                            });
                          },
                          onTapOutside: (_) {
                            setState(() {
                              typing = false;
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          onSubmitted: (_) {
                            setState(() {
                              typing = false;
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          onEditingComplete: () {
                            setState(() {
                              typing = false;
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 25, left: 12),
                            fillColor: whitecolor,
                            filled: true,
                            hintText: "Enter Your Note",
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              color: otpgrey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xff666666).withOpacity(.4),
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xff666666).withOpacity(.4),
                                  width: 1),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: blackcolor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .2,
                      ),
                      SizedBox(
                        height: widget.route == "true"
                            ? height * .12
                            : height * .17,
                      )
                    ],
                  ),
                ),
              ),
              cartitem.isEmpty
                  ? const SizedBox()
                  : typing
                      ? const SizedBox()
                      : Positioned(
                          bottom: widget.route == "true"
                              ? height * .042
                              : height * .092,
                          child: Container(
                            height: height * .15,
                            width: width * .85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: whitecolor,
                              boxShadow: [
                                BoxShadow(
                                  color: blackcolor.withOpacity(.1),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * .02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * .05),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Delivered To",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 13,
                                            letterSpacing: .4,
                                            color: blackcolor)),
                                  ),
                                ),
                                SizedBox(
                                  height: height * .005,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const DeliveryAdress());
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding:
                                            EdgeInsets.only(left: width * .05),
                                        child: const Text("United Kingdom",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Gilroy',
                                                fontSize: 11,
                                                letterSpacing: .4,
                                                color: blackcolor))),
                                  ),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     // _showBottomSheet(context);
                                //   },
                                //   child: Container(
                                //     width: width * .75,
                                //     height: height * .065,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(8),
                                //         color: whitecolor,
                                //         border: Border.all(
                                //             color: const Color(0xff959595)
                                //                 .withOpacity(.5))),
                                //     child: const Padding(
                                //       padding:
                                //           EdgeInsets.only(left: 8.0, right: 8),
                                //       child: Column(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Text("Select Slot",
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.w500,
                                //                   fontFamily: 'Gilroy',
                                //                   fontSize: 11,
                                //                   letterSpacing: .4,
                                //                   color: blackcolor)),
                                //           Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Spacer(),
                                //               Text("Select ",
                                //                   style: TextStyle(
                                //                       fontWeight:
                                //                           FontWeight.w600,
                                //                       fontFamily: 'Gilroy',
                                //                       fontSize: 14,
                                //                       letterSpacing: .4,
                                //                       color: primary)),
                                //               Icon(
                                //                 Icons.arrow_forward_ios,
                                //                 size: 12,
                                //                 color: primary,
                                //               )
                                //             ],
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: height * .015,
                                // ),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => const OrderPlaced());
                                      // Navigator.of(context).pushReplacement(
                                      //     PageAnimationTransition(
                                      //         page: const OrderPlaced(),
                                      //         pageAnimationType:
                                      //             FadeAnimationTransition()));
                                    },
                                    child: const PayButton(name: "Pay ₹4300"))
                              ],
                            ),
                          ),
                        ),
            ],
          ),
        ));
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const MyBottomSheet();
  //     },
  //   );
  // }

  showAlertDialog(BuildContext context, int index) {
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: primary),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget okButton = TextButton(
      child: const Text(
        "OK",
        style: TextStyle(color: blackcolor),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: whitecolor,
      title: const Text("Delete Item"),
      content: const Text("Confirm Deleting Itemn From Cart"),
      actions: [okButton, cancelButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
