import 'package:datingapp/utils/colors.dart';
import 'package:flutter/material.dart';

class BackshadowContainer extends StatelessWidget {
  const BackshadowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pop(context);
      },
      child: Container(
        width: width * .12,
        height: height * .06,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whitecolor,
            border: Border.all(width: .5, color: const Color(0XFFB1B1B1))),
        child: const Center(
            child: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 16,
          color: blackcolor,
        )),
      ),
    );
  }
}
