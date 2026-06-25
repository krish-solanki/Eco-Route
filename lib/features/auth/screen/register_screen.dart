import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_button.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_card.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_devider.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_footer.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_header.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_social_button.dart';
import 'package:eco_route/features/auth/screen/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool agreeTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              authHeader(
                title: "Create Account",
                subtitle: "Join EcoRoute today",
                showBackButton: true,
                onBack: () => Navigator.pop(context),
              ),

              authCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full Name", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: nameController,
                      hint: "Enter your full name",
                      icon: Icons.person_outline,
                    ),

                    SizedBox(height: 20.h),

                    Text("Email", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: emailController,
                      hint: "Enter your email",
                      icon: Icons.email_outlined,
                    ),

                    SizedBox(height: 20.h),

                    Text("Mobile Number", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: mobileController,
                      hint: "Enter your mobile number",
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    SizedBox(height: 20.h),

                    Text("Password", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: passwordController,
                      hint: "Create password",
                      icon: Icons.lock_outline,
                      obscureText: !passwordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Text("Confirm Password", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: confirmPasswordController,
                      hint: "Confirm your password",
                      icon: Icons.lock_outline,
                      obscureText: !confirmPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: agreeTerms,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            setState(() {
                              agreeTerms = value ?? false;
                            });
                          },
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: RichText(
                              text: TextSpan(
                                style: AppTextStyles.body,
                                children: [
                                  const TextSpan(text: "I agree to the "),
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const TextSpan(text: " and Privacy Policy."),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    authButton(title: "Create Account", onPressed: () {}),

                    SizedBox(height: 28.h),

                    authDivider("or sign up with"),

                    SizedBox(height: 24.h),

                    socialButton(
                      title: "Continue with Google",
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 24.h,
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 16.h),

                    socialButton(
                      title: "Continue with Apple",
                      icon: const Icon(
                        Icons.apple,
                        color: Colors.black,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 28.h),

                    authFooter(
                      title: "Already have an account?",
                      buttonTitle: "Login",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
