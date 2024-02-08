import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/config/routes/routes.dart';
import 'package:cloudy/core/loggers/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBarComponent extends StatelessWidget {
  final LocationResultEntity selectedLocation;
  const HomeAppBarComponent({
    super.key,
    required this.selectedLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            var res = await context.router.pushNamed(Routes.selectCityPage);
            AppLogger.logData(res.toString());
          },
          child: SizedBox(
            height: AppBar().preferredSize.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${selectedLocation.subAdministrativeArea}, ${selectedLocation.administrativeArea}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    4.horizontalSpace,
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20.h,
                    ),
                  ],
                ),
                Text(
                  selectedLocation.country,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
