import 'package:clean_code_test/core/utils/app_size.dart';
import 'package:clean_code_test/core/widgets/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

void buildLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        content: Row(
          children: [
            kCircularIndicator(),
            AppSize.rsh_10,
            const Text(
              "جاري التحميل...",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      );
    },
  );
}
