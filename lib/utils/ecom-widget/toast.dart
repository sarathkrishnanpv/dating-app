import 'package:datingapp/utils/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void errortoastmsg(String msg) {
  Fluttertoast.showToast(msg: msg, backgroundColor: red, textColor: whitecolor);
}

void sucessToast(String msg) {
  Fluttertoast.showToast(
      msg: msg, backgroundColor: green, textColor: whitecolor);
}
