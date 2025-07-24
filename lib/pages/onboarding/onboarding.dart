import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/constant/imgs.dart';
import 'package:thera_app/pages/login/signup.dart';

import '../../theme/colors.dart';

class OnboardingScreenPage extends StatefulWidget {
  const OnboardingScreenPage({super.key});

  @override
  State<OnboardingScreenPage> createState() => _OnboardingScreenPageState();
}

class _OnboardingScreenPageState extends State<OnboardingScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plain,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              // height: screenHeight * 0.6,
              width: double.infinity,
              child: Image.asset(AppAssets.onboarding, fit: BoxFit.cover),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "A safe space to talk, heal, and be heard.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.main,
                    ),
                  ),

                  Text(
                    'Expert help you can trust, anytime you need it',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.main,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Life can be overwhelming, but you don"t have to face it alone.'
                'This is your space to breathe, reflect, and reconnect with yourself.'
                'Let"s walk through it together — one session, one moment at a time.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.main,
                ),
              ),
            ),
            SizedBox(height: 120.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(
                    120,
                    180,
                    150,
                    1,
                  ), // soft sage green
                  foregroundColor: AppColors.plain,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 60.w,
                  ),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
