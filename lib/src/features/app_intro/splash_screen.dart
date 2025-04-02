import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/common/components/custom_image_view.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/core/utils/constant/image_constant.dart';
import 'package:pixelecomapp/src/core/utils/constant/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 6), () => checkIsLogin());
  }

  checkIsLogin() async {
    Navigator.pushNamed(context, RouteLiterals.welcomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black300,
      body: SafeArea(
        child: Container(
          color: AppColors.black300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CustomImageView(
                  fit: BoxFit.fitHeight,
                  width: 140.w,
                  height: 140.h,
                  imagePath: ImageConstant.oneCask,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
