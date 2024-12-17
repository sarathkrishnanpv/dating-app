import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/ecom-widget/toast.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFamilydetails extends StatefulWidget {
  const EditFamilydetails({super.key});

  @override
  State<EditFamilydetails> createState() => _EditFamilydetailsState();
}

class _EditFamilydetailsState extends State<EditFamilydetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    religioncontroller.text = myprofiledata['name'];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: whitecolor,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Oneh(),
              const Row(
                children: [
                  Heading17font700(
                      heading: "Personal Details", color: blackcolor),
                  Spacer(),
                  Heading12font700(heading: "50%", color: blackcolor)
                ],
              ),
              const Oneh(),
              LinearProgressIndicator(
                value: .5,
                color: primary,
                backgroundColor: primary.withOpacity(.3),
              ),
              const Twoh(),
              const Row(
                children: [
                  Heading12font700(heading: "Religion", color: blackcolor),
                  RedStar()
                ],
              ),
              const Oneh(),
              CustomTextfeild(
                controller: religioncontroller,
                hint: "Enter Religion",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter valid Religion';
                  }

                  return null;
                },
              ),
              const Oneh(),
              const Heading12font700(
                  heading: "Choose Sub Region", color: blackcolor),
              const Oneh(),
              Obx(() => selectedRegion!.value == "UK"
                  ? SelectionDropDown(
                      options: placesInUK,
                      hint: "Select Your Sub Region",
                      initialValue: selectedSubRegion!.value.isNotEmpty == true
                          ? selectedSubRegion!.value
                          : null,
                      onChanged: (String value) {
                        selectedSubRegion!.value = value;
                      },
                    )
                  : SelectionDropDown(
                      options: districtsInKerala,
                      initialValue: selectedSubRegion!.value.isNotEmpty == true
                          ? selectedSubRegion!.value
                          : null,
                      hint: "Select Your Sub Region",
                      onChanged: (String value) {
                        selectedSubRegion!.value = value;
                      },
                    )),
              const Oneh(),
              const Row(
                children: [
                  Heading12font700(heading: "Cast", color: blackcolor),
                  RedStar()
                ],
              ),
              const Oneh(),
              CustomTextfeild(
                controller: castcontroller,
                hint: "Enter Cast",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter valid Cast';
                  }

                  return null;
                },
              ),
              const Oneh(),
              const Row(
                children: [
                  Heading12font700(heading: "Mother Tongue", color: blackcolor),
                  RedStar()
                ],
              ),
              const Oneh(),
              CustomTextfeild(
                controller: languagecontroller,
                hint: "Enter Language",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter valid Language';
                  }

                  return null;
                },
              ),
              const Oneh(),
              const Heading12font700(
                heading: "Drinking Habits ",
                color: blackcolor,
              ),
              const Oneh(),
              SelectionDropDown(
                options: drinking,
                initialValue: drinkinghabit!.value.isNotEmpty == true
                    ? drinkinghabit!.value
                    : null,
                hint: "Select ",
                onChanged: (String value) {
                  drinkinghabit!.value = value;
                },
              ),
              const Oneh(),
              const Heading12font700(
                  heading: "Smoking Habits ", color: blackcolor),
              const Oneh(),
              SelectionDropDown(
                options: smoking,
                initialValue: smokinghabit!.value.isNotEmpty == true
                    ? smokinghabit!.value
                    : null,
                hint: "Select your Smoking Habit",
                onChanged: (String value) {
                  smokinghabit!.value = value;
                },
              ),
              const Spacer(),
              MainButton(
                  onpressed: () {
                    if (selectedSubRegion!.value.isEmpty) {
                      errortoastmsg("Choose Your Sub Region");
                    } else if (drinkinghabit!.value.isEmpty) {
                      errortoastmsg("Choose Your Drinking Habit");
                    } else if (smokinghabit!.value.isEmpty) {
                      errortoastmsg("Choose Your Smoking Habit");
                    } else {
                      if (_formKey.currentState!.validate()) {
                        postPersonalDetailsToServer(
                            religioncontroller.text.toString(),
                            selectedSubRegion!.value.toString(),
                            castcontroller.text.toString(),
                            languagecontroller.text.toString(),
                            drinkinghabit!.value.toString(),
                            smokinghabit!.value.toString(),
                            true);
                      }
                    }
                  },
                  buttontitle: "Continue "),
              const Fiveh()
            ],
          ),
        ),
      ),
    );
  }
}
