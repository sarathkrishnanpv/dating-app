import 'package:datingapp/screens/e-com/adress/editadress.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';

class DeliveryAdress extends StatefulWidget {
  const DeliveryAdress({
    super.key,
  });

  @override
  State<DeliveryAdress> createState() => _DeliveryAdressState();
}

class _DeliveryAdressState extends State<DeliveryAdress> {
  int? adressselected;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: width * .05, right: width * .05),
          child: Column(
            children: [
              SizedBox(
                height: height * .082,
              ),
              const AppbarSection(heading: "Delivery Address"),
              SizedBox(
                width: width,
                height: height * .65,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  adressselected = index;
                                });
                              },
                              child: Container(
                                width: width,
                                height: height * .22,
                                decoration: BoxDecoration(
                                    color: adressselected == index
                                        ? whitecolor
                                        : textfeildcolor,
                                    border: Border.all(
                                        color: adressselected == index
                                            ? green
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/locationblack.png",
                                            width: width * .045,
                                          ),
                                          SizedBox(
                                            width: width * .01,
                                          ),
                                          const Text("Deliver To : Home",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Gilroy',
                                                  fontSize: 12,
                                                  letterSpacing: .8,
                                                  color: blackcolor)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("Trivandrum ",
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .8,
                                                color: blackcolor)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("Manacaud",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .8,
                                                color: blackcolor)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("6995001",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Gilroy',
                                                fontSize: 12,
                                                letterSpacing: .8,
                                                color: blackcolor)),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: width * .025,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EditAdressDetails()),
                                              );
                                            },
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: primary
                                                          .withOpacity(.5),
                                                      blurRadius: 8,
                                                      spreadRadius: 1,
                                                    ),
                                                  ],
                                                  color: primary,
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: Image.asset(
                                                  "images/edit.png",
                                                  height: height * .016,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "images/close.png",
                                  height: height * .04,
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const MapViewScreen(
                  //             route: 'adressadding',
                  //           )),
                  // );
                },
                child: Container(
                  width: width * .85,
                  height: height * .07,
                  decoration: BoxDecoration(
                      color: whitecolor,
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .07,
                      ),
                      const Text("Add New Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Gilroy',
                              fontSize: 14,
                              letterSpacing: .8,
                              color: blackcolor)),
                      const Spacer(),
                      Container(
                        width: width * .1,
                        height: height * .07,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(.5),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ], color: primary, shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: whitecolor,
                          size: 20,
                        )),
                      ),
                      SizedBox(
                        width: width * .07,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              MainButton(
                buttontitle: "Confirm",
                onpressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: height * .1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
