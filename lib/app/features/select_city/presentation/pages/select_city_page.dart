import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/select_city/domain/entities/city_entity.dart';
import 'package:cloudy/app/features/select_city/presentation/blocs/select_city/select_city_cubit.dart';
import 'package:cloudy/app/features/select_city/presentation/widgets/card_city_widget.dart';
import 'package:cloudy/app/features/select_city/presentation/widgets/card_location_widget.dart';
import 'package:cloudy/app/features/select_city/presentation/widgets/search_text_widget.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/app/widgets/general_empty_widget.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/themes/app_colors.dart';
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
    _selectCityCubit = GetControllerFunc.call<SelectCityCubit>(
      reset: true,
    );
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
            SearchTextWidget(
              hintText: 'Search City',
              onSubmit: _selectCityCubit.onSubmitQuery,
              onChange: _selectCityCubit.onChangeTextField,
            ),
            14.verticalSpace,
            Expanded(
              child: BlocSelector<SelectCityCubit, SelectCityState,
                  UIState<List<LocationResultEntity>>>(
                selector: (state) => state.stateDataLocation,
                builder: (context, stateData) {
                  return stateData.when(
                    success: (listDataLocation) {
                      return ListView.separated(
                        primary: true,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        itemBuilder: (context, index) {
                          var itemLocation = listDataLocation[index];
                          return CardLocationWidget(
                            itemLocation: itemLocation,
                            onTap: _selectCityCubit.onTapLocation,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return 10.verticalSpace;
                        },
                        itemCount: listDataLocation.length,
                      );
                    },
                    empty: (message) => GeneralEmptyErrorWidget(
                      customHeightContent: 200.h,
                      heightImage: 150.h,
                      titleText: 'City Not Found',
                      descText: message,
                    ),
                    loading: () => const ShimmerWidget.list(
                      length: 4,
                    ),
                    error: (message) => GeneralEmptyErrorWidget(
                      customHeightContent: 200.h,
                      heightImage: 150.h,
                      titleText: 'Error City Not Found',
                      descText: message,
                    ),
                    idle: () {
                      /// * Tampilan awal belum search
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
                                    onTap: (city) {
                                      _selectCityCubit.onTapCity(city);
                                    },
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
