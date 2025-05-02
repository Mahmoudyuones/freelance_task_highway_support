import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor,
    this.textColor,
    this.icon,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? backGroundColor;
  final Color? textColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: textColor != null ? BorderSide(color: textColor!) : null,
        backgroundColor: backGroundColor ?? ColorsManager.primaryColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 22.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      ),
      child: Text(
        text,
        style: StyleManager().getSemiBoldStyle(
          color: textColor ?? ColorsManager.white,
          fontSize: FontSize.s11,
        ),
      ),
    );
  }
}
