import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

Widget authFooter({
  required String title,
  required String buttonTitle,
  required VoidCallback onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: AppTextStyles.body,
      ),

      TextButton(
        onPressed: onTap,
        child: Text(
          buttonTitle,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    ],
  );
}