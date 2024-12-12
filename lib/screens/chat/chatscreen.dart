import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(text: "Hi there!", isMe: false),
    Message(text: "Hello! How are you?", isMe: true),
    Message(text: "I'm good, thanks! What about you?", isMe: false),
    Message(text: "Doing great, working on a project!", isMe: true),
  ];
  final TextEditingController _messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(dp)),
            Twow(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading14font600(
                    heading: "Lawrence Kennedy", color: blackcolor),
                Row(
                  children: [
                    Onlinedot(
                      color: Colors.greenAccent,
                    ),
                    Twow(),
                    Heading11font500(heading: "User Active", color: blackcolor),
                  ],
                )
              ],
            )
          ],
        ),
        backgroundColor: whitecolor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isMe ? primary : const Color(0xffd4f3f1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: const Color(0xffAFAFAF).withOpacity(.15),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, bottom: 20, top: 10),
              child: Row(
                children: [
                  const Twow(),
                  Expanded(
                      child: ChatTextFeild(
                          hint: "Enter a message",
                          controller: _messagecontroller)),
                  const Twow(),
                  SvgPicture.asset(send)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
