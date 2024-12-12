import 'package:animate_do/animate_do.dart';
import 'package:datingapp/screens/e-com/category/categorydetails.dart';
import 'package:datingapp/screens/e-com/product/individualproductscreen.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/ecom-widget/reusedcard.dart';
import 'package:datingapp/utils/ecom-widget/reusedicon.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.searchterm,
    required this.categorylist,
  });
  final String searchterm;
  final List categorylist;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List selectedindex = [];
  int counter = 1;
  List searchlist = [
    {
      'img': 'images/prdt3.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true
    },
    {
      'img': 'images/prdt1.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true
    },
    {
      'img': 'images/prdt2.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true
    },
    {
      'img': 'images/prdt3.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': true
    },
  ];
  bool loading = false;
  bool incrementloading = false;
  final TextEditingController _serachcontroller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  List<dynamic> favourites = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whitecolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whitecolor,
          elevation: 0,
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
                    const Spacer(),
                    SizedBox(
                      width: width * .1,
                    ),
                  ],
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * .05, right: width * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      focusNode: focusNode,
                      cursorColor: blackcolor,
                      controller: _serachcontroller,
                      decoration: InputDecoration(
                        fillColor: whitecolor,
                        filled: true,
                        prefixIcon: GestureDetector(
                          child: const Icon(
                            Icons.search,
                            size: 22,
                            color: otpgrey,
                          ),
                        ),
                        hintText: "Search Products",
                        contentPadding:
                            const EdgeInsets.only(left: 22, top: 10, bottom: 8),
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
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  const Text("Top Search",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          fontSize: 12,
                          letterSpacing: .8,
                          color: blackcolor)),
                  SizedBox(
                    height: height * .02,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 14.0,
                              crossAxisSpacing: 6,
                              childAspectRatio: .63),
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: widget.categorylist.length > 8
                          ? 8
                          : widget.categorylist.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => const IndividualCategoryScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowcolor.withOpacity(.6),
                                    blurRadius: 10,
                                    spreadRadius: .3,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    widget.categorylist[index]['img'],
                                    height: height * .1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                Hero(
                                    tag: index,
                                    child: Text(
                                        widget.categorylist[index]['name'],
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gilroy',
                                            fontSize: 11,
                                            letterSpacing: .8,
                                            color: blackcolor))),
                                SizedBox(
                                  height: height * .015,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: height * .015,
                  ),
                  const Text("Search Result",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy',
                          fontSize: 12,
                          letterSpacing: .8,
                          color: blackcolor)),
                  SizedBox(
                    height: height * .015,
                  ),
                  SizedBox(
                    width: width,
                    child: GridView.builder(
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
                  )
                ],
              ),
            ),
            selectedindex.isEmpty
                ? const SizedBox()
                : Carddetailssection(
                    paddedheight: height * .095,
                    listlength: 3,
                  )
          ],
        ),
      ),
    );
  }

  void _toggleLike(List favourites, index) {
    setState(() {
      if (favourites.contains(index)) {
        favourites.remove(index);
      } else {
        favourites.add(index);
      }
    });
  }
}
