import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/constants/core/lottie_assets_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class GeneralEmptyErrorWidget extends StatelessWidget {
  final String descText;
  final String titleText;
  final double? customHeightContent;
  final String customUrlImage;
  final double? heightImage;
  final double? widthImage;
  final TextStyle? customDescTextStyle;
  final TextStyle? customTitleTextStyle;
  final Function()? onRefresh;

  const GeneralEmptyErrorWidget({
    Key? key,
    this.descText = 'Sorry, your data is not available',
    this.titleText = 'Data not found',
    this.customDescTextStyle,
    this.customTitleTextStyle,
    this.customHeightContent,
    this.onRefresh,
    this.customUrlImage = LottieAssetsConst.animError1,
    this.heightImage,
    this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (onRefresh != null)
        ? RefreshIndicator(
            onRefresh: () async {
              onRefresh!();
            },
            child: ScrollConfiguration(
              behavior: NoScrollGlowBehavior(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _content(context),
              ),
            ),
          )
        : _content(context);
  }

  Widget _content(BuildContext context) {
    return SizedBox(
      height: onRefresh == null
          ? customHeightContent
          : customHeightContent ?? 1.sh / 1.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          customUrlImage.contains('.json')
              ? Lottie.asset(
                  customUrlImage,
                  width: widthImage ?? 177.h,
                  height: heightImage,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  customUrlImage,
                  width: widthImage ?? 177.h,
                  fit: BoxFit.contain,
                  height: heightImage,
                ),
          SizedBox(
            height: titleText.isNotEmpty ? 10.h : 0,
          ),
          Visibility(
            visible: titleText.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                titleText,
                style: customTitleTextStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray800,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: titleText.isNotEmpty ? 6.h : 0,
          ),
          Visibility(
            visible: descText.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                descText,
                style: customDescTextStyle ??
                    TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray600,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
