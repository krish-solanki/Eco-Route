import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget authDivider(String text) {
  return Row(
    children: [
      const Expanded(child: Divider()),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(
          text,
          style: AppTextStyles.body,
        ),
      ),

      const Expanded(child: Divider()),
    ],
  );
}