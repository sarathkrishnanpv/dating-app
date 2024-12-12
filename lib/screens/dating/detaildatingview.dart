import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedDatingView extends StatelessWidget {
  const DetailedDatingView({super.key, required this.profilelist});
  final Map<String, dynamic> profilelist;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Image Section
            SizedBox(
              width: width,
              height: height * .35,
              child: CachedNetworkImage(
                imageUrl:
                    profilelist['profile_picture'], // Show only the first image
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Content Section
            Padding(
              padding: horizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16), // Spacing
                  Row(
                    children: [
                      SvgPicture.asset(
                          tick), // Replace with your actual SVG path
                      const SizedBox(width: 8),
                      Text(profilelist['name'],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      const SizedBox(width: 16),
                      Text("${profilelist['age']} age",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      const Spacer(),
                    ],
                  ),
                  Text(
                    profilelist['work_and_education'][0]['education_level'],
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  const Text("About:",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(height: 8),
                  Text(
                    profilelist['about'],
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  // Tab Section
                  SizedBox(
                    height: height * .24,
                    child: DefaultTabController(
                      length: 3, // Number of tabs
                      child: Column(
                        children: [
                          // Tab Bar
                          const TabBar(
                            dividerColor: lightwhite,
                            unselectedLabelColor: Colors.black,
                            labelColor: primary,
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            indicatorColor: primary,
                            tabs: [
                              Tab(text: "Basic Details"),
                              Tab(text: "Personal"),
                              Tab(text: "Other Details"),
                            ],
                          ),
                          // Tab Views
                          Expanded(
                            child: TabBarView(
                              children: [
                                Center(
                                    child: BasicDetails(
                                  profilelist: profilelist,
                                )),
                                Center(
                                    child: PersonalDetails(
                                  profilelist: profilelist,
                                )),
                                Center(
                                    child: OtherDetails(
                                  profilelist: profilelist,
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Oneh(),
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: profilelist['additional_images'].length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: height * .3,
                              width: width,
                              child: CachedNetworkImage(
                                imageUrl: profilelist['additional_images']
                                    [index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                  const Threeh(),
                  MainButton(
                      onpressed: () {
                        markintrest(profilelist['id'].toString());
                      },
                      buttontitle: "Intrested"),
                  const Fiveh(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicDetails extends StatelessWidget {
  const BasicDetails({super.key, required this.profilelist});
  final Map<String, dynamic> profilelist;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Twoh(),
        Row(
          children: [
            Image.asset(
              book,
              width: 18,
            ),
            const Twow(),
            Heading11font500(
                heading:
                    "${profilelist['personal_details']['relegion']} ${profilelist['personal_details']['sub_region']}",
                color: blackcolor)
          ],
        ),
        const Oneh(),
        Row(
          children: [
            Image.asset(
              qualification,
              width: 18,
            ),
            const Twow(),
            Heading11font500(
                heading: profilelist['work_and_education'][0]
                    ['education_level'],
                color: blackcolor)
          ],
        ),
        const Oneh(),
        Row(
          children: [
            Image.asset(
              location,
              width: 18,
            ),
            const Twow(),
            Heading11font500(
                heading:
                    "${profilelist['region']} ${profilelist['personal_details']['sub_region']} ",
                color: blackcolor)
          ],
        ),
        const Twoh(),
      ],
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key, required this.profilelist});
  final Map<String, dynamic> profilelist;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Twoh(),
        Profilepostdata(
          title: "Religion",
          body: profilelist['personal_details']['relegion'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "Caste",
          body: profilelist['personal_details']['cast'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "Mother Tongue",
          body: profilelist['personal_details']['mother_toungue'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "Drinking Habits",
          body: profilelist['personal_details']['drinking_habits'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "Smoking Habits",
          body: profilelist['personal_details']['smoking_habits'],
        ),
        const Twoh(),
      ],
    );
  }
}

class OtherDetails extends StatelessWidget {
  const OtherDetails({super.key, required this.profilelist});
  final Map<String, dynamic> profilelist;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Twoh(),
        Profilepostdata(
          title: "Job Role",
          body: profilelist['work_and_education'][0]['job_role'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "Education",
          body: profilelist['work_and_education'][0]['education_level'],
        ),
        const Oneh(),
        Profilepostdata(
          title: "College",
          body: profilelist['work_and_education'][0]['college'],
        ),
        const Twoh()
      ],
    );
  }
}
