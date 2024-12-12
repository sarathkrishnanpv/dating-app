import 'package:datingapp/screens/register/personaldeatils.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkThrough extends StatelessWidget {
  const WalkThrough({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Scaffold(
      backgroundColor: const Color(0xffFAFBFB),
      body: Padding(
        padding: horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                dating,
                width: width * .8,
              ),
            ),
            const Threeh(),
            const Heading17font700(
              heading:
                  "Two souls with but a single thought\n, two hearts that beat as one.",
              color: blackcolor,
            ),
            const Oneh(),
            const Heading12font500(
              heading:
                  "Discover meaningful connections and find your\nperfect match. Let's get started on your journey\nto love and companionship.",
              color: blackcolor,
            ),
            const Twoh(),
            SubButton(
              buttontitle: "Register a profile",
              onpressed: () {
                Get.to(() => const Personaldeatils());
              },
            )
          ],
        ),
      ),
    );
  }
}
