import 'package:eco_route/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget authCard({
  required Widget child,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 18.w,
      vertical: 15.h,
    ),
    padding: EdgeInsets.all(24.r),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(28.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: child,
  );
}