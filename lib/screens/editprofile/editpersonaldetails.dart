import 'dart:io';
import 'package:datingapp/service/apicalls.dart';
import 'package:datingapp/utils/colors.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/ecom-widget/toast.dart';
import 'package:datingapp/utils/images.dart';
import 'package:datingapp/utils/reusedtext.dart';
import 'package:datingapp/utils/spacing.dart';
import 'package:datingapp/utils/textfeild.dart';
import 'package:datingapp/widget/buttons/buttons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class EditPersonaldeatils extends StatefulWidget {
  const EditPersonaldeatils({super.key});

  @override
  State<EditPersonaldeatils> createState() => _EditPersonaldeatilsState();
}

class _EditPersonaldeatilsState extends State<EditPersonaldeatils> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: width * .05);
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: whitecolor,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: horizontalPadding,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Oneh(),
                const Row(
                  children: [
                    Heading17font700(
                        heading: "Basic Details", color: blackcolor),
                    Spacer(),
                    Heading12font700(heading: "10%", color: blackcolor)
                  ],
                ),
                const Oneh(),
                LinearProgressIndicator(
                  value: .1,
                  color: primary,
                  backgroundColor: primary.withOpacity(.3),
                ),
                const Twoh(),
                const Heading12font700(
                    heading: "Profile Picture", color: blackcolor),
                const Oneh(),
                DottedBorder(
                  color: linegrey, // Color of the border
                  strokeWidth: 1.2, // Thickness of the border
                  dashPattern: const [6, 3], // Define the dash and gap length
                  borderType: BorderType.RRect, // Rounded corners
                  radius: const Radius.circular(12), // Corner radius
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: width,
                    height: height * .2,
                    color: lightwhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(pick),
                        const Oneh(),
                        const Heading12font700(
                            heading: "This image will set as your profile.",
                            color: blackcolor),
                        const Halfh(),
                        const Heading10font500(
                            heading: "Maximum size of the image is 5.MB",
                            color: blackcolor),
                        const Oneh(),
                        MiniButton(
                            onpressed: () {
                              _pickDpImageFromGallery();
                            },
                            buttontitle: "Upload Image")
                      ],
                    ),
                  ),
                ),
                const Oneh(),
                imageName != null
                    ? Wrap(
                        spacing: 8.0, // Horizontal spacing between chips
                        runSpacing:
                            4.0, // Vertical spacing between rows of chips
                        children: dpimage.map((label) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(galery),
                              const Onew(),
                              Heading12font600(
                                  heading: imageName!, color: blackcolor),
                            ],
                          );
                        }).toList(), // Map each label to a Chip
                      )
                    : const SizedBox(),
                const Oneh(),
                const Heading12font700(heading: "Images", color: blackcolor),
                const Oneh(),
                DottedBorder(
                  color: linegrey, // Color of the border
                  strokeWidth: 1.2, // Thickness of the border
                  dashPattern: const [6, 3], // Define the dash and gap length
                  borderType: BorderType.RRect, // Rounded corners
                  radius: const Radius.circular(12), // Corner radius
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: width,
                    height: height * .22,
                    color: lightwhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(pick),
                        const Oneh(),
                        const Heading12font700(
                            heading:
                                "These images will be shows in the profile\n(0/4)",
                            color: blackcolor),
                        const Halfh(),
                        const Heading10font500(
                            heading: "Maximum size of the image is 2.MB",
                            color: blackcolor),
                        const Oneh(),
                        MiniButton(
                            onpressed: () {
                              _pickImages();
                            },
                            buttontitle: "Upload Image")
                      ],
                    ),
                  ),
                ),
                const Oneh(),
                Wrap(
                  spacing: 8.0, // Horizontal space between items
                  runSpacing: 4.0, // Vertical space between lines
                  children: List.generate(
                    images.length,
                    (index) {
                      String trimmedName =
                          "Image${index + 1}.png"; // Adjusted name logic
                      return Chip(
                        backgroundColor: whitecolor,
                        deleteIcon: const Icon(
                          Icons.close,
                          color: red,
                        ),
                        onDeleted: () {
                          setState(() {
                            images.removeAt(index);
                          });
                        },
                        deleteIconColor: red,
                        avatar: CircleAvatar(
                          child: SvgPicture.asset(
                            galery,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        label: Text(
                          trimmedName,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),
                ),
                const Twoh(),
                const Heading12font700(heading: "Name", color: blackcolor),
                const Oneh(),
                CustomTextfeild(
                  controller: namecontroller,
                  hint: "Enter name",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name cannot be empty';
                    }

                    return null;
                  },
                ),
                const Oneh(),
                const Heading12font700(
                    heading: "Preffered Name", color: blackcolor),
                const Oneh(),
                CustomTextfeild(
                  controller: preferednamecontroller,
                  hint: "Enter name",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Preffered name cannot be empty';
                    }

                    return null;
                  },
                ),
                const Oneh(),
                const Heading12font700(heading: "Sex", color: blackcolor),
                const Oneh(),
                SelectionDropDown(
                  options: gender,
                  initialValue: selectedsex?.value.isNotEmpty == true
                      ? selectedsex!.value
                      : null,
                  hint: "Select your Gender",
                  onChanged: (String value) {
                    selectedsex!.value = value;
                  },
                ),
                const Oneh(),
                const Heading12font700(
                    heading: "Choose Region", color: blackcolor),
                const Oneh(),
                SelectionDropDown(
                  options: region,
                  initialValue: selectedRegion!.value.isNotEmpty == true
                      ? selectedRegion!.value
                      : null,
                  hint: "Select your Region",
                  onChanged: (String value) {
                    selectedRegion!.value = value;
                  },
                ),
                const Oneh(),
                const Heading12font700(heading: "Age", color: blackcolor),
                const Oneh(),
                CustomTextfeild(
                  controller: agecontroller,
                  hint: "Age",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter valid age';
                    }

                    return null;
                  },
                ),
                const Oneh(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Heading12font700(
                            heading: "Height in CM", color: blackcolor),
                        const Oneh(),
                        HalfTextfeild(
                          hint: "Eg: 160 ",
                          controller: heightcontroller,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter valid Height';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Heading12font700(
                            heading: "Weight in KG", color: blackcolor),
                        const Oneh(),
                        HalfTextfeild(
                          hint: "Eg: 60 ",
                          controller: weightcontroller,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter valid Weight';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Oneh(),
                const Heading12font700(
                    heading: "Marital Status", color: blackcolor),
                const Oneh(),
                SelectionDropDown(
                  options: maritialstatus,
                  hint: "Select your Marital Status",
                  initialValue: maritialstatusselected!.value.isNotEmpty == true
                      ? maritialstatusselected!.value
                      : null,
                  onChanged: (String value) {
                    maritialstatusselected!.value = value;
                  },
                ),
                const Oneh(),
                const Heading12font700(heading: "Interest", color: blackcolor),
                const Oneh(),
                SelectionDropDown(
                  options: commonInterests,
                  hint: "Select your Interest",
                  initialValue: intrestselected!.value.isNotEmpty == true
                      ? intrestselected!.value
                      : null,
                  onChanged: (String value) {
                    intrestselected!.value = value;
                  },
                ),
                const Oneh(),
                const Heading12font700(heading: "Bio ", color: blackcolor),
                const Oneh(),
                BioTextfeild(
                  hint: "Bio",
                  controller: aboutcontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter valid Bio';
                    }

                    return null;
                  },
                ),
                const Threeh(),
                MainButton(
                    onpressed: () {
                      if (selectedImage == null ||
                          selectedImage!.path.isEmpty) {
                        errortoastmsg("Upload a valid profile image");
                      } else if (images.isEmpty) {
                        errortoastmsg("Select at least one image");
                      } else if (selectedsex!.value.isEmpty) {
                        errortoastmsg("Choose Your Gender");
                      } else if (maritialstatusselected!.value.isEmpty) {
                        errortoastmsg("Choose Your Marital Status");
                      } else if (selectedRegion!.value.isEmpty) {
                        errortoastmsg("Choose Your Region");
                      } else if (intrestselected!.value.isEmpty) {
                        errortoastmsg("Choose Your Intrest");
                      } else {
                        if (_formKey.currentState!.validate()) {
                          uploadProfileAndDetails(
                              addonImages: images,
                              profileImage: selectedImage!,
                              name: namecontroller.text.trim(),
                              age: agecontroller.text.trim(),
                              sex: selectedsex!.value,
                              bio: aboutcontroller.text.trim(),
                              height: heightcontroller.text.trim(),
                              intrest: intrestselected!.value,
                              maritialstatus: maritialstatusselected!.value,
                              preferdname: preferednamecontroller.text.trim(),
                              region: selectedRegion!.value,
                              weight: weightcontroller.text.trim(),
                              isfromeditpage: true);
                        }
                      }
                    },
                    buttontitle: "Continue "),
                const Fiveh(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickDpImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );
      if (pickedFile != null) {
        setState(() {
          imageName = pickedFile.name.length > 20
              ? "${pickedFile.name.substring(0, 20)}..."
              : pickedFile.name;
          selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _pickImages() async {
    try {
      if (images.length >= 4) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text("You can only pick up to 4 images.")),
        );
        return;
      }

      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile != null) {
        setState(() {
          if (images.length < 4) {
            images.add(File(pickedFile.path));
          }
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }
}
