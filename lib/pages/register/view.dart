import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/functions.dart';
import 'package:digitaledge/core/values_manager.dart';
import 'package:digitaledge/pages/register/controller.dart';
import 'package:digitaledge/pages/register/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/routes_manager.dart';
import '../../core/widgets.dart';
import '../../core/strings_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

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
                buildTitleText(AppStrings.register),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                _buildRegisterForm(),
                SizedBox(
                  height: AppSize.s30.h,
                ),
                buildFooterText(AppStrings.registerText, AppStrings.login, () {
                  Get.offAllNamed(AppRoutes.loginRoute);
                }),
                SizedBox(
                  height: AppSize.s15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   _buildRegisterForm() {
    return GetBuilder<RegisterController>(
      builder: (_) {
        return Form(
          key: controller.formKey,
          autovalidateMode: controller.autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
            child: Column(
              children: [
                // name field
                TextFormField(
                  controller: controller.nameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  validator: validateStringField,
                  decoration: const InputDecoration(
                    hintText: AppStrings.fullName,
                  ),
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                // phone field
                TextFormField(
                  controller: controller.phoneController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  validator: validateStringField,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(9),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    hintText: '559944351',
                    contentPadding: const EdgeInsets.only(
                      top: AppPadding.p20,
                      right: AppPadding.p70,
                      bottom: AppPadding.p20,
                    ),
                    prefixIcon: CountryCodePicker(
                      padding: EdgeInsets.zero,
                      onChanged: (countryCode) {
                        controller.contryCode =
                            countryCode.code ?? controller.contryCode;
                      },
                      initialSelection: 'ae',
                      hideMainText: true,
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                // email field
                TextFormField(
                  controller: controller.emailController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmailField,
                  decoration: const InputDecoration(
                    hintText: AppStrings.email,
                  ),
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),

                TextFormField(
                  controller: controller.passwordController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  validator: validateStringField,
                  obscureText: controller.passwordVisibility,
                  decoration: InputDecoration(
                      hintText: AppStrings.password,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: ColorManager.primary,
                        ),
                        onPressed: () {
                          controller.changePasswordVisibility();
                        },
                      )),
                ),
                SizedBox(
                  height: AppSize.s12.h,
                ),
                // confirm password field
                TextFormField(
                  controller: controller.confirmPasswordController,
                  validator: validateStringField,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.confirmPasswordVisibility,
                  decoration: InputDecoration(
                      hintText: AppStrings.confirmPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: ColorManager.primary,
                        ),
                        onPressed: () {
                          controller.changeconfirmPVisibility();
                        },
                      )),
                ),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                // register button
                buildCustomButton(
                    title: AppStrings.register,
                    textColor: ColorManager.white,
                    backgroundColor: ColorManager.primary,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.register(RegisterRequest(
                            name: controller.nameController.text,
                            email: controller.emailController.text,
                            phone: controller.phoneController.text,
                            password: controller.passwordController.text,
                            confirmPassword:
                                controller.confirmPasswordController.text,
                            countryCode: controller.contryCode));
                      } else {
                        controller.enableAutoValidate();
                      }
                    }),
              ],
            ),
          ),
        );
      }
    );
  }
}
