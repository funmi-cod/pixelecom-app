import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/common/components/app_button.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/core/utils/constant/route_constant.dart';
import 'package:pixelecomapp/src/core/utils/helpers/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black300,
      body: SafeArea(
        child: Container(
          color: AppColors.black300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 24.h),
                  color: AppColors.black100,

                  child: Column(
                    children: [
                      Styles.semiBold("Welcome!", fontSize: 32.sp),
                      SizedBox(height: 5.h),
                      Styles.regular("Text text text", fontSize: 16.sp),
                      SizedBox(height: 10.h),
                      AppButton(
                        height: 56.h,
                        width: 311.w,
                        text: "Scan bottle",
                        fontColor: AppColors.black300,
                        fontSize: 16.sp,
                        fontWeight: FWt.mediumBold,
                        enabled: true,
                        borderRadius: BorderRadius.circular(5.r),
                        backgroundColor: AppColors.yellowPrimary,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Styles.regular("Have an account?", fontSize: 16.sp),
                          SizedBox(width: 25.w),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteLiterals.loginScreen,
                              );
                            },
                            child: Styles.medium(
                              "Sign in first",
                              fontSize: 16.sp,
                              color: AppColors.yellowSecondary,
                            ),
                          ),
                          SizedBox(width: 20.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
