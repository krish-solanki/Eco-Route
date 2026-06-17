import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// GOOGLE MAP
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.3039, 70.8022),
              zoom: 14,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),

          /// TOP SEARCH CARD
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.my_location, color: AppColors.primary),
                        SizedBox(width: 10.w),

                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Current Location',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Divider(height: 16.h),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.red,
                        ),

                        SizedBox(width: 10.w),

                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Destination',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// RIGHT SIDE BUTTONS
          Positioned(
            right: 16.w,
            bottom: 220.h,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.my_location),
                  ),
                ),

                SizedBox(height: 10.h),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.layers_outlined),
                  ),
                ),

                SizedBox(height: 10.h),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.explore_outlined),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM ROUTE CARD
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 20.h,
            child: Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recommended Route', style: AppTextStyles.subHeading),

                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('6.4 km', style: AppTextStyles.value),
                            Text('Distance', style: AppTextStyles.label),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('20 min', style: AppTextStyles.value),
                            Text('Duration', style: AppTextStyles.label),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('AQI 42', style: AppTextStyles.value),
                            Text(
                              'Good',
                              style: AppTextStyles.label.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.navigation, color: Colors.white),
                      label: Text('Find Route', style: AppTextStyles.button),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
