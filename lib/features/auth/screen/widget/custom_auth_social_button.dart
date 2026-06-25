import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget socialButton({
  required Widget icon,
  required String title,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 56.h,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 12.w),
          Text(
            title,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    ),
  );
}