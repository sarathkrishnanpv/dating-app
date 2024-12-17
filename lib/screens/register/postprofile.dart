import 'package:datingapp/screens/register/familydetails.dart';
import 'package:datingapp/screens/register/personaldeatils.dart';
import 'package:datingapp/screens/register/workdetails.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
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
              Profilepostdata(
                title: "Name ",
                body: namecontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Sex",
                body: selectedsex!.value,
              ),
              const Oneh(),
              Profilepostdata(
                title: "Age",
                body: agecontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Weight",
                body: weightcontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Height",
                body: heightcontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Marital Status",
                body: maritialstatusselected!.value,
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
              Profilepostdata(
                title: "Religion",
                body: religioncontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Cast",
                body: castcontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Mother Tongue",
                body: languagecontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Drinking",
                body: drinkinghabit!.value,
              ),
              const Oneh(),
              Profilepostdata(
                title: "Smoking",
                body: smokinghabit!.value,
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
              Profilepostdata(
                title: "Job Role",
                body: jobrolecontroller.text.toString(),
              ),
              const Oneh(),
              Profilepostdata(
                title: "Education",
                body: educationselected.value,
              ),
              const Oneh(),
              Profilepostdata(
                title: "College",
                body: collegenamecontroller.text.toString(),
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
