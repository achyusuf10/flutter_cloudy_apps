import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final String type;

  /// * --- Variable For Custom Type
  final Widget child;

  /// * --- Variable For Box Type
  final double height;
  final double width;
  final double radius;

  final int length;

  /// * --- Variable For List Type

  /// EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
  ///
  /// Padding buat list
  final EdgeInsets? padding;
  final bool isScrolled;
  final Color? colorWidget;

  /// * Jika Ingin Menggunakan Item Widget yang berbeda, isi widget ini
  /// * Default Widget Seperti ini
  final Widget? customItemWidget;
  const ShimmerWidget.list({
    Key? key,
    this.length = 2,
    this.padding,
    this.isScrolled = false,
    this.customItemWidget,
    this.colorWidget,
  })  : type = 'list',
        height = 0,
        width = 0,
        radius = 0,
        child = const SizedBox(),
        super(key: key);
  const ShimmerWidget.box({
    Key? key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.radius = 8,
    this.colorWidget,
  })  : type = 'box',
        customItemWidget = null,
        isScrolled = false,
        padding = null,
        length = 2,
        child = const SizedBox(),
        super(key: key);

  const ShimmerWidget.custom({
    Key? key,
    required this.child,
  })  : type = 'custom',
        customItemWidget = null,
        isScrolled = false,
        padding = null,
        length = 2,
        height = 0,
        width = 0,
        colorWidget = null,
        radius = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 600),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: switch (type) {
        'list' => _buildListWidget(),
        'box' => Container(
            width: width,
            decoration: BoxDecoration(
              color: colorWidget ?? Colors.white,
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            height: height,
          ),
        _ => child,
      },
    );
  }

  Widget _buildListWidget() {
    return ListView.separated(
      primary: isScrolled,
      separatorBuilder: (context, index) => SizedBox(
        height: 14.h,
      ),
      shrinkWrap: true,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
      physics: isScrolled ? null : const NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) {
        return customItemWidget ??
            Container(
              decoration: BoxDecoration(
                color: colorWidget ?? Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              height: 50.0.h,
            );
      },
      itemCount: length,
    );
  }
}
