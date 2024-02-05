import 'package:flutter/material.dart';

class CircularLoadingWidget extends StatelessWidget {
  final double? diameter;
  final double? strokeWidth;

  /// Default Color pakai Primary Color
  final Color? customColor;
  const CircularLoadingWidget({
    this.diameter,
    Key? key,
    this.strokeWidth,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (diameter == null)
          ? circularProgressIndicator(context)
          : SizedBox(
              height: diameter,
              width: diameter,
              child: circularProgressIndicator(context),
            ),
    );
  }

  Widget circularProgressIndicator(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: (strokeWidth == null) ? 6 : strokeWidth!,
      color: customColor ?? Theme.of(context).primaryColor,
    );
  }
}
