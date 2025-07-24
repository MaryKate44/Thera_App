import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/constant/imgs.dart';
import 'package:thera_app/pages/login/login.dart';
import 'package:thera_app/theme/colors.dart';
import 'package:thera_app/theme/input_decoration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = false;
  bool _obscureConfirmPassword = false;
  bool isChecked = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  bool get isFormValid {
    return _fullNameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordController.text == _confirmPasswordController.text &&
        isChecked;
  }

  //String? selectedMedium;
  //String? selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
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
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Sign Up on Therapp',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: AppColors.green,
                    ),
                  ),
                  // TextSpan(
                  //   text: 'app',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 18.sp,
                  //     fontStyle: FontStyle.italic,
                  //     color: AppColors.green,
                  //   ),
                  // ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            Text(
              'Please ensure you enter your correct credentials',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _fullNameController,
                onChanged: (_) => setState(() {}),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                decoration: textFieldDecoration('Full name').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _emailController,
                onChanged: (_) => setState(() {}),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                decoration: textFieldDecoration('Email').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _phoneController,
                onChanged: (_) => setState(() {}),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                keyboardType: TextInputType.phone,
                decoration: textFieldDecoration('Phone number').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _passwordController,
                onChanged: (_) => setState(() {}),
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
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              height: 44.h,
              child: TextField(
                controller: _confirmPasswordController,
                onChanged: (_) => setState(() {}),
                obscureText: _obscureConfirmPassword,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                decoration: textFieldDecoration('Confirm Password').copyWith(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.green, width: 2.0),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    child: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },

                  child: Icon(
                    isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                    color: AppColors.green,                  
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),

                      children: [
                        const TextSpan(text: 'I agree to Therapps '),
                        TextSpan(
                          text: 'User agreement',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.green,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),

                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.green,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70.w,
                    vertical: 10.h,
                  ),
                  backgroundColor: isFormValid ? AppColors.green : Colors.grey,
                ),
                onPressed: () {
                  // if (!isFormValid) {
                  //   HelperWidgets.showToast(
                  //     "Please fill out all fields correctly.",
                  //     isError: true,
                  //   );
                  //   return;
                  // }

                  // showDialog(
                  //   context: context,
                  //   builder: (_) =>  VerificationDialog(
                  //     email: _emailController.text,
                  //     phoneNo: _phoneController.text,
                  //     password: _passwordController.text,
                  //     confirmPassword: _confirmPasswordController.text,
                  //     fullName: _fullNameController.text,

                  //   ),
                  // );
                },

                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h),
            Center(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Login',
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
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Center(
              child: Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 20.h),
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
                      'Sign up with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
