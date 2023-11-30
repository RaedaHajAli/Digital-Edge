

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

import 'styles_manager.dart';
import 'values_manager.dart';


ThemeData getAppTheme() {
  return ThemeData(
      //main colors
      primaryColor: ColorManager.primary,
     
      disabledColor: ColorManager.grey,
     // splashColor: ColorManager.primary, //ripple effect

      
     
       


     

      //form field style
      inputDecorationTheme: InputDecorationTheme(
   

        

        //hint Style
        hintStyle: getFont(color: ColorManager.grey,fontSize: AppSize.s14.sp,),
        
        labelStyle:getFont(color: ColorManager.grey,fontSize: AppSize.s14.sp), 

        // error text Style
        errorStyle: getFont(color: ColorManager.error,fontSize: AppSize.s14.sp),
      

        //enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
         
        ),

        //focus border style
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
         
        ),

        //error border style
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
         
        ),
        //focused Error Border
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5
          ),
          borderRadius: BorderRadius.circular(AppSize.s8),
         
        ),

      )
      
      );
}
