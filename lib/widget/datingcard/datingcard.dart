import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingapp/screens/dating/detaildatingview.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DatingCard extends StatelessWidget {
  const DatingCard({
    super.key,
    required this.profilelist,
  });
  final Map<String, dynamic> profilelist;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final RxInt currentIndex = 0.obs;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailedDatingView(
              profilelist: profilelist,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Oneh(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: width,
                height: height * .25,
                child: CarouselSlider(
                  items: [
                    CachedNetworkImage(
                      imageUrl: profilelist[
                          'profile_picture'], // Show only the first image
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ],
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: false, // Disable infinite scroll
                    autoPlay: false, // No autoplay for a single image
                  ),
                ),
              ),
              SizedBox(
                height: height * .25,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          verified,
                          width: width * .22,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // DotsIndicator(
                    //   dotsCount: profilelist["additional_images"].length,
                    //   position: currentIndex.value,
                    //   decorator: DotsDecorator(
                    //     size: const Size(32.0, 10.0),
                    //     color: whitecolor.withOpacity(.8),
                    //     activeSize: const Size(25.0, 4.0),
                    //     activeColor: whitecolor,
                    //     activeShape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(5.0)),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const Oneh(),
          Padding(
            padding: horizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Heading16font700(
                        heading: profilelist['name'], color: blackcolor),
                    const Twow(),
                    Heading12font500(
                        heading: "${profilelist['age']} age",
                        color: blackcolor),
                    const Spacer(),
                    // CustomLikeButton(),
                  ],
                ),
                const Oneh(),
                Row(
                  children: [
                    Image.asset(
                      book,
                      width: 18,
                    ),
                    const Twow(),
                    Heading11font500(
                        heading:
                            "${profilelist['personal_details']['relegion']} ${profilelist['personal_details']['cast']}",
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
                        heading:
                            "${profilelist['work_and_education'][0]['education_level']}",
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
                            "${profilelist['personal_details']['sub_region']},${profilelist['region']}",
                        color: blackcolor)
                  ],
                ),
                const Oneh(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideInDown(
                      from: 20,
                      child: OutlineButton(
                        buttontitle: "View Profile",
                        onpressed: () {
                          Get.to(() => DetailedDatingView(
                                profilelist: profilelist,
                              ));
                        },
                      ),
                    ),
                    SlideInDown(
                        from: 40,
                        child: SubButton(
                            onpressed: () {
                              markintrest(profilelist['id'].toString());
                            },
                            buttontitle: "Interested"))
                  ],
                ),
                const Threeh(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 15.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 200,
                      height: 15.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 120.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 15),
    );
  }
}
