import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:cloudy/app/widgets/main_button_widget.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/utils/extensions/date_time_ext.dart';
import 'package:cloudy/utils/extensions/iteration_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardForecastComponent extends StatelessWidget {
  const CardForecastComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ).h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      width: double.infinity,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: ['Yesterday', 'Today', 'Tomorrow']
                    .extMapIndexed(
                      (data, i) => Expanded(
                        flex: i == 1 ? 22 : 17,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: i == 1 ? 8.w : 0,
                          ),
                          child: MainButtonWidget(
                            borderRadius: 20.r,
                            elevation: 0,
                            primaryColor: state.selectedIndexDay == i
                                ? Colors.transparent
                                : Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                            ),
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: state.selectedIndexDay == i
                                  ? Colors.white
                                  : AppColors.primary500,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: () {
                              context.read<HomeBloc>().add(
                                    HomeEvent.onDaySelected(i),
                                  );
                            },
                            text: data,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              14.verticalSpace,
              state.selectedWeatherCondition.maybeWhen(
                loading: () => ShimmerWidget.custom(
                  child: Row(
                    children: [0, 1, 2, 3, 4, 5]
                        .map(
                          (e) => Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              height: 75.h,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                success: (dataBySelectedDate) {
                  return SizedBox(
                    height: 75.h,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = dataBySelectedDate.listItem[index];
                        return Column(
                          children: [
                            Text(
                              data.time.extToFormattedString(
                                outputDateFormat: 'H a',
                              ),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.gray500,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              data.imagePath,
                              height: 24.h,
                              fit: BoxFit.fitHeight,
                            ),
                            const Spacer(),
                            Text(
                              '${data.temperature.floor()}°C',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary500,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => 35.horizontalSpace,
                      itemCount: dataBySelectedDate.listItem.length,
                    ),
                  );
                },
                orElse: () => const SizedBox(),
              )
            ],
          );
        },
      ),
    );
  }
}
