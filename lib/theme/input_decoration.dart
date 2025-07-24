import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/theme/colors.dart';


InputDecoration textFieldDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.main, // Color.fromRGBO(102, 102, 102, 0.55),
    ),

    contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: BorderSide(
        color: Color.fromRGBO(102, 102, 102, 0.55),
        width: 1.4.h,
      ),
    ),
  );
}
