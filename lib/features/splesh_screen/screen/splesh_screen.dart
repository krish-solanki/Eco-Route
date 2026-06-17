// ignore_for_file: unused_local_variable
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/splesh_screen/controller/splesh_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(splashProvider.notifier).initializeApp();
      if (!mounted) return;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = ref.watch(splashProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/splesh_screen_image.png',
                fit: BoxFit.cover,
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 80.h),

                  Image.asset('assets/images/logo.png', height: 120.h),

                  SizedBox(height: 20.h),

                  Text('EcoRoute', style: AppTextStyles.appLogo),

                  SizedBox(height: 12.h),

                  Text(
                    'Breathe Better.Travel Smarter.',
                    style: AppTextStyles.subHeading,
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
