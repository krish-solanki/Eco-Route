import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget sectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: AppTextStyles.subHeading),
  );
}

Widget textField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: TextFormField(
      controller: controller,
      style: AppTextStyles.textField,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
