import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/font_manager.dart';
import 'package:digitaledge/core/styles_manager.dart';
import 'package:flutter/material.dart';

import 'assets_images.dart';

import 'values_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 // image logo widget
buildLogoImage() {
  return Image.asset(
    AssetsImages.welcomeLogo,
    height: AppSize.s140.h,
    width: AppSize.s140.w,
  );
}


// custom button
buildCustomButton(
    {required String title,
    required Color textColor,
    required Color backgroundColor,
    required Function() onPressed,
    Color borderColor = Colors.transparent}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      textStyle: getFont(
        color: ColorManager.white,
        fontSize: AppSize.s20.sp,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          side: BorderSide(color: borderColor)),
    ),
    child: Container(
      width: AppSize.s250.w,
      height: AppSize.s50,
      alignment: Alignment.center,
      child: Text(
        title,
        style: getFont(
            fontSize: AppSize.s20,
            fontWeight: FontWeightManager.ExtraBold,
            color: textColor),
      ),
    ),
  );
}

// title text
buildTitleText(String title) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(
      top: AppPadding.p25,
    ),
    child: Text(
      title,
      style: getFont(
          color: ColorManager.primary,
          fontSize: AppSize.s28,
          fontWeight: FontWeight.bold),
    ),
  );
}

buildFooterText(String firstWord, String secondWord, Function() onPressed,
    {bool isUnderlined = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        firstWord,
        style: getFont(
            color: ColorManager.primaryFontLight, fontSize: AppSize.s14),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          secondWord,
          style: getFont(
              color: ColorManager.primary,
              fontWeight: FontWeightManager.ExtraBold,
              fontSize: AppSize.s14,
              isUnderLined: isUnderlined),
        ),
      ),
    ],
  );
}
//custom app bar

buildAppBar(
    {required String title,
    bool isIconNeeded = false,
    void Function()? onTap}) {
  return Container(
      height: AppSize.s120.h,
      width: double.infinity,
      color: ColorManager.primary,
      alignment: Alignment.bottomCenter,
      padding:
          const EdgeInsets.only(bottom: AppPadding.p16, left: AppPadding.p16),
      child: !isIconNeeded
          ? Text(
              title,
              style: getFont(
                  fontSize: AppSize.s18,
                  color: ColorManager.white,
                  fontWeight: FontWeightManager.bold),
            )
          : Row(
              children: [
                InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.white,
                    )),
                const SizedBox(
                  width: AppSize.s70,
                ),
                Text(
                  title,
                  style: getFont(
                      fontSize: AppSize.s18,
                      color: ColorManager.white,
                      fontWeight: FontWeightManager.bold),
                ),
              ],
            ));
}

// border of Text Form FieldSave
buildTextFormFieldUpdateBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    borderRadius: BorderRadius.circular(AppSize.s8),
  );
}
