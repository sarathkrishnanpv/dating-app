import 'package:animate_do/animate_do.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class IndividualProductScreen extends StatefulWidget {
  const IndividualProductScreen({
    super.key,
  });

  @override
  State<IndividualProductScreen> createState() =>
      _IndividualProductScreenState();
}

class _IndividualProductScreenState extends State<IndividualProductScreen> {
  int activeIndex = 0;
  int tabselected = 0;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: height * .5,
                            child: Image.asset(
                              'images/prdt1.png',
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: height * .075,
                            child: SizedBox(
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: blackcolor,
                                        size: 18,
                                      ),
                                    ).asGlass(
                                        tintColor: Colors.transparent,
                                        clipBorderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                          child: Image.asset(
                                        "images/loveicon.png",
                                        width: width * .055,
                                      )),
                                    ).asGlass(
                                        tintColor: Colors.transparent,
                                        clipBorderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * .04,
                        right: width * .04,
                        top: height * .02),
                    child: const Text("Salmond Fry with full pieces",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: .8,
                            color: blackcolor)),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * .04,
                    ),
                    child: Container(
                      width: width * .33,
                      height: height * .035,
                      decoration: BoxDecoration(
                          color: const Color(0xffF14D23).withOpacity(.1),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * .01,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text("4.3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Gilroy',
                                      fontSize: 13,
                                      letterSpacing: .8,
                                      color: blackcolor)),
                            ),
                            const Icon(
                              Icons.star,
                              color: yellow,
                              size: 16,
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Text('114 Rating',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Gilroy',
                                      fontSize: 13,
                                      letterSpacing: .8,
                                      color: blackcolor)),
                            ),
                            SizedBox(
                              width: width * .01,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * .04,
                      right: width * .04,
                    ),
                    child: const Text("₹400",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Gilroy',
                            fontSize: 17,
                            letterSpacing: .1,
                            color: blackcolor)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * .04,
                        right: width * .04,
                        top: height * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       tabselected = 0;
                        //     });
                        //   },
                        //   child: Container(
                        //     width: width * .43,
                        //     height: height * .04,
                        //     color: Colors.transparent,
                        //     child: const Text("Add On",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w600,
                        //             overflow: TextOverflow.ellipsis,
                        //             fontFamily: 'Gilroy',
                        //             fontSize: 13,
                        //             letterSpacing: .8,
                        //             color: blackcolor)),
                        //   ),
                        // ),
                        // const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tabselected = 1;
                            });
                          },
                          child: Container(
                            width: width * .42,
                            height: height * .02,
                            color: Colors.transparent,
                            child: const Text("About",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Gilroy',
                                    fontSize: 13,
                                    letterSpacing: .8,
                                    color: primary)),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: width * .04,
                  //     right: width * .04,
                  //   ),
                  //   child: Container(
                  //     width: width,
                  //     height: 5,
                  //     decoration: BoxDecoration(
                  //         color: extralightgrey,
                  //         borderRadius: BorderRadius.circular(15)),
                  //     child: Row(children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             tabselected = 0;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: width * .46,
                  //           height: 5,
                  //           decoration: BoxDecoration(
                  //               color: tabselected == 0
                  //                   ? primary
                  //                   : Colors.transparent,
                  //               borderRadius: BorderRadius.circular(15)),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             tabselected = 1;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: width * .46,
                  //           height: 5,
                  //           decoration: BoxDecoration(
                  //               color: tabselected == 1
                  //                   ? primary
                  //                   : Colors.transparent,
                  //               borderRadius: BorderRadius.circular(15)),
                  //         ),
                  //       ),
                  //     ]),
                  //   ),
                  // ),
                  // tabselected == 0
                  //     ? SizedBox(
                  //         width: width,
                  //         child: ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           padding: const EdgeInsets.all(8.0),
                  //           itemCount: 2,
                  //           itemBuilder: (context, index) {
                  //             return Padding(
                  //                 padding: EdgeInsets.only(
                  //                   left: width * .03,
                  //                   right: width * .03,
                  //                 ),
                  //                 child: SlideInLeft(
                  //                   from: index * 20,
                  //                   child: GestureDetector(
                  //                       onTap: () {},
                  //                       child: Container(
                  //                         color: Colors.transparent,
                  //                         height: height * .065,
                  //                         child: Row(children: [
                  //                           ClipRRect(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(5),
                  //                             child: Image.asset(
                  //                               'images/prdt1.png',
                  //                               width: width * .12,
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             width: width * .02,
                  //                           ),
                  //                           SizedBox(
                  //                             width: width * .37,
                  //                             child: const Text(
                  //                                 'Pepper  Julienned',
                  //                                 style: TextStyle(
                  //                                     fontWeight:
                  //                                         FontWeight.w500,
                  //                                     overflow:
                  //                                         TextOverflow.ellipsis,
                  //                                     fontFamily: 'Gilroy',
                  //                                     fontSize: 13,
                  //                                     letterSpacing: .1,
                  //                                     color: blackcolor)),
                  //                           ),
                  //                           const Spacer(),
                  //                           const Text("+ ₹ 30",
                  //                               style: TextStyle(
                  //                                   fontWeight: FontWeight.w600,
                  //                                   overflow:
                  //                                       TextOverflow.ellipsis,
                  //                                   fontFamily: 'Gilroy',
                  //                                   fontSize: 13,
                  //                                   letterSpacing: .5,
                  //                                   color: blackcolor)),
                  //                           SizedBox(
                  //                             width: width * .02,
                  //                           ),
                  //                         ]),
                  //                       )),
                  //                 ));
                  //           },
                  //         ),
                  //       )
                  // :
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * .032,
                        right: width * .032,
                        top: 8,
                        bottom: 8),
                    child: SizedBox(
                      width: width,
                      child: Column(children: [
                        SizedBox(
                          height: height * .013,
                        ),
                        SlideInLeft(
                          from: 30,
                          child: const Text(
                              "Anchovy also known as netholi/Kozhuva/Nathal in Malayalam is a popular fish in Kerala and other south Indian states. They provide a cheap source of proteins and other nutrients in the diet. Anchovies are usually classified as an oily fish. They are small, ranging from 2cm (0.79 in) to 40 cm (16 in) in adult length.The smaller Anchovy’s are named as “Sooji Kozhuva” . The larger ones are generally named as Natholi / Aana KozhuvaAnchovies are rich in protein, vitamins and minerals that help in maintaining good health. It contains calcium, iron, magnesium, phosphorus, potassium, sodium and zinc. Anchovies are a good source of vitamins such as thiamin, riboflavin, niacin, folate, vitamin C, B12, B6, A, E and vitamin K.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  letterSpacing: .2,
                                  height: 1.5,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 11,
                                  color: blackcolor)),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: height * .15,
                  )
                ],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: width,
                height: height * .12,
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height * .015,
                    ),
                    const Spacer(),
                    Container(
                      width: width,
                      height: height * .1,
                      decoration: const BoxDecoration(
                          color: whitecolor,
                          boxShadow: [
                            BoxShadow(
                              color: shadowcolor,
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * .05,
                          ),
                          SizedBox(
                            width: width * .46,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (counter > 1) {
                                        counter = counter - 1;
                                      }
                                    });
                                  },
                                  child: Container(
                                      width: width * .087,
                                      height: height * .08,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: primary.withOpacity(.5),
                                              blurRadius: 8,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          color: primary,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: whitecolor,
                                        size: 17,
                                      ))),
                                ),
                                SizedBox(width: width * .01),
                                Container(
                                  width: width * .24,
                                  height: height * .045,
                                  decoration: BoxDecoration(
                                      color: whitecolor,
                                      border:
                                          Border.all(color: primary, width: .6),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Spacer(),
                                        SizedBox(
                                          width: width * .01,
                                        ),
                                        Text(counter.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: 'Gilroy',
                                                fontSize: 15,
                                                color: blackcolor)),
                                        const Spacer(),
                                      ]),
                                ),
                                SizedBox(width: width * .01),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      counter = counter + 1;
                                    });
                                  },
                                  child: Container(
                                      width: width * .087,
                                      height: height * .09,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: primary.withOpacity(.5),
                                              blurRadius: 8,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          color: primary,
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.add,
                                        color: whitecolor,
                                        size: 17,
                                      ))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: width * .05,
                bottom: height * .02,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: width * .33,
                    height: height * .09,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/cart.png",
                          width: width * .06,
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        const Text("Add to Cart",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Gilroy',
                                fontSize: 11,
                                color: whitecolor)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
