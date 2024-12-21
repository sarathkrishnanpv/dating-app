import 'package:datingapp/screens/e-com/mainscreen/homepage.dart';
import 'package:datingapp/screens/hometab/profilecheck.dart';
import 'package:datingapp/screens/mainscreens/datinglist.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  @override
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(
        children: [
          Obx(() => Expanded(
                child: tabindex.value == 3
                    ? const DatingList()
                    : tabindex.value == 4
                        ? const HomePage()
                        : const ProfileCheck(),
              )),
          Obx(() => Container(
                width: width,
                height: height * .1,
                decoration: BoxDecoration(
                  color: whitecolor,
                  boxShadow: [
                    BoxShadow(
                      color: blackcolor.withOpacity(.2),
                      // offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        tabindex.value = 0;
                      },
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/matrimonyicon.svg",
                                width: width * .08,
                                // ignore: deprecated_member_use
                                color:
                                    tabindex.value == 0 ? primary : textgrey),
                            Heading10font500(
                                heading: "Home",
                                color:
                                    tabindex.value == 0 ? primary : textgrey),
                            const Oneh(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabindex.value = 1;
                      },
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/matrimonyicon.svg",
                                width: width * .08,
                                color:
                                    tabindex.value == 1 ? primary : textgrey),
                            Heading10font500(
                                heading: "Explore",
                                color:
                                    tabindex.value == 1 ? primary : textgrey),
                            const Oneh(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabindex.value = 2;
                      },
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/matrimonyicon.svg",
                                width: width * .08,
                                color:
                                    tabindex.value == 2 ? primary : textgrey),
                            Heading10font500(
                                heading: "Post",
                                color:
                                    tabindex.value == 2 ? primary : textgrey),
                            const Oneh(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabindex.value = 3;
                      },
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/matrimonyicon.svg",
                                width: width * .08,
                                color:
                                    tabindex.value == 3 ? primary : textgrey),
                            Heading10font500(
                                heading: "Dating",
                                color:
                                    tabindex.value == 3 ? primary : textgrey),
                            const Oneh(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tabindex.value = 4;
                      },
                      child: SizedBox(
                        width: width * .2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/matrimonyicon.svg",
                                width: width * .08,
                                color:
                                    tabindex.value == 4 ? primary : textgrey),
                            Heading10font500(
                                heading: "For Sale",
                                color:
                                    tabindex.value == 4 ? primary : textgrey),
                            const Oneh(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
