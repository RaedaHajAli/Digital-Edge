import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/routes_manager.dart';
import 'package:digitaledge/core/values_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets.dart';
import '../../core/strings_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        width: AppSize.s360.w,
        height: AppSize.s780.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s60.h,
                ),
                buildLogoImage(),
                buildTitleText(AppStrings.welcome),
                SizedBox(
                  height: AppSize.s180.h,
                ),
                buildCustomButton(
                    title: AppStrings.login,
                    textColor: ColorManager.white,
                    backgroundColor: ColorManager.primary,
                    
                    onPressed: () {
                      print('.......login');
                      Get.offAllNamed(AppRoutes.loginRoute);
                    }),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                buildCustomButton(
                    title: AppStrings.register,
                    textColor: ColorManager.primary,
                    backgroundColor: ColorManager.white,
                   
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.registerRoute);
                      print('.......register');
                    },
                    borderColor: ColorManager.primary),
                SizedBox(
                  height: AppSize.s180.h,
                ),
                buildFooterText(AppStrings.designed, AppStrings.aliFouad, () {},
                    isUnderlined: true),
                SizedBox(
                  height: AppSize.s20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
