import 'package:eco_route/core/constants/app_colors.dart';
import 'package:eco_route/core/constants/app_text_style.dart';
import 'package:eco_route/features/auth/screen/register_screen.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_button.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_card.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_devider.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_footer.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_header.dart';
import 'package:eco_route/features/auth/screen/widget/custom_auth_social_button.dart';
import 'package:eco_route/features/auth/screen/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              authHeader(
                title: "EcoRoute",
                subtitle: "Breathe Better. Travel Smarter.",
              ),

              authCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Welcome Back!",
                        style: AppTextStyles.heading,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Center(
                      child: Text(
                        "Login to continue your journey",
                        style: AppTextStyles.body,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    Text("Email Address", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: emailController,
                      hint: "Enter your email",
                      icon: Icons.email_outlined,
                    ),

                    SizedBox(height: 22.h),

                    Text("Password", style: AppTextStyles.bodyMedium),

                    SizedBox(height: 8.h),

                    authTextField(
                      controller: passwordController,
                      hint: "Enter your password",
                      icon: Icons.lock_outline,
                      obscureText: !isPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    authButton(title: "Login", onPressed: () {}),

                    SizedBox(height: 25.h),
                    authDivider("or continue with"),

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
                      icon: Image.asset(
                        "assets/images/apple.png",
                        height: 24.h,
                      ),
                      onPressed: () {},
                    ),

                    SizedBox(height: 30.h),

                    authFooter(
                      title: "Don't have an account?",
                      buttonTitle: "Register",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        );
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
