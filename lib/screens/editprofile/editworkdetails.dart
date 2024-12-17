import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditWorkDetails extends StatefulWidget {
  const EditWorkDetails({super.key});

  @override
  State<EditWorkDetails> createState() => _EditWorkDetailsState();
}

class _EditWorkDetailsState extends State<EditWorkDetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    jobrolecontroller.text =
        personalworklist['work_and_education'][0]['job_role'];
    collegenamecontroller.text =
        personalworklist['work_and_education'][0]['college'];
    educationindex.value = personalworklist['work_and_education'][0]
                ['education_level'] ==
            "Master’s"
        ? 0
        : personalworklist['work_and_education'][0]['education_level'] ==
                "Bachelor's"
            ? 1
            : 2;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                      heading: "Work & School Details", color: blackcolor),
                  Spacer(),
                  Heading12font700(heading: "80%", color: blackcolor)
                ],
              ),
              const Oneh(),
              LinearProgressIndicator(
                value: .8,
                color: primary,
                backgroundColor: primary.withOpacity(.3),
              ),
              const Twoh(),
              const Heading12font700(heading: "Job Role", color: blackcolor),
              const Oneh(),
              CustomTextfeild(
                controller: jobrolecontroller,
                hint: "Job Role",
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Job name cannot be empty';
                //   }
                //   if (value.length < 3) {
                //     return 'Collage name must be at least 3 characters long';
                //   }
                //   return null;
                // },
              ),
              const Oneh(),
              const Heading12font700(
                  heading: "Education Level", color: blackcolor),
              const Oneh(),
              SizedBox(
                height: height * .04,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: educationlist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Obx(
                            () => GestureDetector(
                              onTap: () {
                                educationindex.value = index;
                                educationselected.value = educationlist[index];
                              },
                              child: Container(
                                height: height * .04,
                                decoration: BoxDecoration(
                                    color: educationindex.value == index
                                        ? whitecolor
                                        : lightwhite,
                                    border: Border.all(
                                        color: educationindex.value == index
                                            ? lightgreen
                                            : lightwhite),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: Heading12font600(
                                        heading: educationlist[index],
                                        color: const Color(0xff464646)),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    }),
              ),
              const Oneh(),
              const Heading12font700(
                  heading: "Collage Name  ", color: blackcolor),
              const Oneh(),
              CustomTextfeild(
                controller: collegenamecontroller,
                hint: "Collage Name  ",
              ),
              const Oneh(),
              const Spacer(),
              MainButton(
                  onpressed: () {
                    if (_formKey.currentState!.validate()) {
                      postwrkandeducationtosever(
                          jobrolecontroller.text.toString(),
                          educationselected.value.toString(),
                          collegenamecontroller.text.toString(),
                          true);
                    }
                  },
                  buttontitle: "Continue"),
              const Fiveh(),
            ],
          ),
        ),
      ),
    );
  }
}
