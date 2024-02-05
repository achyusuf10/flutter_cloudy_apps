import 'dart:async';

import 'package:cloudy/app/widgets/circular_loading_widget.dart';
import 'package:cloudy/app/widgets/main_button_widget.dart';
import 'package:cloudy/constants/core/image_assets_const.dart';
import 'package:cloudy/utils/functions/get_context_func.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  final GetContextFunc getContext;
  DialogService(this.getContext);

  void loading() {
    showDialog(
      barrierDismissible: false,
      context: (getContext.i),
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          onPopInvoked: (value) => Future.value(false),
          child: const CircularLoadingWidget(),
        );
      },
    );
  }

  void closeOverlay() {
    try {
      Navigator.pop(getContext.i);
    } on Exception catch (e) {
      throw ('Exception occurred in pop: $e');
    }
  }

  Future<T?> mainPopUp<T>({
    /// Default True
    bool barrierDismissible = true,
    required String title,
    required String desc,
    String urlImage = '',
    String mainButtonText = 'Tutup',
    String secondaryButtonText = '',
    Function()? mainButtonFunction,
    Function()? secondaryButtonFunction,
  }) async {
    return await showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: (getContext.i),
      builder: (BuildContext context) {
        return PopScope(
          canPop: barrierDismissible,
          child: AlertDialog(
            actionsPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.w),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: MainButtonWidget(
                      text: mainButtonText,
                      onTap: mainButtonFunction ??
                          () {
                            closeOverlay();
                          },
                    ),
                  ),
                  if (secondaryButtonFunction != null)
                    SizedBox(
                      width: 10.w,
                    ),
                  if (secondaryButtonFunction != null)
                    Expanded(
                      child: MainButtonWidget.outlined(
                        text: secondaryButtonText,
                        onTap: secondaryButtonFunction,
                      ),
                    ),
                ],
              )
            ],
            actionsAlignment: MainAxisAlignment.spaceBetween,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (urlImage.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Image.asset(
                      urlImage,
                      height: 128.h,
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<T?> dialogProblem<T>({
    /// Default True
    bool barrierDismissible = true,
    String title = 'Ups Ada Masalah',
    required String desc,
  }) async {
    return mainPopUp<T>(
      title: title,
      desc: desc,
      barrierDismissible: barrierDismissible,
      urlImage: ImageAssetsConst.dialogFailed,
    );
  }

  void dialogSuccess({
    /// Default True
    bool barrierDismissible = true,
    String title = 'Sukses',
    required String desc,
  }) {
    mainPopUp(
      title: title,
      desc: desc,
      barrierDismissible: barrierDismissible,
      urlImage: ImageAssetsConst.dialogSuccess,
    );
  }
}
