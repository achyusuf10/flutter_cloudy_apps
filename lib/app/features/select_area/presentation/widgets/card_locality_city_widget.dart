import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/config/themes/app_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardLocalityCityWidget extends StatelessWidget {
  const CardLocalityCityWidget({
    super.key,
    required this.itemCity,
    this.onTap,
  });

  final AreaEntity itemCity;
  final Function(AreaEntity item)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(itemCity);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: AppGradient.primaryGradient,
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
              size: 24.h,
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemCity.locationData.locality,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    itemCity.locationData.subAdministrativeArea,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${itemCity.locationData.administrativeArea}. ${itemCity.locationData.country}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              itemCity.forecastData.currentWeather?.conditionByCurrentHours
                      .imagePath ??
                  '',
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
