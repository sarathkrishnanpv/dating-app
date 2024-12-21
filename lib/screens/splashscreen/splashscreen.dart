import 'package:datingapp/screens/hometab/hometab.dart';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkalreadyloged();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whitecolor,
    );
  }
}

Future<void> checkalreadyloged() async {
  await fetchMyProfile().then((_) {
    Get.to(() => const Hometab());
  });
}
