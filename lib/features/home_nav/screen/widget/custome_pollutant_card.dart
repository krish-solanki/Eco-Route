import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget pollutantCard({required String title, required String value}) {
  return Column(
    children: [
      Text(title, style: AppTextStyles.label),
      SizedBox(height: 4.h),
      Text(value, style: AppTextStyles.bodyMedium),
    ],
  );
}