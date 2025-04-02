import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelecomapp/src/core/common/components/app_widget.dart';
import 'package:pixelecomapp/src/core/utils/constant/app_colors.dart';

class AppButton extends StatelessWidget {
  final bool enabled;
  final String text;
  final Function()? onPressed;
  final backgroundColor;
  final fontColor;
  final fontWeight;
  final borderColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final mainAxisAlignment;
  final BorderRadiusGeometry? borderRadius;
  final double? height;

  final double? width;
  final bool isLoading;
  AppButton({
    required this.text,
    this.enabled = false,
    this.fontWeight,
    this.onPressed,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
    this.fontSize,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 45,
      width: width,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            padding ?? EdgeInsets.symmetric(horizontal: 16),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side:
                  enabled
                      ? BorderSide(
                        color:
                            borderColor ??
                            backgroundColor ??
                            Theme.of(context).primaryColor,
                      )
                      : BorderSide(color: AppColors.grey200),
              borderRadius: borderRadius ?? BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            enabled ? backgroundColor : AppColors.grey200,
          ),
        ),
        child:
            isLoading
                ? Center(child: AppWidget.loadingIndicator(color: Colors.white))
                : FittedBox(
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      SizedBox(width: 8),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          text,
                          style: TextStyle(
                            color:
                                enabled
                                    ? fontColor ?? AppColors.black300
                                    : Colors.white,
                            fontSize: fontSize ?? 14.sp,
                            fontWeight: fontWeight ?? FontWeight.normal,
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
