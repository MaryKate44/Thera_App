import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/constant/imgs.dart';
import 'package:thera_app/pages/bottom_nav_page.dart';
import 'package:thera_app/pages/login/recover.dart';
import 'package:thera_app/pages/login/signup.dart';
import 'package:thera_app/theme/colors.dart';
import 'package:thera_app/theme/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                AppAssets.logo,
                fit: BoxFit.contain,
                height: 34.h,
                width: 53.w,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'LOGIN TO THERAPP',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'You"re Welcome',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _emailController,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                decoration: textFieldDecoration('Email').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                enabled: !isLoading,
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                decoration: textFieldDecoration('Password').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Forgot Password? '),
                    TextSpan(
                      text: 'Recover it',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.green,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => PasswordRecoveryScreen(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 83.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: AppColors.plain,
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.w,
                    vertical: 10.h,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavPage()),
                  );
                },

                child: Text(
                  'Login to Therapp',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'New to Therapp? '),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.green,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 82.h),
            Center(
              child: Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 42.h,
                width: 246.w,
                padding: EdgeInsets.only(left: 13.h, top: 7.h, bottom: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: Color.fromRGBO(244, 244, 244, 1),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.google,
                      fit: BoxFit.cover,
                      height: 29.h,
                      width: 28.w,
                    ),
                    SizedBox(width: 24.w),
                    Text(
                      'Login with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
