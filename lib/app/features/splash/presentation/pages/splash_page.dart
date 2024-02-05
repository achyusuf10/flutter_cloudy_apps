import 'package:auto_route/auto_route.dart';
import 'package:cloudy/app/features/splash/presentation/blocs/splash/splash_cubit.dart';
import 'package:cloudy/config/themes/app_gradient.dart';
import 'package:cloudy/constants/core/image_assets_const.dart';
import 'package:cloudy/constants/core/lottie_assets_const.dart';
import 'package:cloudy/utils/functions/get_controller_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit _splashCubit;
  @override
  void initState() {
    _splashCubit = GetControllerFunc.call<SplashCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _splashCubit,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradient.primaryGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssetsConst.icCloudy,
                  width: 1.sw - (85.w * 2),
                  fit: BoxFit.fitWidth,
                ),
                20.verticalSpace,
                Text(
                  'Cloudy',
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Dont worry about\nthe weather we all here',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                4.verticalSpace,
                LottieBuilder.asset(
                  LottieAssetsConst.animLoading,
                  height: 80.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
