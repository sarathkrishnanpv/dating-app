import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ChatcountBox extends StatelessWidget {
  const ChatcountBox({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .055,
      height: height * .025,
      decoration:
          BoxDecoration(color: red, borderRadius: BorderRadius.circular(4)),
      child: const Center(
          child: Heading12font700(heading: "4", color: whitecolor)),
    );
  }
}

class Tabnotch extends StatelessWidget {
  const Tabnotch({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .17,
      height: height * .007,
      decoration: BoxDecoration(
          color: const Color(0xff3c3c434d),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

class Editdetails extends StatelessWidget {
  const Editdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // height: height * .025,
          decoration: BoxDecoration(
              color: const Color(0xffD4F3F1),
              borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
                child:
                    Heading12font700(heading: "Edit Details", color: primary)),
          ),
        ),
      ],
    );
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .18,
          height: height * .045,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
                child: Heading12font700(heading: "Chat", color: whitecolor)),
          ),
        ),
      ],
    );
  }
}
