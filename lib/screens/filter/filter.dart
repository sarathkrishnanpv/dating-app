import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:datingapp/widget/reuseditems/reused.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    RxInt usergender = 0.obs;
    RxString selectedgender = "Male".obs;
    final Rx<RangeValues> values = const RangeValues(18, 25).obs;
    RxList selectedintrest = [].obs;

    return Container(
      height: height * .8,
      width: width,
      decoration: BoxDecoration(
          color: whitecolor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          const Oneh(),
          const Tabnotch(),
          const Twoh(),
          SizedBox(
              height: height * .75,
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Obx(
                    () => Padding(
                      padding: horizontalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Twoh(),
                          Row(
                            children: [
                              const Heading16font700(
                                  heading: "Lets find your perfect match ",
                                  color: blackcolor),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: transparent,
                                  child: const Icon(
                                    Icons.close,
                                    color: Color(0xff414141),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Twoh(),
                          const Heading12font600(
                              heading: "Gender ", color: blackcolor),
                          const Oneh(),
                          SizedBox(
                            height: height * .04,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: genderlist.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            usergender.value = index;
                                            selectedgender.value =
                                                genderlist[index];
                                          },
                                          child: Container(
                                            height: height * .04,
                                            decoration: BoxDecoration(
                                                color: usergender.value == index
                                                    ? whitecolor
                                                    : lightwhite,
                                                border: Border.all(
                                                    color: usergender.value ==
                                                            index
                                                        ? lightgreen
                                                        : lightwhite),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Center(
                                                child: Heading12font600(
                                                    heading: genderlist[index],
                                                    color: const Color(
                                                        0xff464646)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                          const Twoh(),
                          Row(
                            children: [
                              const Heading12font600(
                                  heading: "Set your age range ",
                                  color: blackcolor),
                              const Spacer(),
                              Heading12font600(
                                  heading:
                                      "${values.value.start.round()} Yrs - ${values.value.end.round()}",
                                  color: const Color(0xff1357CD)),
                            ],
                          ),
                          const Oneh(),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 4, // Adjust the height of the track
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 10,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 15, // Customize overlay size
                              ),
                              valueIndicatorShape:
                                  const PaddleSliderValueIndicatorShape(),
                              valueIndicatorTextStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            child: RangeSlider(
                              labels: RangeLabels(
                                values.value.start.round().toString(),
                                values.value.end.round().toString(),
                              ),
                              values: values.value,
                              min: 18.0,
                              max: 70.0,
                              activeColor: primary,
                              inactiveColor: lightwhite,
                              onChanged: (newValues) {
                                values.value = newValues;
                              },
                            ),
                          ),
                          const Oneh(),
                          const Heading12font600(
                              heading: "From where your prefer your partner.",
                              color: blackcolor),
                          const Oneh(),
                          CustomDropdown(
                            placelist: placesInUKandIndia,
                            onChanged: (String value) {
                              selectedplaceinintrest.value = value;
                            },
                          ),
                          const Oneh(),
                          const Heading12font600(
                              heading: "Interests", color: blackcolor),
                          const Oneh(),
                          GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 6.0,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: 1.2),
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: commonInterests.length,
                              itemBuilder: (context, index) {
                                return Obx(() => GestureDetector(
                                      onTap: () {
                                        selectedintrest
                                            .add(commonInterests[index]);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * .1,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: selectedintrest
                                                            .contains(
                                                                commonInterests[
                                                                    index])
                                                        ? const Color(
                                                            0xff0D63E8)
                                                        : const Color(
                                                            0xffA6A6A6)),
                                                color: selectedintrest.contains(
                                                        commonInterests[index])
                                                    ? const Color(0xffEEF8FF)
                                                    : whitecolor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Heading12font500(
                                                    heading:
                                                        commonInterests[index],
                                                    color: blackcolor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              }),
                          const Twoh(),
                          MainButton(
                            buttontitle: "Find People ",
                            onpressed: () {
                              filterProfile(
                                  1,
                                  selectedgender.value.toString(),
                                  values.value.start.round().toString(),
                                  values.value.end.round().toString(),
                                  selectedplaceinintrest.value,
                                  selectedintrest);
                              Navigator.pop(context);
                            },
                          ),
                          const Twoh(),
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
