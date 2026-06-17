import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/splesh_screen/screen/splesh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({super.key});

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    SplashScreen(), // Home
    SplashScreen(), // Map
    SplashScreen(), // History
    SplashScreen(), // Profile
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            // Open Route Planner Screen
          },
          icon: Icon(Icons.add, color: Colors.white, size: 30.sp),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.r,
        elevation: 12,
        color: Colors.white,
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                child: _navItem(
                  icon: Icons.home_outlined,
                  label: 'Home',
                  index: 0,
                ),
              ),

              Expanded(
                child: _navItem(
                  icon: Icons.map_outlined,
                  label: 'Map',
                  index: 1,
                ),
              ),

              SizedBox(width: 70.w),

              Expanded(
                child: _navItem(
                  icon: Icons.history_outlined,
                  label: 'History',
                  index: 2,
                ),
              ),

              Expanded(
                child: _navItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  index: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () => onItemTapped(index),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isSelected ? AppColors.primary : AppColors.grey,
            ),

            SizedBox(height: 4.h),

            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: isSelected ? AppColors.primary : AppColors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
