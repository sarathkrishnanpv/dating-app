import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datingapp/screens/e-com/drawer/drawer.dart';
import 'package:datingapp/screens/e-com/mainscreen/cart.dart';
import 'package:datingapp/screens/e-com/product/individualproductscreen.dart';
import 'package:datingapp/screens/e-com/search/searchscreen.dart';
import 'package:datingapp/screens/e-com/shop/shopdetails.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/ecom-widget/reusedcard.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  List dealofdayindexlist = [];
  int dealofdaycounter = 1;
  List topproductindexist = [];
  int topproductcounter = 1;
  bool lovetappped = false;
  bool topdealloading = false;
  List<dynamic> dealofday = [];
  List<dynamic> favourites = [];
  final TextEditingController searchcontroller = TextEditingController();

  List<dynamic> bannerimages = [
    'images/banner.png',
    'images/banner.png',
    'images/banner.png'
  ];
  List<Map<String, dynamic>> productlist = [
    {
      'img': 'images/prdt1.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': false
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
    {
      'img': 'images/prdt1.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': false
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
  int notificationpending = 2;
  bool incrementloading = false;
  List<Map<String, dynamic>> categorylist = [
    {'img': 'images/cat1.png', 'name': 'Electronics'},
    {'img': 'images/cat2.png', 'name': 'Grocery'},
    {'img': 'images/cat3.png', 'name': 'Fashion'},
    {'img': 'images/cat4.png', 'name': 'Food'},
    {'img': 'images/cat1.png', 'name': 'Electronics'},
    {'img': 'images/cat2.png', 'name': 'Grocery'},
    {'img': 'images/cat3.png', 'name': 'Fashion'},
    {'img': 'images/cat4.png', 'name': 'Food'},
  ];
  List<Map<String, dynamic>> dealofdaylist = [
    {
      'img': 'images/prdt1.png',
      'name': 'Crab',
      "cat": 'Crabs',
      'isloved': "true",
      'sp': "300",
      'mrp': "450",
      "rating": '4.5',
      "rat_count": "200",
      'is_active': false
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    FocusScope.of(context).unfocus();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whitecolor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      scrolledUnderElevation: 0,
                      backgroundColor: whitecolor,
                      elevation: 0,
                      expandedHeight: height * .135,
                      floating: true,
                      pinned: true,
                      snap: true,
                      stretch: true,
                      automaticallyImplyLeading: false,
                      leading: GestureDetector(
                        onTap: () {
                          Get.to(() => const DrawerScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * .04, bottom: 1, top: 1),
                          child: Image.asset(
                            "images/dpicon.png",
                            width: width * .2,
                          ),
                        ),
                      ),
                      actions: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const Cart(route: "true"));
                              },
                              child: Image.asset(
                                "images/Buy.png",
                                width: width * .06,
                              ),
                            ),
                            notificationpending > 0
                                ? Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle, color: primary),
                                  )
                                : const SizedBox()
                          ],
                        ),
                        SizedBox(
                          width: width * .06,
                        )
                      ],
                      title: FadeInDown(
                        from: 10,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(PageAnimationTransition(
                            //     page: const SavedLocationScreen(),
                            //     pageAnimationType: FadeAnimationTransition()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/aim.png",
                                width: width * .05,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text("New Delhi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Gilroy',
                                        fontSize: 13,
                                        letterSpacing: .8,
                                        color: blackcolor)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                        padding: EdgeInsets.only(top: height * .12),
                        child: SizedBox(
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height * .05,
                                width: width * .9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: shadowcolor,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  cursorColor: blackcolor,
                                  onTap: () {
                                    Get.to(() => SearchScreen(
                                        searchterm: "a",
                                        categorylist: categorylist));
                                  },
                                  controller: searchcontroller,
                                  decoration: InputDecoration(
                                    fillColor: whitecolor,
                                    filled: true,
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      size: 22,
                                      color: otpgrey,
                                    ),
                                    hintText: "Search Products",
                                    contentPadding: const EdgeInsets.all(1),
                                    hintStyle: const TextStyle(
                                        fontSize: 13, color: Color(0xff6B6B6B)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: whitecolor, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                          color: whitecolor, width: 1),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6B6B6B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                    // clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * .05,
                                  right: width * .05,
                                  top: 15,
                                  bottom: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                      initialPage: 0,
                                      viewportFraction: 1,
                                      aspectRatio: 15 / 7.2,
                                      enableInfiniteScroll: true,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) =>
                                          setState(() => activeIndex = index)),
                                  items: bannerimages.map((bannerimages) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                            width: width,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    const IndividualProductScreen());
                                              },
                                              child: GestureDetector(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    bannerimages,
                                                  ),
                                                ),
                                              ),
                                            ));
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .005,
                            ),
                            // buildIndicator(bannerimages.length),
                            SizedBox(
                              height: height * .005,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * .05, right: width * .05),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Categories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy',
                                          fontSize: 13,
                                          letterSpacing: .8,
                                          color: blackcolor)),
                                  // GestureDetector(
                                  //   onTap: () {},
                                  //   child: Container(
                                  //     width: width * .13,
                                  //     height: height * .03,
                                  //     color: Colors.transparent,
                                  //     child: Align(
                                  //       alignment: Alignment.centerRight,
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.end,
                                  //         children: [
                                  //           const Text("All",
                                  //               style: TextStyle(
                                  //                   fontWeight: FontWeight.w600,
                                  //                   fontFamily: 'Gilroy',
                                  //                   fontSize: 11,
                                  //                   letterSpacing: .8,
                                  //                   color: blackcolor)),
                                  //           Image.asset(
                                  //             "images/arrowright.png",
                                  //             height: height * .02,
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * .05, right: width * .05),
                              child: SizedBox(
                                  width: width,
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              mainAxisSpacing: 14.0,
                                              crossAxisSpacing: 6,
                                              childAspectRatio: .63),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: categorylist.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(() => const ShopScreen());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: shadowcolor
                                                        .withOpacity(.6),
                                                    blurRadius: 10,
                                                    spreadRadius: .3,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SlideInUp(
                                                    from: 30,
                                                    child: Container(
                                                      width: width * .2,
                                                      height: height * .11,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: primary,
                                                              width: .5),
                                                          color: whitecolor,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: Image.asset(
                                                          categorylist[index]
                                                              ['img'],
                                                          height: height * .1,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )),
                                                const Spacer(),
                                                Text(
                                                    categorylist[index]['name'],
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 11,
                                                        letterSpacing: .8,
                                                        color: blackcolor)),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                            ),
                            Container(
                              width: width,
                              height: height * .45,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    pink.withOpacity(.1),
                                    pink.withOpacity(.4),
                                    pink.withOpacity(.75),
                                    pink.withOpacity(.75),
                                    pink.withOpacity(.85),
                                    pink.withOpacity(.95),
                                    pink.withOpacity(.9),
                                    pink.withOpacity(.99),
                                    pink,
                                    pink.withOpacity(.99),
                                    pink.withOpacity(.9),
                                    pink.withOpacity(.95),
                                    pink.withOpacity(.85),
                                    pink.withOpacity(.75),
                                    pink.withOpacity(.75),
                                    pink.withOpacity(.4),
                                    pink.withOpacity(.1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * .05,
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * .065,
                                      ),
                                      const Text("Deal Of The Day",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy',
                                              fontSize: 13,
                                              letterSpacing: .8,
                                              color: blackcolor)),
                                      SizedBox(
                                        height: height * .03,
                                      ),
                                      SizedBox(
                                          width: width,
                                          height: height * .32,
                                          child: ListView.builder(
                                              clipBehavior: Clip.none,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: productlist.length,
                                              itemBuilder: (context, index) {
                                                return ProductCard(
                                                    index: index);
                                              })),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * .05, right: width * .05),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Top Selling Products",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Gilroy',
                                        fontSize: 13,
                                        letterSpacing: .8,
                                        color: blackcolor)),
                              ),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            dealandtopsellingprdtcard(width, height),
                            SizedBox(
                              height: height * .13,
                            )
                          ],
                        ),
                      ),
                    ]))),
            dealofdayindexlist.isEmpty && topproductindexist.isEmpty
                ? const SizedBox()
                : Carddetailssection(
                    paddedheight: height * .09,
                    listlength:
                        dealofdayindexlist.length + topproductindexist.length,
                  )
          ],
        ));
  }

  Padding dealandtopsellingprdtcard(double width, double height) {
    return Padding(
      padding: EdgeInsets.only(left: width * .01, right: width * .01),
      child: SizedBox(
        width: width,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: .76,
          ),
          padding: const EdgeInsets.all(3.0),
          itemCount: productlist.length,
          itemBuilder: (context, index) {
            return ProductCard(index: index);
          },
        ),
      ),
    );
  }

  void _toggleLike(List favouritelist, index) {
    setState(() {
      if (favouritelist.contains(index)) {
        favouritelist.remove(index);
      } else {
        favouritelist.add(index);
      }
    });
  }
}
