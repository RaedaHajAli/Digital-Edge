import 'package:digitaledge/core/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    required Color color,
    required FontWeight fontWeight,
    required bool isUnderlined}) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: isUnderlined ? TextDecoration.underline : null);
}

//Regular Style
TextStyle getFont(
    {required double fontSize,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeightManager.regular,
    bool isUnderLined = false}) {
  return _getTextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      isUnderlined: isUnderLined);
}

getTextFormFiedUpdateFont() {
  return getFont(
    color: ColorManager.primary,
    fontSize: AppSize.s16,
    fontWeight: FontWeightManager.bold,
  );
}
