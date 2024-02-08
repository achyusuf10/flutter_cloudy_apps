import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/features/select_city/presentation/blocs/select_city/select_city_cubit.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/config/themes/app_gradient.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_controller_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  late SelectCityCubit _selectCityCubit;

  @override
  void initState() {
    _selectCityCubit = GetControllerFunc.call<SelectCityCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _selectCityCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary500,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Select City',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            12.verticalSpace,
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: AppColors.gray500,
                  ),
                  7.horizontalSpace,
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        isDense: true,
                        hintText: 'Search city',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.gray300,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  7.horizontalSpace,
                  IconButton(
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.map_outlined,
                      color: AppColors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            14.verticalSpace,
            Expanded(
              child: BlocSelector<SelectCityCubit, SelectCityState,
                  UIState<List<LocationResultEntity>>>(
                selector: (state) => state.stateDataLocation,
                builder: (context, stateData) {
                  return stateData.when(
                    success: (listDataLocation) {
                      return const SizedBox();
                    },
                    empty: (message) => const SizedBox(),
                    loading: () => const ShimmerWidget.list(
                      length: 4,
                    ),
                    error: (message) => const SizedBox(),
                    idle: () {
                      return BlocSelector<SelectCityCubit, SelectCityState,
                          UIState<List<CityEntity>>>(
                        selector: (state) => state.stateDataCity,
                        builder: (context, stateDataCity) {
                          return stateDataCity.maybeWhen(
                            success: (listDataCity) {
                              return ListView.separated(
                                primary: true,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                ),
                                itemBuilder: (context, index) {
                                  var itemCity = listDataCity[index];
                                  return CardCityWidget(
                                    itemCity: itemCity,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return 10.verticalSpace;
                                },
                                itemCount: listDataCity.length,
                              );
                            },
                            orElse: () => const SizedBox(),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardCityWidget extends StatelessWidget {
  const CardCityWidget({
    super.key,
    required this.itemCity,
    this.onTap,
  });

  final CityEntity itemCity;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    itemCity.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${itemCity.regionName} ${itemCity.countryName}',
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
              itemCity.currentForecast.conditionByCurrentHours.imagePath,
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
