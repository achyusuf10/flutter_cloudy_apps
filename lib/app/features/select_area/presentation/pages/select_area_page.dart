import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/select_area/domain/entities/area_entity.dart';
import 'package:cloudy/app/features/select_area/presentation/blocs/select_area/select_area_cubit.dart';
import 'package:cloudy/app/features/select_area/presentation/widgets/card_locality_city_widget.dart';
import 'package:cloudy/app/features/select_area/presentation/widgets/card_location_widget.dart';
import 'package:cloudy/app/features/select_area/presentation/widgets/search_text_widget.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/app/widgets/general_empty_widget.dart';
import 'package:cloudy/app/widgets/shimmer_widget.dart';
import 'package:cloudy/config/routes/routes.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_controller_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SelectAreaPage extends StatefulWidget {
  const SelectAreaPage({super.key});

  @override
  State<SelectAreaPage> createState() => _SelectAreaPageState();
}

class _SelectAreaPageState extends State<SelectAreaPage> {
  late SelectAreaCubit _selectCityCubit;

  @override
  void initState() {
    _selectCityCubit = GetControllerFunc.call<SelectAreaCubit>(
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
            'Select Area',
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
              hintText: 'Enter area...',
              onSubmit: _selectCityCubit.onSubmitQuery,
              onChange: _selectCityCubit.onChangeTextField,
              suffixWidget: IconButton(
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.router.pushNamed(Routes.pickLocationPage).then(
                    (value) {
                      if (value is! LocationResultEntity) return;
                      context.router.pop(value);
                    },
                  );
                },
                icon: const Icon(
                  Icons.map_outlined,
                  color: AppColors.gray500,
                ),
              ),
            ),
            14.verticalSpace,
            Expanded(
              child: BlocSelector<SelectAreaCubit, SelectAreaState,
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
                      return BlocSelector<SelectAreaCubit, SelectAreaState,
                          UIState<List<AreaEntity>>>(
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
                                  return CardLocalityCityWidget(
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
