import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardLocationWidget extends StatelessWidget {
  final Function(LocationResultEntity value)? onTap;
  const CardLocationWidget({
    super.key,
    required this.itemLocation,
    this.onTap,
  });

  final LocationResultEntity itemLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(itemLocation);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.gray500,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${itemLocation.locality}, ${itemLocation.subAdministrativeArea}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            4.verticalSpace,
            Text(
              '${itemLocation.administrativeArea}, ${itemLocation.country}',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.gray800,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
