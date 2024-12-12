import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:datingapp/screens/e-com/mainscreen/homepage.dart';
import 'package:datingapp/screens/hometab/hometab.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          const Center(
            child: Text("Your Order is",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Gilroy',
                    fontSize: 30,
                    color: blackcolor)),
          ),
          const Center(
            child: Text("Placed",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Gilroy',
                    fontSize: 30,
                    color: blackcolor)),
          ),
          SizedBox(
            height: height * .03,
          ),
          Lottie.asset('assets/orderplaced.json',
              repeat: true, width: width * .6),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MainButton(
                buttontitle: "Home",
                onpressed: () {
                  Timer(const Duration(seconds: 15),
                      () => orderplacednotification());
                  Get.to(() => const Hometab());
                },
              ),
            ],
          ),
          SizedBox(
            height: height * .12,
          ),
        ],
      ),
    );
  }

  orderplacednotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            wakeUpScreen: true,
            locked: false,
            id: 10,
            autoDismissible: true,
            channelKey: 'basic_channel',
            title: 'Order Placed',
            body:
                'Your order has been successfully placed. 🛍️ Thank you for choosing us!',
            notificationLayout: NotificationLayout.Default));
  }
}
