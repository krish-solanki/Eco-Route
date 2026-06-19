import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_strings.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/home_nav/controller/home_provider.dart';
import 'package:eco_route/features/home_nav/screen/widget/aqi_skeleton.dart';
import 'package:eco_route/features/home_nav/screen/widget/custom_route_card.dart';
import 'package:eco_route/features/home_nav/screen/widget/custome_pollutant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(homeProvider.notifier).initializeApp();
      if (!mounted) return;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeProvider);
    final controller = ref.read(homeProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 22,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Location',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => controller.showCityName(context),
                    child: Text(
                      '${controller.selectedCity}, Gujarat',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                size: 24.sp,
                Icons.notifications_none_rounded,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Summary Card
            controller.isLoading
                ? const AQISkeleton()
                : Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.currentAirQuality,
                            style: AppTextStyles.cardTitle,
                          ),

                          SizedBox(height: 20.h),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.aqi.toString(),
                                      style: TextStyle(
                                        fontSize: 48.sp,
                                        fontWeight: FontWeight.w700,
                                        color: controller.progressColor(),
                                      ),
                                    ),

                                    Text(
                                      controller.getAQIStatus(controller.aqi),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: controller.progressColor(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.air,
                                  size: 38.sp,
                                  color: controller.progressColor(),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20.h),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: LinearProgressIndicator(
                              value: controller.aqi / 5,
                              minHeight: 10.h,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation(
                                controller.progressColor(),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              pollutantCard(
                                title: 'PM2.5',
                                value: controller.pm25.toStringAsFixed(1),
                              ),

                              pollutantCard(
                                title: 'PM10',
                                value: controller.pm10.toStringAsFixed(1),
                              ),
                              pollutantCard(
                                title: 'NO₂',
                                value: controller.no2.toStringAsFixed(1),
                              ),
                              pollutantCard(
                                title: 'O₃',
                                value: controller.o3.toStringAsFixed(1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

            // Favorite Route Card List
            Padding(
              padding: EdgeInsets.all(14.r),
              child: Row(
                children: [
                  Text(
                    AppStrings.favoriteRoutes,
                    style: AppTextStyles.bodyMedium,
                  ),
                  Spacer(),
                  Text(
                    AppStrings.seeAll,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  routeCard(
                    icon: Icons.home,
                    route: 'Home → Office',
                    km: 6,
                    min: 18,
                    aqi: 42,
                    status: 'Good',
                  ),

                  routeCard(
                    icon: Icons.directions_run,
                    route: 'Morning Run',
                    km: 3,
                    min: 12,
                    aqi: 65,
                    status: 'Moderate',
                  ),

                  routeCard(
                    icon: Icons.school,
                    route: 'Home → College',
                    km: 8,
                    min: 22,
                    aqi: 90,
                    status: 'Poor',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
