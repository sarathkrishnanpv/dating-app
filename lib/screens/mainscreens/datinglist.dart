import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/screens/profile/profileview.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/bottomsheets.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/chatcard/chatcard.dart';
import 'package:datingapp/widget/datingcard/datingcard.dart';
import 'package:datingapp/widget/reuseditems/reused.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DatingList extends StatefulWidget {
  const DatingList({super.key});

  @override
  State<DatingList> createState() => _DatingListState();
}

class _DatingListState extends State<DatingList> {
  @override
  void initState() {
    super.initState();
    fetchMyProfile();
    fetchProfiles(1);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: height * .11,
          backgroundColor: whitecolor,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Heading18font700(
                    color: blackcolor,
                    heading: "Dating",
                  ),
                  const Spacer(),
                  Obx(() => myprofiledata.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            Get.to(() => const ProfileView());
                          },
                          child: Hero(
                            tag: "dp",
                            child: CircleAvatar(
                              backgroundColor: whitecolor,
                              backgroundImage: CachedNetworkImageProvider(
                                  myprofiledata[
                                      'profile_picture'] // Fallback if URL is null
                                  ),
                            ),
                          ),
                        )
                      : const SizedBox()),
                ],
              ),
              const Twoh(),
              Obx(() => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          datingindex.value = 0;
                          fetchProfiles(1);
                        },
                        child: SlideInLeft(
                          from: 10,
                          child: Container(
                              color: transparent,
                              height: height * .04,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Heading12font700(
                                      heading: "Profiles", color: blackcolor),
                                  const Halfh(),
                                  Line(
                                      width: width * .23,
                                      color: datingindex.value == 0
                                          ? textgreen
                                          : linegrey)
                                ],
                              )),
                        ),
                      ),
                      const Twow(),
                      // GestureDetector(
                      //   onTap: () {
                      //     datingindex.value = 1;
                      //   },
                      //   child: SlideInLeft(
                      //     from: 20,
                      //     child: Container(
                      //         height: height * .04,
                      //         color: transparent,
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             const Heading12font700(
                      //                 heading: "Interests", color: blackcolor),
                      //             const Halfh(),
                      //             Line(
                      //                 width: width * .23,
                      //                 color: datingindex.value == 1
                      //                     ? const Color(0xff292929)
                      //                     : linegrey)
                      //           ],
                      //         )),
                      //   ),
                      // ),
                      // const Twow(),
                      GestureDetector(
                        onTap: () {
                          datingindex.value = 2;
                        },
                        child: SlideInLeft(
                          from: 30,
                          child: Container(
                              color: transparent,
                              height: height * .04,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Row(
                                    children: [
                                      Heading12font700(
                                          heading: "Chats", color: blackcolor),
                                      Onew(),
                                      ChatcountBox(),
                                    ],
                                  ),
                                  Line(
                                      width: width * .23,
                                      color: datingindex.value == 2
                                          ? textgreen
                                          : linegrey)
                                ],
                              )),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          DatingFilter(context);
                        },
                        child: Container(
                            width: width * .1,
                            height: height * .034,
                            color: transparent,
                            child: SvgPicture.asset(filter)),
                      )
                    ],
                  ))
            ],
          ),
        ),
        body: Obx(() => datingindex.value == 0
            ? dataloading.value
                ? Padding(
                    padding: horizontalPadding,
                    child: const ShimmerLoading(),
                  )
                : datingprofilelist.isEmpty
                    ? const Center(
                        child: Heading12font700(
                            heading: "No Profile Availlable",
                            color: blackcolor),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: datingprofilelist.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DatingCard(
                            profilelist: datingprofilelist[index],
                          );
                        })
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SlideInDown(
                    from: index * 10 + 3,
                    duration: const Duration(milliseconds: 1000),
                    child: ChatCard(
                      index: index,
                    ),
                  );
                })));
  }
}
