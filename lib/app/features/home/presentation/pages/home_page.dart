import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:cloudy/app/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:cloudy/app/features/home/presentation/components/card_forecast_component.dart';
import 'package:cloudy/app/features/home/presentation/components/home_app_bar_component.dart';
import 'package:cloudy/app/features/home/presentation/components/home_detail_component.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/themes/app_gradient.dart';
import 'package:cloudy/constants/core/image_assets_const.dart';
import 'package:cloudy/constants/core/lottie_assets_const.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/extensions/date_time_ext.dart';
import 'package:cloudy/utils/functions/get_controller_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = GetControllerFunc.call<HomeBloc>();
    _homeBloc.add(const HomeEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            _homeBloc.add(const HomeEvent.onRefresh());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  width: 1.sw,
                  height: 363.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.softLight,
                      ),
                      image: AssetImage(
                        ImageAssetsConst.bgHome,
                      ),
                      opacity: 0.3,
                      fit: BoxFit.cover,
                    ),
                    gradient: AppGradient.primaryGradient,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24.r),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewPadding.top,
                    ),
                    BlocSelector<HomeBloc, HomeState,
                        UIState<LocationResultEntity>>(
                      selector: (state) => state.selectedLocation,
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => ShimmerWidget.box(
                            width: 100.w,
                            height: 50.h,
                            colorWidget: Colors.white,
                          ),
                          error: (message) {
                            return AppBar().preferredSize.height.verticalSpace;
                          },
                          success: (location) {
                            return HomeAppBarComponent(
                              selectedLocation: location,
                            );
                          },
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                    18.verticalSpace,
                    BlocSelector<HomeBloc, HomeState,
                        UIState<ForecastWeatherEntity>>(
                      selector: (state) => state.currentWeatherCondition,
                      builder: (context, stateData) {
                        return stateData.maybeWhen(
                          error: (message) {
                            return SizedBox(
                              height: 106.h + 20.sp,
                            );
                          },
                          loading: () {
                            return LottieBuilder.asset(
                              LottieAssetsConst.animLoading,
                              height: 106.h + 20.sp,
                            );
                          },
                          success: (data) {
                            return Column(
                              children: [
                                Image.asset(
                                  data.conditionByCurrentHours.imagePath,
                                  height: 90.h,
                                  fit: BoxFit.fitHeight,
                                ),
                                16.verticalSpace,
                                Text(
                                  data.conditionByCurrentHours.condition,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                    4.verticalSpace,
                    Text(
                      DateTime.now().extToFormattedString(
                        outputDateFormat: 'EEEE, dd MMMM yyyy',
                      ),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    18.verticalSpace,
                    const CardForecastComponent(),
                    24.verticalSpace,
                    const HomeDetailsComponent()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
