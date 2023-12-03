import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/routes_manager.dart';
import 'package:digitaledge/core/values_manager.dart';
import 'package:digitaledge/pages/login/controller.dart';
import 'package:digitaledge/pages/login/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/functions.dart';
import '../../core/widgets.dart';
import '../../core/strings_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body:Obx(
       () {
          return ModalProgressHUD(
            inAsyncCall: controller.loading.value,
            child: Container(
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
                      buildTitleText(AppStrings.login),
                      SizedBox(
                        height: AppSize.s100.h,
                      ),
                      _buildLoginForm(),
                      SizedBox(
                        height: AppSize.s150.h,
                      ),
                      buildFooterText(AppStrings.loginText, AppStrings.register, () {
                        Get.offAllNamed(AppRoutes.registerRoute);
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
      ),
    );
  }

  _buildLoginForm() {
    return GetBuilder<LoginController>(builder: (_) {
      return Form(
        key: controller.formKey,
        autovalidateMode: controller.autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
          child: Column(
            children: [
              //email field
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
                height: 20.h,
              ),
              // password field
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
                height: AppSize.s40.h,
              ),

              //login button
              buildCustomButton(
                  title: AppStrings.login,
                  textColor: ColorManager.white,
                  backgroundColor: ColorManager.primary,
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login(LoginRequest(email: controller.emailController.text,password: controller.passwordController.text));
                    } else {
                      controller.enableAutoValidate();
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }
}
