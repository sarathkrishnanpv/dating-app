import 'package:animate_do/animate_do.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:datingapp/screens/e-com/orderscreen/historyscreen.dart';
import 'package:datingapp/screens/e-com/orderscreen/upcomingorders.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: EdgeInsets.only(left: width * .05, right: width * .05),
        child: Column(children: [
          // FadeInDown(
          //     from: 10, child: const AppbarSection(heading: "My Orders")),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .98,
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      backgroundColor: whitecolor,
                      body: SafeArea(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * .85,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: linegrey)),
                                    child: SegmentedTabControl(
                                      indicatorDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: whitecolor),
                                      barDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: primary),
                                      indicatorPadding: const EdgeInsets.all(4),
                                      tabTextColor: Colors.white,
                                      selectedTabTextColor: primary,
                                      squeezeIntensity: 2,
                                      height: 46,
                                      tabPadding: const EdgeInsets.all(1),
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          letterSpacing: .4,
                                          color: blackcolor),
                                      tabs: const [
                                        SegmentTab(
                                          label: 'Upcoming',
                                          textColor: whitecolor,
                                        ),
                                        SegmentTab(
                                            label: 'History',
                                            textColor: whitecolor),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * .07),
                              child: const TabBarView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  UpcomingOrders(),
                                  HistoryScreen(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
