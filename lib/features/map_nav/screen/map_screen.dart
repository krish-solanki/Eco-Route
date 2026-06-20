import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/map_nav/controller/map_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mapProvider.notifier).getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(mapProvider);
    final controller = ref.read(mapProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller.internalMapController,
            options: MapOptions(
              initialCenter: LatLng(controller.latitude, controller.longitude),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.ecoroute.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(controller.latitude, controller.longitude),
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.primary,
                      size: 40.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Floating Search Bars
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
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
                            readOnly: true,

                            onTap: () async {
                              await controller.showLocationOptions(context: context);
                              if (!context.mounted) return;
                            },
                            decoration: InputDecoration(
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
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
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

          // Floating Action Button for Location centering
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
                    onPressed: () async {
                      await controller.getCurrentLocation();
                    },
                    icon: const Icon(Icons.my_location),
                  ),
                ),
              ],
            ),
          ),

          // Route Action Panel
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 100.h,
            child: Visibility(
              visible: controller.recommendedRoute,
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Recommended Route', style: AppTextStyles.subHeading),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.navigation, color: Colors.white),
                        label: Text('Find Route', style: AppTextStyles.button),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
