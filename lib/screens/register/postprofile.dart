import 'package:datingapp/screens/register/familydetails.dart';
import 'package:datingapp/screens/register/personaldeatils.dart';
import 'package:datingapp/screens/register/workdetails.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Postprofile extends StatelessWidget {
  const Postprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: horizontalPadding,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  const Heading14font600(
                      heading: "Basic Details", color: blackcolor),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Personaldeatils());
                    },
                    child: SvgPicture.asset(
                      change,
                      width: width * .2,
                    ),
                  ),
                ],
              ),
              const Twoh(),
              const Profilepostdata(
                title: "Name ",
                body: "Vicky Zboncak",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Sex",
                body: "Male",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Age",
                body: "25",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Weight",
                body: "60",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Height",
                body: "170",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Marital Status",
                body: "Single",
              ),
              const Twoh(),
              Row(
                children: [
                  const Heading14font600(
                      heading: "Personal Details", color: blackcolor),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Familydetails());
                    },
                    child: SvgPicture.asset(
                      change,
                      width: width * .2,
                    ),
                  ),
                ],
              ),
              const Twoh(),
              const Profilepostdata(
                title: "Religion",
                body: "Hindu",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Cast",
                body: "Nair",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Mother Tongue",
                body: "Malayalam",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Drinking",
                body: "Never",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Smoking",
                body: "Never",
              ),
              const Twoh(),
              Row(
                children: [
                  const Heading14font600(
                      heading: "Work & School Details", color: blackcolor),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const WorkDetails());
                    },
                    child: SvgPicture.asset(
                      change,
                      width: width * .2,
                    ),
                  ),
                ],
              ),
              const Twoh(),
              const Profilepostdata(
                title: "Job Role",
                body: "CA",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "Education",
                body: "MCA",
              ),
              const Oneh(),
              const Profilepostdata(
                title: "College",
                body: "CET TRIVANDRUM",
              ),
              const Fiveh(),
              const Fiveh(),
              const Fiveh(),
              MainButton(
                  onpressed: () {
                    submitprofiletoserver();
                  },
                  buttontitle: "Post Profile"),
              const Fiveh(),
            ],
          ),
        ),
      ),
    );
  }
}
