import 'package:country_code_picker/country_code_picker.dart';
import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/routes_manager.dart';

import 'package:digitaledge/core/strings_manager.dart';
import 'package:digitaledge/core/styles_manager.dart';
import 'package:digitaledge/core/values_manager.dart';
import 'package:digitaledge/core/widgets.dart';

import 'package:digitaledge/pages/update_information/controller.dart';
import 'package:digitaledge/pages/update_information/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/functions.dart';

class UpdateInformationView extends GetView<UpdateInformationController> {
  const UpdateInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Obx(
         () {
          return ModalProgressHUD(
            inAsyncCall:controller.loading.value ,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAppBar(
                      title: AppStrings.updateInformation,
                      isIconNeeded: true,
                      onTap: () => Get.offAllNamed(AppRoutes.homeRoute)),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppSize.s30,
                      left: AppSize.s50,
                      right: AppSize.s50,
                    ),
                    child: _buildUpdateForm(),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  _buildUpdateForm() {
    return GetBuilder<UpdateInformationController>(builder: (_) {
     
      return Form(
        key: controller.formKey,
        autovalidateMode: controller.autovalidateMode,
        child: Column(
          children: [

            //name field
            TextFormField(
              controller: controller.nameController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              validator: validateStringField,
              style: getTextFormFiedUpdateFont(),
              decoration: InputDecoration(
                hintText: AppStrings.fullName,
                enabledBorder: buildTextFormFieldUpdateBorder(),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            // phone field
            TextFormField(
              controller: controller.phoneController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
              validator: validateStringField,
              style: getTextFormFiedUpdateFont(),
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
                enabledBorder: buildTextFormFieldUpdateBorder(),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            // email field
            TextFormField(
              controller: controller.emailController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              validator: validateEmailField,
              style: getTextFormFiedUpdateFont(),
              decoration: InputDecoration(
                hintText: AppStrings.email,
                enabledBorder: buildTextFormFieldUpdateBorder(),
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            ),

            // save button

            buildCustomButton(
                title: AppStrings.save,
                textColor: ColorManager.white,
                backgroundColor: ColorManager.primary,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.updateUser(UpdateUserRequest(
                        name: controller.nameController.text,
                        email: controller.emailController.text,
                        phone: controller.phoneController.text,
                        countryCode: controller.contryCode));
                  } else {
                    controller.enableAutoValidate();
                  }
                })
          ],
        ),
      );
    });
  }
}
