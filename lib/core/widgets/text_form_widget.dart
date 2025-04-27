import 'package:clean_code_test/config/style/app_color.dart';
import 'package:flutter/material.dart';

Widget buildTextFieldWidget({
  required TextEditingController controller,
  required String label,
  required String hint,
  required IconData icon,
  String? helperText,
  TextInputType keyboardType = TextInputType.text,
  TextDirection? textDirection,
  required String? Function(String?) validator,
  int maxLines = 1,
  bool isPassword = false,
  Widget? suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    textDirection: textDirection,
    maxLines: maxLines,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      helperText: helperText,
      prefixIcon: Icon(icon, color: AppColor.mainColor),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.mainColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red[300]!, width: 1),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    validator: validator,
  );
}
