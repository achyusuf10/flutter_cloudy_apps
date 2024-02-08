import 'package:cloudy/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextWidget extends StatefulWidget {
  final Function(String value)? onChange;
  final String hintText;
  final Widget? suffixWidget;
  final Function(String value)? onSubmit;
  const SearchTextWidget({
    super.key,
    this.onChange,
    this.suffixWidget,
    required this.hintText,
    this.onSubmit,
  });

  @override
  State<SearchTextWidget> createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  bool isOnTyping = false;

  void _onSearch(String? value) {
    if ((value ?? '').isNotEmpty) {
      if (isOnTyping) return;
      setState(() {
        isOnTyping = true;
      });
    } else {
      if (isOnTyping == false) return;
      setState(() {
        isOnTyping = false;
      });
    }
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
              textInputAction: TextInputAction.search,
              controller: _controller,
              onChanged: (value) {
                _onSearch(value);
                widget.onChange?.call(value);
              },
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              onSubmitted: widget.onSubmit,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                isDense: true,
                hintText: widget.hintText,
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
          isOnTyping
              ? IconButton(
                  constraints: const BoxConstraints(),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _controller.clear();
                    widget.onChange?.call('');
                    setState(
                      () {
                        isOnTyping = false;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: AppColors.gray900,
                  ),
                )
              : widget.suffixWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
