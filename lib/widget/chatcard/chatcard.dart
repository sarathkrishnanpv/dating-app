import 'package:cached_network_image/cached_network_image.dart';
import 'package:datingapp/screens/chat/chatscreen.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/reuseditems/reused.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ChatScreen(
              chatPartnerId: '1', // replace needed with actual data
              chatPartnerName: "hey",
              chatPartnerProfilePic: "jiji",
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(index.isEven ? dp : dp1),
            ),
            const Twow(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading15font700(
                    heading: index.isEven ? "Dwight Rogers" : "Sherri Austin",
                    color: blackcolor),
                const Heading11font500(
                    heading: "what is your job in it indiutry",
                    color: blackcolor),
              ],
            ),
            const Spacer(),
            const Heading10font500(
                heading: "Just Now", color: Color(0xff555555)),
            const Onew(),
            index.isEven ? const ChatcountBox() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class IntrestedList extends StatelessWidget {
  const IntrestedList(
      {super.key, required this.index, required this.intrestdata});
  final int index;
  final Map<String, dynamic> intrestdata;
  @override
  Widget build(BuildContext context) {
    print(intrestdata.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
                CachedNetworkImageProvider(intrestdata['profile_picture']),
          ),
          const Twow(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading15font700(
                  heading: intrestdata['preffered_name'], color: blackcolor),
              Heading11font500(
                  heading: "${intrestdata['age']} Age", color: blackcolor),
            ],
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                print(intrestdata["id"]);
                print(intrestdata["name"]);
                print(intrestdata["profile_picture"]);
                Get.to(() => ChatScreen(
                    chatPartnerId:
                        intrestdata["id"].toString(), // Use the actual user ID
                    chatPartnerName: intrestdata["name"],
                    chatPartnerProfilePic: intrestdata["profile_picture"]));
              },
              child: const ChatBox())
        ],
      ),
    );
  }
}
