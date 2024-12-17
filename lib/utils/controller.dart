import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt tabindex = 0.obs;
RxInt datingindex = 0.obs;
RxBool buttonloading = false.obs;
RxBool dataloading = false.obs;
final List<String> imagePaths = [
  "images/d1.png",
  "images/d1.png",
  "images/d1.png",
];

List genderlist = ["Male", "Female", "Both "];
List educationlist = ["Master’s", "Bachelor's", "Prefer not to say "];
final TextEditingController agecontroller = TextEditingController();
final TextEditingController aboutcontroller = TextEditingController();
final TextEditingController heightcontroller = TextEditingController();
final TextEditingController weightcontroller = TextEditingController();
final TextEditingController namecontroller = TextEditingController();
final TextEditingController preferednamecontroller = TextEditingController();
final TextEditingController religioncontroller = TextEditingController();
final TextEditingController castcontroller = TextEditingController();
final TextEditingController languagecontroller = TextEditingController();
RxString? selectedRegion = RxString("");
RxString? selectedSubRegion = RxString("");
RxString? selectedsex = RxString("");
RxString? maritialstatusselected = RxString("");
RxString? intrestselected = RxString("");
RxString? drinkinghabit = RxString("");
RxString? smokinghabit = RxString("");
RxList datingprofilelist = [].obs;
RxMap myprofiledata = {}.obs;
RxMap intrestedlist = {}.obs;
RxMap personalprofilelist = {}.obs;
RxMap personalworklist = {}.obs;
RxString selectedplaceinintrest = ''.obs;
final List<String> drinking = ["Regular", "Ocassionally", "Never"];
final List<String> smoking = ["Regular", "Ocassionally", "Never"];

List<String> districtsInKerala = [
  "Alappuzha",
  "Ernakulam",
  "Idukki",
  "Kannur",
  "Kasaragod",
  "Kollam",
  "Kottayam",
  "Kozhikode",
  "Malappuram",
  "Palakkad",
  "Pathanamthitta",
  "Thiruvananthapuram",
  "Thrissur",
  "Wayanad",
];
List<String> placesInUK = [
  // England
  "London",
  "Birmingham",
  "Manchester",
  "Liverpool",
  "Leeds",
  "Sheffield",
  "Bristol",
  "Newcastle",
  "Nottingham",
  "Southampton",

  // Scotland
  "Edinburgh",
  "Glasgow",
  "Aberdeen",
  "Dundee",
  "Inverness",
  "Stirling",

  // Wales
  "Cardiff",
  "Swansea",
  "Newport",
  "Bangor",
  "Wrexham",

  // Northern Ireland
  "Belfast",
  "Derry",
  "Lisburn",
  "Newry",
  "Bangor (Northern Ireland)",
];

List<String> combinedplaces = [
  "Alappuzha",
  "Ernakulam",
  "Idukki",
  "Kannur",
  "Kasaragod",
  "Kollam",
  "Kottayam",
  "Kozhikode",
  "Malappuram",
  "Palakkad",
  "Pathanamthitta",
  "Thiruvananthapuram",
  "Thrissur",
  "Wayanad",
  // England
  "London",
  "Birmingham",
  "Manchester",
  "Liverpool",
  "Leeds",
  "Sheffield",
  "Bristol",
  "Newcastle",
  "Nottingham",
  "Southampton",

  // Scotland
  "Edinburgh",
  "Glasgow",
  "Aberdeen",
  "Dundee",
  "Inverness",
  "Stirling",

  // Wales
  "Cardiff",
  "Swansea",
  "Newport",
  "Bangor",
  "Wrexham",

  // Northern Ireland
  "Belfast",
  "Derry",
  "Lisburn",
  "Newry",
  "Bangor (Northern Ireland)",
];

final List<String> dpimage = [
  "dpimage.png",
];
final TextEditingController jobrolecontroller = TextEditingController();
RxInt educationindex = 0.obs;
RxString educationselected = "Master’s".obs;

final TextEditingController collegenamecontroller = TextEditingController();
String? imageName;
File? selectedImage;
final List<String> imageNames = [];
final List<File> images = [];
final List<String> gender = ["Male", "Femele", "Others"];
final List<String> maritialstatus = ["Single", "Commited", "Others"];
final List<String> intrest = ["Intrest1", "Intrest2", "Intrest3"];
final List<String> region = [
  "UK",
  "INDIA",
];
List<String> commonInterests = [
  "Sports and Fitness",
  "Music",
  "Travel",
  "Cooking and Baking",
  "Movies and TV Shows",
  "Books and Literature",
  "Gaming",
  "Photography",
  "Pets",
  "Fashion",
  "Volunteering",
  "Sustainability",
  "Technology",
  "Comedy",
  "Astrology",
];
