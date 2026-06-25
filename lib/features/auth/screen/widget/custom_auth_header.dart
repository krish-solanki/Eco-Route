import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget authHeader({
  required String title,
  required String subtitle,
  bool showBackButton = false,
  VoidCallback? onBack,
}) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset(
        "assets/images/auth_bg.png",
        width: double.infinity,
        height: 260.h,
        fit: BoxFit.cover,
      ),

      if (showBackButton)
        Positioned(
          left: 16.w,
          top: 20.h,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
              ),
            ),
          ),
        ),

      Positioned(
        top: 30.h,
        child: Column(
          children: [
            Image.asset("assets/images/logo.png", height: 80.h),

            SizedBox(height: 10.h),

            Text(
              title,
              style: AppTextStyles.heading.copyWith(color: AppColors.primary),
            ),

            SizedBox(height: 6.h),

            Text(subtitle, style: AppTextStyles.body),
          ],
        ),
      ),
    ],
  );
}
