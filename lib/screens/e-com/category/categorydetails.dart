import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/ecom-widget/reusedcard.dart';
import 'package:datingapp/utils/ecom-widget/reusedicon.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndividualCategoryScreen extends StatefulWidget {
  const IndividualCategoryScreen({
    super.key,
  });

  @override
  State<IndividualCategoryScreen> createState() =>
      _IndividualCategoryScreenState();
}

class _IndividualCategoryScreenState extends State<IndividualCategoryScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  bool lovetappped = false;

  List selecteditems = [];

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whitecolor,
          scrolledUnderElevation: 0,
          toolbarHeight: height * .1,
          actions: <Widget>[
            SizedBox(
              height: height * .1,
              child: SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * .04,
                    ),
                    const BackshadowContainer(),
                    const Spacer(),
                    const Text("Kavya Silks",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                            letterSpacing: 1,
                            color: blackcolor)),
                    const Spacer(),
                    SizedBox(
                      width: width * .1,
                    ),
                  ],
                ),
              ),
            )
          ]),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: width * .03, right: width * .03),
              child: Column(
                children: [
                  SizedBox(
                    height: height * .01,
                  ),
                  Container(
                    height: height * .05,
                    width: width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: shadow,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TextField(
                      cursorColor: blackcolor,
                      controller: searchcontroller,
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        fillColor: whitecolor,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 22,
                          color: otpgrey,
                        ),
                        hintText: "Search Products",
                        contentPadding:
                            const EdgeInsets.only(left: 20, top: 9, bottom: 8),
                        hintStyle: const TextStyle(
                            fontSize: 12, color: Color(0xff6B6B6B)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: whitecolor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: whitecolor, width: 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 13.0,
                        height: 1,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B6B6B),
                      ),
                      // maxLines: maxLines,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  SizedBox(
                    width: width,
                    height: height * .84,
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .67,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          index: index,
                        );
                      },
                    ),
                  ),
                  const Fiveh(),
                  const Fiveh(),
                  const Fiveh(),
                ],
              ),
            ),
          ),
          Carddetailssection(
            paddedheight: height * .03,
            listlength: selecteditems.length,
          )
        ],
      ),
    );
  }
}
