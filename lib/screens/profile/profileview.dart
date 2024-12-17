import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/screens/editprofile/editpersonaldetails.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/chatcard/chatcard.dart';
import 'package:datingapp/widget/datingcard/datingcard.dart';
import 'package:datingapp/widget/reuseditems/reused.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchintrestedprofile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        backgroundColor: whitecolor,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "dp",
                child: Center(
                    child: CircleAvatar(
                  radius: 50,
                  backgroundColor: whitecolor,
                  backgroundImage: CachedNetworkImageProvider(
                    myprofiledata['profile_picture'], // Fallback if URL is null
                  ),
                )),
              ),
              const Twoh(),
              Center(
                child: Heading16font700(
                    heading: myprofiledata['name'], color: blackcolor),
              ),
              const Twow(),
              Center(
                child: Heading12font600(
                    heading: "${myprofiledata['age']} age", color: blackcolor),
              ),
              const Oneh(),
              Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => const EditPersonaldeatils());
                      },
                      child: const Editdetails())),
              const Twoh(),
              const Heading14font600(
                  heading: "Interested People ", color: blackcolor),
              const Twoh(),
              Obx(() => dataloading.value
                  ? const ShimmerLoading()
                  : intrestedlist.isEmpty ||
                          intrestedlist['interested_profiles'].isEmpty
                      ? SizedBox(
                          height: height * .3,
                          child: const Center(
                            child: Heading12font700(
                                heading: "No Intrest Found !!",
                                color: blackcolor),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              intrestedlist['interested_profiles'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            // var data = intrestedlist['interested_profiles'];
                            return SlideInLeft(
                              from: index * 10 + 33,
                              duration: Duration(milliseconds: index * 200),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        setState(() {
                                          markintrest(intrestedlist[
                                                      'interested_profiles']
                                                  [index]['id']
                                              .toString());
                                          intrestedlist['interested_profiles']
                                              .removeAt(index);
                                        });
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                key: ValueKey(
                                    intrestedlist['interested_profiles']
                                        [index]),
                                child: IntrestedList(
                                  index: index,
                                  intrestdata:
                                      intrestedlist['interested_profiles']
                                          [index],
                                ),
                              ),
                            );
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
