import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/common/components/app_button.dart';
import 'package:pixelecomapp/src/core/common/components/app_widget.dart';
import 'package:pixelecomapp/src/core/common/components/custom_image_view.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';
import 'package:pixelecomapp/src/core/utils/constant/image_constant.dart';
import 'package:pixelecomapp/src/core/utils/constant/route_constant.dart';
import 'package:pixelecomapp/src/core/utils/helpers/alert.dart';
import 'package:pixelecomapp/src/core/utils/helpers/styles.dart';
import 'package:pixelecomapp/src/features/auth/bloc/auth_bloc/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthCubit _cubit;

  bool isPasswordVisible = false;

  @override
  void initState() {
    _cubit = BlocProvider.of<AuthCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black200,
        leading: Padding(
          padding: EdgeInsets.only(left: 5.r),
          child: CustomImageView(
            margin: EdgeInsets.all(12),
            imagePath: ImageConstant.arrowLeft,
            height: 18.h,
            width: 18.w,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.black200,
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Styles.semiBold("Sign in", fontSize: 32.sp),
              SizedBox(height: 30.h),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.regular(
                      "Email",
                      fontSize: 12.sp,
                      color: AppColors.yellowPrimary,
                    ),

                    AppWidget.buildUserInput(
                      controller: emailController,
                      hintText: "Enter your email",
                      onChanged: (val) {},
                      keyboardType: TextInputType.emailAddress,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "Email required";
                        }
                        if (!val.contains('@')) {
                          return 'Invalid email format';
                        }
                      },
                    ),
                    SizedBox(height: 20.h),
                    Styles.regular(
                      "Password",
                      fontSize: 12.sp,
                      color: AppColors.yellowPrimary,
                    ),
                    AppWidget.buildUserInput(
                      controller: emailController,
                      hintText: "Enter your password",
                      onChanged: (val) {},
                      keyboardType: TextInputType.text,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return 'Password is required';
                        } else if (val.length < 8) {
                          return 'Password must at least eight characters long';
                        }
                      },
                      obscureText: !isPasswordVisible ? true : false,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.yellowPrimary,
                        ),
                        onPressed: () {
                          setState(
                            () => isPasswordVisible = !isPasswordVisible,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthError) {
                    showAlertMessage(
                      context,
                      message: state.error ?? "",
                      backgroundColor: Colors.red,
                    );
                  }

                  if (state is AuthSuccess) {
                    showAlertMessage(
                      context,
                      message: state.message ?? "",
                      backgroundColor: AppColors.yellowPrimary,
                    );

                    Navigator.pushNamed(
                      context,
                      RouteLiterals.myCollectionsScreen,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    height: 56.h,
                    width: 343.w,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _cubit.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                    text: "Continue",
                    fontColor: AppColors.black300,
                    fontSize: 16.sp,
                    fontWeight: FWt.mediumBold,
                    enabled: state is! AuthLoading,
                    isLoading: state is AuthLoading,
                    borderRadius: BorderRadius.circular(5.r),
                    backgroundColor: AppColors.yellowPrimary,
                  );
                },
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Styles.regular("Can't sign in?", fontSize: 16.sp),
                  SizedBox(width: 30.w),
                  InkWell(
                    onTap: () {},
                    child: Styles.medium(
                      "Recover password",
                      fontSize: 16.sp,
                      color: AppColors.yellowSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
