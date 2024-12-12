import 'dart:convert';
import 'dart:io';
import 'package:datingapp/screens/hometab/hometab.dart';
import 'package:datingapp/screens/register/familydetails.dart';
import 'package:datingapp/screens/register/postprofile.dart';
import 'package:datingapp/screens/register/workdetails.dart';
import 'package:datingapp/service/apiurls.dart';
import 'package:datingapp/utils/controller.dart';
import 'package:datingapp/utils/ecom-widget/toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> postwrkandeducationtosever(
    String jobrole, String educationlevel, String collegename) async {
  const String apiUrl = postworkandeducationurl;
  buttonloading.value = true;
  final Map<String, dynamic> data = {
    "job_role": jobrole,
    "education_level": educationlevel,
    "college": collegename,
  };

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    body: json.encode(data),
    headers: {
      'Authorization': 'Bearer $bearertoken',
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    // var responseData = json.decode(response.body);
    Get.to(() => const Postprofile());
  } else {
    var responseData = json.decode(response.body);
    errortoastmsg(responseData['messages'][0]['message']);
  }
  buttonloading.value = false;
}

Future<void> uploadProfileAndDetails({
  required File profileImage,
  required List<File> addonImages,
  required String name,
  required String preferdname,
  required String sex,
  required String region,
  required String age,
  required String height,
  required String weight,
  required String maritialstatus,
  required String intrest,
  required String bio,
}) async {
  const String apiUrl = postprofiledatatoserver;
  buttonloading.value = true;

  try {
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..headers.addAll({
        'Authorization': 'Bearer $bearertoken',
        "Content-Type": "multipart/form-data",
      });

    // Add text fields
    request.fields['name'] = name;
    request.fields['preferred_name'] = preferdname;
    request.fields['region'] = region.toString();
    request.fields['place'] = "";
    request.fields['sex'] = sex;
    request.fields['age'] = age.toString();
    request.fields['weight_kg'] = weight.toString();
    request.fields['height_cm'] = height.toString();
    request.fields['marital_status'] = maritialstatus.toString();
    request.fields['interests'] = intrest.toString();
    request.fields['about'] = aboutcontroller.text.toString();

    // Add profile image
    request.files.add(await http.MultipartFile.fromPath(
      'profile_picture', // Key for the profile image
      profileImage.path,
    ));

    // Add add-on images
    for (int i = 0; i < addonImages.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
        'additional_images', // Key for add-on images
        addonImages[i].path,
      ));
    }

    // Send the request
    var response = await request.send();
    var responseData = await http.Response.fromStream(response);
    print("Response: ${responseData.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      // var responseData = await http.Response.fromStream(response);
      Get.to(() => const Familydetails());
    } else {
      var responseData = await http.Response.fromStream(response);
      var jsonResponse = json.decode(responseData.body);
      errortoastmsg(jsonResponse['messages'][0]['message']);
    }
  } catch (e) {
    print("Error: $e");
    errortoastmsg("An error occurred. Please try again.");
  } finally {
    buttonloading.value = false;
  }
}

Future<void> postPersonalDetailsToServer(
  String religion,
  String subReligion,
  String cast,
  String motherTongue,
  String drinkingHabit,
  String smokinghabit,
) async {
  const String apiUrl = personaldetailsurl;
  buttonloading.value = true;

  // Prepare the data for the request
  final Map<String, dynamic> data = {
    "relegion": religion, // Use string values directly
    "sub_region": subReligion,
    "cast": cast,
    "mother_toungue": motherTongue,
    "drinking_habits": drinkingHabit,
    "smoking_habits": smokinghabit, // Access RxString value
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {
        'Authorization': 'Bearer $bearertoken',
        "Content-Type": "application/json",
      },
    );

    // Handle the response
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.to(() => const WorkDetails());
    } else {
      var responseData = json.decode(response.body);
      errortoastmsg(responseData['messages'][0]['message']);
    }
  } catch (e) {
    print("Error occurred: $e");
    errortoastmsg("Failed to submit details.");
  } finally {
    buttonloading.value = false;
  }
}

