import 'package:datingapp/screens/mainscreens/datinglist.dart';
import 'package:datingapp/screens/register/walkthrough.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCheck extends StatelessWidget {
  const ProfileCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: whitecolor,
          body: myprofiledata['is_active']
              ? const DatingList()
              : const WalkThrough(),
        ));
  }
}
