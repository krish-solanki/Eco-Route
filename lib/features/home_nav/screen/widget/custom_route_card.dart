
import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget routeCard({
  required IconData icon,
  required String route,
  required int km,
  required double min,
  required int aqi,
  required String status,
}) {
  Color statusColor = AppColors.primary;

  if (status == 'Moderate') {
    statusColor = Colors.orange;
  } else if (status == 'Poor') {
    statusColor = Colors.red;
  }

  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.all(16.r),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Row(
      children: [
        SizedBox(
          height: 50.h,
          width: 50.w,
          child: Icon(icon, color: AppColors.black, size: 28.sp),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(route, style: AppTextStyles.cardTitle),

              SizedBox(height: 4.h),

              Text('$km km • $min min', style: AppTextStyles.body),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('AQI $aqi', style: AppTextStyles.bodyMedium),

            SizedBox(height: 4.h),

            Text(
              status,
              style: AppTextStyles.bodyMedium.copyWith(color: statusColor),
            ),
          ],
        ),
      ],
    ),
  );
}