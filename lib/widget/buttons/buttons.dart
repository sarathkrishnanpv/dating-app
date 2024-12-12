import 'package:animate_do/animate_do.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/ecom-widget/reusedicon.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton(
      {super.key, required this.onpressed, required this.buttontitle});

  final VoidCallback onpressed;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onpressed,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .43,
          height: MediaQuery.of(context).size.height * .051,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff1D4144)),
              color: whitecolor,
              borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Heading12font600(
              heading: buttontitle,
              color: const Color(0xff1D4144),
            ),
          ),
        ),
      ),
    );
  }
}

class SubButton extends StatelessWidget {
  const SubButton(
      {super.key, required this.onpressed, required this.buttontitle});

  final VoidCallback onpressed;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onpressed,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .43,
          height: MediaQuery.of(context).size.height * .051,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Heading12font600(
              heading: buttontitle,
              color: whitecolor,
            ),
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key, required this.onpressed, required this.buttontitle});

  final VoidCallback onpressed;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onpressed,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .051,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: buttonloading.value
                    ? const Buttonloading()
                    : Heading14font600(
                        heading: buttontitle,
                        color: whitecolor,
                      ),
              ),
            ),
          ),
        ));
  }
}

class MiniButton extends StatelessWidget {
  const MiniButton(
      {super.key, required this.onpressed, required this.buttontitle});

  final VoidCallback onpressed;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onpressed,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .37,
          height: MediaQuery.of(context).size.height * .041,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Heading12font600(
              heading: buttontitle,
              color: whitecolor,
            ),
          ),
        ),
      ),
    );
  }
}

class Unavailable extends StatelessWidget {
  const Unavailable({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * .25,
        height: height * .033,
        decoration: BoxDecoration(
            color: whitecolor, borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Text("Unavailable",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 12,
                  letterSpacing: .8,
                  color: red)),
        ),
      ),
    );
  }
}

class Carddetailssection extends StatelessWidget {
  const Carddetailssection(
      {super.key, required this.paddedheight, required this.listlength});
  final double paddedheight;
  final int listlength;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: paddedheight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideInUp(
            from: 40,
            child: Container(
              width: width * .9,
              height: height * .08,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .04,
                  ),
                  const Text(" Item Added to cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          letterSpacing: .4,
                          color: whitecolor)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("View Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Gilroy',
                            fontSize: 15,
                            letterSpacing: .4,
                            color: whitecolor)),
                  ),
                  SizedBox(
                    width: width * .04,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  ProfileTile({super.key, required this.pic, required this.name});
  String pic;
  String name;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: width * .01),
      child: Container(
        color: Colors.transparent,
        height: height * .05,
        width: width,
        child: Row(
          children: [
            SizedBox(
              width: width * .085,
            ),
            SizedBox(
              height: height * .03,
              width: width * .06,
              child: Image.asset(
                pic,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'Gilroy',
                    fontSize: 13,
                    color: blackcolor)),
          ],
        ),
      ),
    );
  }
}

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * .02,
        ),
        const BackshadowContainer(),
        const Spacer(),
        Text(heading,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Gilroy',
                fontSize: 16,
                letterSpacing: .8,
                color: blackcolor)),
        SizedBox(
          width: width * .12,
        ),
        const Spacer()
      ],
    );
  }
}

class Profilebackground extends StatelessWidget {
  const Profilebackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            "images/background.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: width * .75,
        height: height * .06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: primary),
        child: Center(
          child: Text(name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy',
                  fontSize: 15,
                  letterSpacing: .8,
                  color: whitecolor)),
        ),
      ),
    );
  }
}

class Buttonloading extends StatelessWidget {
  const Buttonloading({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: Colors.white,
      size: 35,
    );
  }
}
