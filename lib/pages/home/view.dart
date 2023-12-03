import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/font_manager.dart';
import 'package:digitaledge/core/routes_manager.dart';
import 'package:digitaledge/core/strings_manager.dart';
import 'package:digitaledge/core/styles_manager.dart';
import 'package:digitaledge/core/values_manager.dart';
import 'package:digitaledge/pages/home/controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/user/controller.dart';

import '../../core/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

//data container
  _buildDataContainer({required IconData icon, required String dataTitle}) {
    return Container(
      height: AppSize.s40,
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorManager.primary,
          ),
          SizedBox(
            width: AppSize.s20.w,
          ),
          Text(
            dataTitle,
            style: getFont(
                fontSize: AppSize.s16,
                color: ColorManager.grey,
                fontWeight: FontWeightManager.semiBold),
          )
        ],
      ),
    );
  }

//button
  _buildButton({required void Function() onTap, required String buttonTitle}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: AppSize.s40,
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p20,
              right: AppPadding.p20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonTitle,
                  style: getFont(
                      fontSize: AppSize.s18,
                      color: ColorManager.primary,
                      fontWeight: FontWeightManager.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s12,
        ),
        Divider(
          color: ColorManager.grey,
          thickness: AppSize.s1_5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildAppBar(
                title: AppStrings.homePage,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p20,
                    right: AppPadding.p20,
                    top: AppPadding.p25),
                child: _buildUserData(),
              ),
              _buildButton(
                onTap: () {
                  print(
                    AppStrings.updateInformation,
                  );
                  Get.offAllNamed(AppRoutes.updateInformationRoute);
                },
                buttonTitle: AppStrings.updateInformation,
              ),
              _buildButton(
                onTap: () {
                  print(
                    AppStrings.changePassword,
                  );
                },
                buttonTitle: AppStrings.changePassword,
              ),
              _buildButton(
                onTap: () {
                  print(
                    AppStrings.deleteAccount,
                  );
                },
                buttonTitle: AppStrings.deleteAccount,
              ),
              _buildButton(
                onTap: () {
                  UserStore.to.onLogout();
                },
                buttonTitle: AppStrings.logout,
              ),
            ],
          ),
        ));
  }

  GetBuilder<UserStore> _buildUserData() {
    return GetBuilder<UserStore>(builder: (controller) {
      return Column(
        children: [
          _buildDataContainer(
              icon: Icons.person_outline_rounded,
              dataTitle: controller.userProfile?.name ?? ''),
          _buildDataContainer(
              icon: Icons.phone_android,
              dataTitle:
                  '${controller.userProfile!.countryCode} ${controller.userProfile!.phone}'),
          _buildDataContainer(
              icon: Icons.email_outlined,
              dataTitle: controller.userProfile?.email ?? ''),
        ],
      );
    });
  }
}
