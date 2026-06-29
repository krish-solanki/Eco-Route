import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/auth/controller/auth_provider.dart';
import 'package:eco_route/features/profile_nav/controller/profile_providerr.dart';
import 'package:eco_route/features/profile_nav/screen/widget/custome_text_field_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final nameController = TextEditingController(text: "Krish Solanki");

  final emailController = TextEditingController(text: "krish@gmail.com");

  final phoneController = TextEditingController(text: "+91 9876543210");

  final cityController = TextEditingController(text: "Rajkot");

  bool notifications = true;
  bool dailyAlerts = true;

  @override
  Widget build(BuildContext context) {
    final authUser = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text('Profile', style: AppTextStyles.appBarTitle),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: authUser == null
            ? Column(children: [Text('Not login yet')])
            : Column(
                children: [
                  /// Profile Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 45.r,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 50.sp,
                                color: AppColors.primary,
                              ),
                            ),

                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 18.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12.h),

                        Text(
                          "Krish Solanki",
                          style: AppTextStyles.subHeading.copyWith(
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "krish@gmail.com",
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Personal Information
                  sectionTitle("Personal Information"),

                  SizedBox(height: 10.h),

                  textField(
                    controller: nameController,
                    label: "Full Name",
                    icon: Icons.person_outline,
                  ),

                  textField(
                    controller: emailController,
                    label: "Email",
                    icon: Icons.email_outlined,
                  ),

                  textField(
                    controller: phoneController,
                    label: "Phone Number",
                    icon: Icons.phone_outlined,
                  ),

                  textField(
                    controller: cityController,
                    label: "City",
                    icon: Icons.location_city_outlined,
                  ),

                  SizedBox(height: 20.h),

                  /// Preferences
                  sectionTitle("Preferences"),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        SwitchListTile(
                          value: notifications,
                          activeThumbColor: AppColors.primary,
                          title: Text(
                            "Notifications",
                            style: AppTextStyles.bodyMedium,
                          ),
                          onChanged: (value) {
                            setState(() {
                              notifications = value;
                            });
                          },
                        ),

                        Divider(color: AppColors.divider),

                        SwitchListTile(
                          value: dailyAlerts,
                          activeThumbColor: AppColors.primary,
                          title: Text(
                            "Daily AQI Alerts",
                            style: AppTextStyles.bodyMedium,
                          ),
                          onChanged: (value) {
                            setState(() {
                              dailyAlerts = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  /// Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Save Changes", style: AppTextStyles.button),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 55.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Logout", style: AppTextStyles.button),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
