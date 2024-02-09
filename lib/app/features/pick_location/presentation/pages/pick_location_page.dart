// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/pick_location/presentation/blocs/pick_location/pick_location_cubit.dart';
import 'package:cloudy/app/global_entity/location_result_entity.dart';
import 'package:cloudy/app/widgets/general_empty_widget.dart';
import 'package:cloudy/app/widgets/main_button_widget.dart';
import 'package:cloudy/config/themes/app_colors.dart';
import 'package:cloudy/constants/core/lottie_assets_const.dart';
import 'package:cloudy/core/state/ui_state.dart';
import 'package:cloudy/utils/functions/get_controller_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lottie;

@RoutePage()
class PickLocationPage extends StatefulWidget {
  const PickLocationPage({super.key});

  @override
  State<PickLocationPage> createState() => _PickLocationPageState();
}

class _PickLocationPageState extends State<PickLocationPage> {
  late PickLocationCubit _pickLocationCubit;
  late MapController _mapController;
  @override
  void initState() {
    _mapController = MapController();
    _pickLocationCubit = GetControllerFunc.call<PickLocationCubit>(reset: true);

    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _pickLocationCubit,
      child: Scaffold(
        bottomNavigationBar: BlocSelector<PickLocationCubit, PickLocationState,
            UIState<LocationResultEntity>>(
          selector: (state) => state.selectedLocation,
          builder: (context, state) {
            return state.maybeWhen(
              success: (userLocation) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${userLocation.locality}, ${userLocation.subAdministrativeArea}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${userLocation.administrativeArea}, ${userLocation.country}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.horizontalSpace,
                          Icon(
                            Icons.map_outlined,
                            color: AppColors.primary500,
                            size: 32.h,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      MainButtonWidget(
                        text: 'Select',
                        onTap: () {
                          _pickLocationCubit.onTapSelect(
                            userLocation,
                            context,
                          );
                        },
                      )
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
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
            'Pick Location',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocSelector<PickLocationCubit, PickLocationState,
            UIState<Position>>(
          selector: (state) => state.selectedPosition,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(
                child: lottie.LottieBuilder.asset(
                  LottieAssetsConst.animLoading,
                  height: 1.sh / 3.5,
                ),
              ),
              error: (message) {
                return Center(
                  child: GeneralEmptyErrorWidget(
                    onRefresh: () {
                      _pickLocationCubit.onRefresh();
                    },
                    heightImage: 200.h,
                    titleText: '',
                    descText: message,
                    customDescTextStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                    ),
                  ),
                );
              },
              success: (userLocation) {
                return FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      userLocation.latitude,
                      userLocation.longitude,
                    ),
                    initialZoom: 12,
                    onTap: (_, position) {
                      _pickLocationCubit.onTapMap(
                        position.latitude,
                        position.longitude,
                      );
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'cloudy_app.app',
                      subdomains: const ['a', 'b', 'c'],
                      maxZoom: 15,
                      minZoom: 9,
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            userLocation.latitude,
                            userLocation.longitude,
                          ),
                          width: 80.h,
                          height: 80.h,
                          child: const Icon(
                            Icons.location_pin,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
