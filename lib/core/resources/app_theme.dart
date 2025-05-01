import 'package:flutter/material.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';

class AppTheme {
  static ThemeData lightThem = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.backGroundColor,
  );
}
