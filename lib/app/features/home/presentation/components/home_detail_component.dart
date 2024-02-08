import 'package:cloudy/app/features/home/domain/entities/weather_entity.dart';
import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:cloudy/app/widgets/general_empty_widget.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/constants/core/svg_assets_const.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeDetailsComponent extends StatelessWidget {
  const HomeDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary500,
            ),
          ),
          8.verticalSpace,
          BlocSelector<HomeBloc, HomeState, UIState<WeatherEntity>>(
            selector: (state) => state.currentWeatherCondition,
            builder: (context, state) {
              return state.maybeWhen(
                error: (message) {
                  return GeneralEmptyErrorWidget(
                    customHeightContent: 200.h,
                    heightImage: 150.h,
                    titleText: '',
                    descText: message,
                  );
                },
                loading: () => ShimmerWidget.custom(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 160 / 76,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      );
                    },
                  ),
                ),
                success: (data) => GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 160 / 76,
                  ),
                  itemBuilder: (context, index) {
                    String svgAssets = switch (index) {
                      0 => SvgAssetsConst.icTemperature,
                      1 => SvgAssetsConst.icWindPressure,
                      2 => SvgAssetsConst.icUvIndex,
                      3 => SvgAssetsConst.icHumidity,
                      _ => '',
                    };
                    String value = switch (index) {
                      0 => '${data.conditionByCurrentHours.temperature}°',
                      1 => '${data.conditionByCurrentHours.windPressure} mp/h',
                      2 => '${data.conditionByCurrentHours.uvIndex}',
                      3 => '${data.conditionByCurrentHours.humidity}%',
                      _ => '',
                    };
                    String label = switch (index) {
                      0 => 'Celcius',
                      1 => 'Pressure',
                      2 => 'UV Index',
                      3 => 'Humidity',
                      _ => '',
                    };
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            svgAssets,
                            width: 38.w,
                            fit: BoxFit.fitWidth,
                          ),
                          10.horizontalSpace,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary500,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                label,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
