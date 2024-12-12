import 'package:datingapp/screens/e-com/mainscreen/homepage.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdressDetails extends StatefulWidget {
  const AdressDetails({
    super.key,
  });

  @override
  State<AdressDetails> createState() => _AdressDetailsState();
}

class _AdressDetailsState extends State<AdressDetails> {
  int selectedadress = 0;
  final TextEditingController _adresscontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _pincodecontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: EdgeInsets.only(left: width * .05, right: width * .05),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .07,
              ),
              const AppbarSection(heading: "Location"),
              SizedBox(
                height: height * .03,
              ),
              const Text("Enter Your Delivery Location",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy',
                      fontSize: 13,
                      letterSpacing: .8,
                      color: blackcolor)),
              SizedBox(
                height: height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedadress = 0;
                      });
                    },
                    child: Container(
                      width: width * .28,
                      height: height * .06,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedadress == 0
                                ? primary
                                : Colors.transparent,
                          ),
                          color: const Color(0xffFFE7E1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.home_outlined,
                            color: selectedadress == 0 ? primary : blackcolor,
                            size: 20,
                          ),
                          SizedBox(
                            width: width * .012,
                          ),
                          Text("Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  letterSpacing: .8,
                                  color: selectedadress == 0
                                      ? primary
                                      : blackcolor)),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedadress = 1;
                      });
                    },
                    child: Container(
                      width: width * .28,
                      height: height * .06,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedadress == 1
                                ? primary
                                : Colors.transparent,
                          ),
                          color: const Color(0xffFFE7E1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.work,
                            size: 20,
                            color: selectedadress == 1 ? primary : blackcolor,
                          ),
                          SizedBox(
                            width: width * .012,
                          ),
                          Text("Work",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  letterSpacing: .8,
                                  color: selectedadress == 1
                                      ? primary
                                      : blackcolor)),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedadress = 2;
                      });
                    },
                    child: Container(
                      width: width * .28,
                      height: height * .06,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedadress == 2
                                ? primary
                                : Colors.transparent,
                          ),
                          color: const Color(0xffFFE7E1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: selectedadress == 2 ? primary : blackcolor,
                          ),
                          SizedBox(
                            width: width * .012,
                          ),
                          Text("Other",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  letterSpacing: .8,
                                  color: selectedadress == 2
                                      ? primary
                                      : blackcolor)),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              SizedBox(
                height: height * .12,
                width: width,
                child: TextField(
                  maxLines: 6,
                  cursorColor: blackcolor,
                  textAlignVertical: TextAlignVertical.top,
                  controller: _adresscontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 25, left: 12),
                    fillColor: textfeildcolor,
                    filled: true,
                    hintText: "Address",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: blackcolor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 13.0,
                    color: blackcolor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: height * .012,
              ),
              SizedBox(
                height: height * .06,
                width: width,
                child: TextField(
                  cursorColor: blackcolor,
                  textAlignVertical: TextAlignVertical.top,
                  controller: _citycontroller,
                  decoration: InputDecoration(
                    fillColor: textfeildcolor,
                    contentPadding:
                        EdgeInsets.only(left: width * .05, right: width * .05),
                    filled: true,
                    hintText: "City",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: blackcolor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: blackcolor,
                  ),
                ),
              ),
              SizedBox(
                height: height * .012,
              ),
              SizedBox(
                height: height * .06,
                width: width,
                child: TextField(
                  cursorColor: blackcolor,
                  textAlignVertical: TextAlignVertical.top,
                  controller: _pincodecontroller,
                  decoration: InputDecoration(
                    fillColor: textfeildcolor,
                    filled: true,
                    hintText: "Pin Code",
                    contentPadding:
                        EdgeInsets.only(left: width * .05, right: width * .05),
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: blackcolor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: textfeildcolor, width: 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: blackcolor,
                  ),
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              SizedBox(
                height: height * .1,
              ),
              Center(
                  child: MainButton(
                buttontitle: 'Done',
                onpressed: () {
                  Get.to(() => const HomePage());
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
