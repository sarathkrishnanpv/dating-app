import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class IndividualOrderDetails extends StatefulWidget {
  const IndividualOrderDetails({super.key});

  @override
  State<IndividualOrderDetails> createState() => _IndividualOrderDetailsState();
}

class _IndividualOrderDetailsState extends State<IndividualOrderDetails> {
  List currentindex = [];
  List reviewindex = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: width * .05, right: width * .05),
          child: Column(children: [
            SizedBox(
              height: height * .082,
            ),
            const AppbarSection(heading: "My Orders"),
            SizedBox(
              height: height * .85,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width * .04, right: width * .04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * .02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  letterSpacing: .8,
                                  color: blackcolor)),
                          Text("Delivered",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 12,
                                  letterSpacing: .8,
                                  color: primary)),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 4),
                              child: SizedBox(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'images/prdt1.png',
                                        height: height * .09,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Crop Top",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .8,
                                                color: blackcolor)),
                                        Text("₹ 300",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .8,
                                                color: blackcolor)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    RatingBar.builder(
                                      unratedColor: const Color.fromARGB(
                                          255, 227, 227, 227),
                                      initialRating: 0,
                                      minRating: 0,
                                      glow: false,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: yellow,
                                      ),
                                      onRatingUpdate: (rating) {
                                        if (rating >= 0.5) {
                                          setState(() {
                                            currentindex.clear();
                                            currentindex.add(index);
                                          });
                                        } else {
                                          setState(() {
                                            currentindex.remove(index);
                                          });
                                        }
                                      },
                                    ),
                                    currentindex.contains(index)
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (reviewindex
                                                        .contains(index)) {
                                                      reviewindex.remove(index);
                                                    } else {
                                                      reviewindex.add(index);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: width * .3,
                                                  height: height * .04,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xffFE7246)
                                                          .withOpacity(.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                    child: Text(
                                                        "Write a Review >",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 12,
                                                            color: blackcolor)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              reviewindex.contains(index)
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: height * .12,
                                                          child: TextField(
                                                            maxLines: 6,
                                                            cursorColor:
                                                                blackcolor,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .top,
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 25,
                                                                      left: 12),
                                                              fillColor:
                                                                  whitecolor,
                                                              filled: true,
                                                              hintText:
                                                                  "Review",
                                                              hintStyle:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                color: otpgrey,
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide: BorderSide(
                                                                    color: const Color(
                                                                            0xff666666)
                                                                        .withOpacity(
                                                                            .4),
                                                                    width: 1),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide: BorderSide(
                                                                    color: const Color(
                                                                            0xff666666)
                                                                        .withOpacity(
                                                                            .4),
                                                                    width: 1),
                                                              ),
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 13.0,
                                                              color: blackcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * .01,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {},
                                                          child: Container(
                                                            width: width * .2,
                                                            height:
                                                                height * .04,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      fontFamily:
                                                                          'Gilroy',
                                                                      fontSize:
                                                                          11,
                                                                      color:
                                                                          whitecolor)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : const SizedBox(),
                                            ],
                                          )
                                        : SizedBox(
                                            height: height * .01,
                                          ),
                                    SizedBox(
                                      width: width,
                                      child: Divider(
                                        color: blackcolor.withOpacity(.1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: height * .02,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Bill Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                color: blackcolor)),
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
                                  const Text("₹ 2000",
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
                                  const Text("₹ 2300",
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
                                    child: const Text("Amount Paid",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Gilroy',
                                            fontSize: 13,
                                            color: blackcolor)),
                                  ),
                                  const Spacer(),
                                  const Text("₹ 2100",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Gilroy',
                                          fontSize: 13,
                                          color: primary)),
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
                        height: height * .02,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Date and Tiime",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                color: blackcolor)),
                      ),
                      SizedBox(
                        height: height * .015,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("12/10/2024- 9:40",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                color: blackcolor)),
                      ),
                      SizedBox(
                        height: height * .025,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