List profiles = [];
bool isLoading = false;
bool hasNextPage = true;
int currentPage = 1;

Future<void> fetchProfiles(int page) async {
  if (isLoading || !hasNextPage) return;
  dataloading.value = true;
  isLoading = true; // Set loading state

  try {
    final response = await http.post(
      Uri.parse(fetchprofilefromserver),
      headers: {
        'Authorization': 'Bearer $bearertoken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"page": page}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Access results directly from the response
      final List fetchedProfiles = data['results'] ?? [];

      // Update main list and pagination flags
      datingprofilelist.addAll(fetchedProfiles);
      hasNextPage = data['next'] != null; // Check if there is a next page
      currentPage++;
      dataloading.value = false;
    } else {
      dataloading.value = false;
      throw Exception("Failed to fetch profiles");
    }
  } catch (e) {
    print("Error: $e");
    dataloading.value = false;
  } finally {
    dataloading.value = false;
    isLoading = false; // Reset loading state
  }

  // print(dataloading.value);
}

Future<void> submitprofiletoserver() async {
  const String apiUrl = submitprofile;
  buttonloading.value = true;

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $bearertoken',
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    tabindex.value = 3;
    Get.to(() => const Hometab());
  } else {
    var responseData = json.decode(response.body);
    errortoastmsg(responseData['messages'][0]['message']);
  }
  buttonloading.value = false;
}

fetchMyProfile() async {
  try {
    final response = await http.get(
      Uri.parse(postprofiledatatoserver),
      headers: {
        'Authorization': 'Bearer $bearertoken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      myprofiledata.value = data;
    } else {
      errortoastmsg("Failed to fetch profile");
      return null;
    }
  } catch (e) {
    return null;
  }
}

fetchintrestedprofile() async {
  dataloading.value = true;
  intrestedlist.clear();
  try {
    final response = await http.get(
      Uri.parse(intrestlisting),
      headers: {
        'Authorization': 'Bearer $bearertoken',
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      intrestedlist.value = data;
      dataloading.value = false;
      print("data fetched===>${intrestedlist.values}");
    } else {
      errortoastmsg("Failed to fetch profile");
      dataloading.value = false;
      return null;
    }
  } catch (e) {
    dataloading.value = false;
    return null;
  }
}

Future<void> markintrest(
  String id,
) async {
  const String apiUrl = intrestlisting;
  buttonloading.value = true;
  final Map<String, dynamic> data = {
    "profile_id": id,
  };

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    body: json.encode(data),
    headers: {
      'Authorization': 'Bearer $bearertoken',
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    sucessToast(data['message']);
  } else {
    var responseData = json.decode(response.body);
    errortoastmsg(responseData['error']);
  }
  buttonloading.value = false;
}

Future<void> filterProfile(int page, String gender, String minage,
    String maxage, String place, List intrest) async {
  if (isLoading || !hasNextPage) return;
  dataloading.value = true;
  isLoading = true; // Set loading state

  try {
    final response = await http.post(
      Uri.parse(profilefilter),
      headers: {
        'Authorization': 'Bearer $bearertoken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "page": page,
        "gender": gender,
        "min_age": minage,
        "max_age": maxage,
        "place": place,
        "interests": intrest,
      }),
    );

    if (response.statusCode == 200) {
      datingprofilelist.clear();
      final data = jsonDecode(response.body);

      // Access results directly from the response
      final List fetchedProfiles = data['results'] ?? [];

      // Update main list and pagination flags

      datingprofilelist.addAll(fetchedProfiles);
      hasNextPage = data['next'] != null; // Check if there is a next page
      currentPage++;
      dataloading.value = false;
    } else {
      dataloading.value = false;
      throw Exception("Failed to fetch profiles");
    }
  } catch (e) {
    print("Error: $e");
    dataloading.value = false;
  } finally {
    dataloading.value = false;
    isLoading = false; // Reset loading state
  }

  // print(dataloading.value);
}
