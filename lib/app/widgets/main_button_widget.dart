import 'package:cloudy/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color primaryColor;
  final Color? outlinedColor;
  final Color splashColor;
  final Color textColor;
  final double? minimumWidth;
  final double? maximumWidth;
  final double? minimumHeight;
  final double? maximumHeight;
  final EdgeInsets? padding;
  final String type;
  final Widget? child;
  final double elevation;
  final double? borderRadius;
  final TextStyle? textStyle;
  final MaterialTapTargetSize? tapTargetSize;
  const MainButtonWidget({
    Key? key,
    this.onTap,
    this.elevation = 4,
    this.borderRadius,
    required this.text,
    this.splashColor = Colors.white,
    this.textColor = Colors.white,
    this.minimumWidth,
    this.maximumWidth,
    this.padding,
    this.tapTargetSize,
    this.textStyle,
    this.minimumHeight,
    this.primaryColor = Colors.transparent,
    this.maximumHeight,
  })  : child = null,
        outlinedColor = null,
        type = 'text',
        super(key: key);
  const MainButtonWidget.outlined({
    Key? key,
    this.onTap,
    this.elevation = 4,
    this.borderRadius,
    required this.text,
    this.outlinedColor = AppColors.primary500,
    this.primaryColor = Colors.white,
    this.splashColor = AppColors.primary500,
    this.textColor = AppColors.primary500,
    this.minimumWidth,
    this.maximumWidth,
    this.tapTargetSize,
    this.padding,
    this.minimumHeight,
    this.maximumHeight,
    this.textStyle,
  })  : type = 'text',
        child = null,
        super(key: key);
  const MainButtonWidget.outlinedWithChild({
    Key? key,
    this.onTap,
    this.elevation = 4,
    required this.outlinedColor,
    this.primaryColor = Colors.white,
    this.splashColor = AppColors.primary500,
    this.minimumWidth,
    this.padding,
    this.borderRadius,
    required this.child,
    this.minimumHeight,
    this.maximumHeight,
    this.maximumWidth,
    this.tapTargetSize,
  })  : type = 'child',
        textColor = Colors.white,
        text = '',
        textStyle = null,
        super(key: key);
  const MainButtonWidget.withChild({
    Key? key,
    this.onTap,
    this.elevation = 4,
    this.splashColor = Colors.white,
    this.minimumWidth,
    this.padding,
    this.borderRadius,
    required this.child,
    this.maximumWidth,
    this.minimumHeight,
    this.maximumHeight,
    this.tapTargetSize,
    this.primaryColor = Colors.transparent,
  })  : type = 'child',
        outlinedColor = null,
        textColor = Colors.white,
        text = '',
        textStyle = null,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: primaryColor == Colors.transparent
            ? LinearGradient(
                colors: onTap == null
                    ? [
                        AppColors.gray400,
                        AppColors.gray400,
                      ]
                    : [
                        AppColors.primary500,
                        AppColors.secondary500,
                      ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // transform: const GradientRotation(13.094395),
              )
            : LinearGradient(
                colors: [
                  primaryColor,
                  primaryColor,
                ],
              ),
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.gray400,
          disabledForegroundColor: AppColors.gray400,
          elevation: elevation,
          backgroundColor: primaryColor,
          foregroundColor: splashColor,
          tapTargetSize: tapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
          shadowColor: Colors.transparent,
          minimumSize: Size(
            minimumWidth ?? double.infinity,
            minimumHeight ?? 0,
          ),
          maximumSize: Size(
            maximumWidth ?? double.infinity,
            maximumHeight ?? 48.h,
          ),
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
            side: outlinedColor == null
                ? BorderSide.none
                : BorderSide(
                    color: outlinedColor!,
                  ),
          ),
        ),
        child: (type == 'child')
            ? child
            : Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
      ),
    );
  }
}
