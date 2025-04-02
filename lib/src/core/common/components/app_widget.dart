import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/core/utils/helpers/styles.dart';

class AppWidget {
  static Widget loadingIndicator({double? radius, Color? color}) {
    return SizedBox(
      height: radius ?? 25,
      width: radius ?? 25,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: color ?? Colors.transparent,
      ),
    );
  }

  static Widget buildUserInput({
    Widget? suffixIcon,
    String? Function(String? val)? validate,
    Function(String val)? onChanged,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool obscureText = false,
    String? hintText,
  }) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validate,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.grey100,
      style: TextStyle(
        color: AppColors.grey100,
        fontSize: 16.sp,
        fontWeight: FWt.regular,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.grey100, fontSize: 16.sp),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.yellowSecondary,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.yellowSecondary,
            width: 1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.yellowSecondary,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
