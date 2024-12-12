import 'package:datingapp/screens/filter/filter.dart';
import 'package:flutter/material.dart';

void DatingFilter(context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) {
      return const FilterScreen();
    },
  );
}
