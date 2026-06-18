import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget historyRouteCard({
  required IconData icon,
  required String route,
  required String date,
  required String time,
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
    margin: EdgeInsets.only(bottom: 14.h),
    padding: EdgeInsets.all(16.r),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.divider),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: AppColors.primary, size: 26.sp),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(route, style: AppTextStyles.cardTitle),

                  SizedBox(height: 4.h),

                  Text('$date • $time', style: AppTextStyles.body),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                status,
                style: AppTextStyles.label.copyWith(color: statusColor),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _historyInfo(title: 'Distance', value: '$km km'),

            _historyInfo(title: 'Duration', value: '${min.toInt()} min'),

            _historyInfo(title: 'AQI', value: '$aqi'),
          ],
        ),
      ],
    ),
  );
}

Widget _historyInfo({required String title, required String value}) {
  return Column(
    children: [
      Text(value, style: AppTextStyles.bodyMedium),

      SizedBox(height: 4.h),

      Text(title, style: AppTextStyles.label),
    ],
  );
}
