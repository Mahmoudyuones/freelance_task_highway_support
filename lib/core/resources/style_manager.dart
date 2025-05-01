import 'package:flutter/widgets.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';

class StyleManager {
  TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) => TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontConstants.fontFamily,
  );

  TextStyle getLightStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.light, color);

  TextStyle getRegularStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.regular, color);

  TextStyle getMediumStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.medium, color);

  TextStyle getSemiBoldStyle({double? fontSize, required Color color}) =>
      _getTextStyle(
        fontSize ?? FontSize.s12,
        FontWeightManager.semiBold,
        color,
      );

  TextStyle getBoldStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.bold, color);

  TextStyle getTextWithLine() => TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    decorationColor: ColorsManager.primaryColor,
  );
}
