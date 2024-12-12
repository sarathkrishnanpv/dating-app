import 'package:animate_do/animate_do.dart';
import 'package:datingapp/screens/e-com/adress/deliveryadres.dart';
import 'package:datingapp/screens/e-com/fav/favourites.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../orders/orders.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SlideInRight(from: 30, child: const Profilebackground()),
          Padding(
            padding: EdgeInsets.only(left: width * .05, right: width * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .082,
                ),
                const AppbarSection(heading: "My Account"),
                SizedBox(
                  height: height * .03,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profilepic.png"),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                const Center(
                  child: Text('Admin',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Gilroy',
                          fontSize: 15,
                          color: blackcolor)),
                ),
                SizedBox(
                  height: height * .01,
                ),
                const Center(
                  child: Text("+91 1234567890}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Gilroy',
                          fontSize: 11,
                          color: Color(0xff8B8B8B))),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const FavouriteScreen());
                  },
                  child: ProfileTile(
                    pic: "images/love.png",
                    name: 'Favourites',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const OrderScreen());
                  },
                  child: ProfileTile(
                    pic: "images/order.png",
                    name: 'Orders',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DeliveryAdress());
                  },
                  child: ProfileTile(
                    pic: "images/pin.png",
                    name: 'Delivery Address',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(PageAnimationTransition(
                    //     page: const ContactUsScreen(),
                    //     pageAnimationType: FadeAnimationTransition()));
                  },
                  child: ProfileTile(
                    pic: "images/email.png",
                    name: 'Contact Us',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(PageAnimationTransition(
                    //     page: const SettingsView(),
                    //     pageAnimationType: FadeAnimationTransition()));
                  },
                  child: ProfileTile(
                    pic: "images/setting.png",
                    name: 'Settings',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(PageAnimationTransition(
                    //     page: const SplashScreen(),
                    //     pageAnimationType: FadeAnimationTransition()));
                  },
                  child: ProfileTile(
                    pic: "images/logout.png",
                    name: 'Log out',
                  ),
                ),
                Line(
                  width: width,
                  color: primary.withOpacity(.2),
                ),
                SizedBox(
                  height: height * .1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
