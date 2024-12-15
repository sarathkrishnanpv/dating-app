import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/controller.dart';

class ChatScreen extends StatefulWidget {
  final String chatPartnerId;
  final String chatPartnerName;
  final String chatPartnerProfilePic;

  const ChatScreen(
      {super.key,
      required this.chatPartnerId,
      required this.chatPartnerName,
      required this.chatPartnerProfilePic});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get _currentUserId => myprofiledata['id'].toString() ?? "1";

  // Generate a unique chat room ID
  String _getChatRoomId(String userId1, String userId2) {
    return userId1.compareTo(userId2) > 0
        ? '$userId1-$userId2'
        : '$userId2-$userId1';
  }

  void _sendMessage() async {
    final String messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    try {
      // Create a reference to the chat room
      final chatRoomId = _getChatRoomId(_currentUserId, widget.chatPartnerId);

      // Create a new message document
      await _firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .add({
        'senderId': _currentUserId,
        'receiverId': widget.chatPartnerId,
        'text': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the text field after sending
      _messageController.clear();
    } catch (e) {
      print('Error sending message: $e');
      // TODO: Add error handling (e.g., show a toast)
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProfiles(1); // Keep your existing profile fetching logic
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final chatRoomId = _getChatRoomId(_currentUserId, widget.chatPartnerId);
    print('id : ${widget.chatPartnerId}');
    print('name : ${widget.chatPartnerName}');
    print('pic : ${widget.chatPartnerProfilePic}');
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatPartnerProfilePic),
            ),
            const Twow(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading14font600(
                    heading: widget.chatPartnerName, color: blackcolor),
                Row(
                  children: const [
                    Onlinedot(color: Colors.greenAccent),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chat_rooms')
                  .doc(chatRoomId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No messages yet'));
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data!.docs[index];
                    final bool isMe = message['senderId'] == _currentUserId;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width * .03, vertical: 5),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? primary : const Color(0xffd4f3f1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          message['text'],
                          style: TextStyle(
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
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
                    controller: _messageController,
                    onSubmitted: (_) => _sendMessage(),
                  )),
                  const Twow(),
                  GestureDetector(
                      onTap: _sendMessage, child: SvgPicture.asset(send))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
