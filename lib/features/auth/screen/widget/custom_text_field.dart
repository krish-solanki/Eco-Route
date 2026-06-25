import 'package:eco_route/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget authTextField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  bool obscureText = false,
  Widget? suffixIcon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hint,

      prefixIcon: Icon(icon, color: AppColors.primary),

      suffixIcon: suffixIcon,

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );
}
