import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/ecom-widget/reusedcard.dart';
import 'package:datingapp/utils/ecom-widget/reusedicon.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int counter = 1;
  List currentindexlist = [];

  @override
  void initState() {
    super.initState();
  }

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
                    const Text("Favourites",
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
            child: Padding(
              padding: EdgeInsets.only(left: width * .05, right: width * .05),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: .7,
                    ),
                    padding: const EdgeInsets.all(3.0),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ProductCard(index: index);
                    },
                  ),
                  SizedBox(
                    height: height * .075,
                  )
                ],
              ),
            ),
          ),
          currentindexlist.isEmpty
              ? const SizedBox()
              : Carddetailssection(
                  paddedheight: height * .03,
                  listlength: currentindexlist.length,
                )
        ],
      ),
    );
  }
}
