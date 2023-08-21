import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/views/constants_view.dart';

class EditProfileController extends GetxController {
  var selectedGender = "".obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  void setGender(value) {
    print(value);
    selectedGender.value = value;
    update();
  }

  chooseDate() async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.black, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: mainColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1950),
        lastDate: DateTime(2024),
        helpText: 'Select Date Of Birth',
        cancelText: 'Close',
        confirmText: 'Done');
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }
}
