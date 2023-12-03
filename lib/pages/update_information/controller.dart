import 'dart:convert';
import 'dart:io';

import 'package:digitaledge/core/user/models.dart';
import 'package:digitaledge/network/api_constants.dart';
import 'package:digitaledge/network/extensions.dart';
import 'package:digitaledge/pages/update_information/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/routes_manager.dart';
import '../../core/strings_manager.dart';
import '../../core/user/controller.dart';
import '../register/models.dart';

class UpdateInformationController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var loading = false.obs;
  BaseResponse? baseResponse;
  static UpdateUserResponse? updateUserResponse;
  enableAutoValidate() {
    autovalidateMode = AutovalidateMode.always;
    update();
  }

  String contryCode = '+971';
  UserProfile? user = UserStore.to.userProfile;

  @override
  void onReady() {
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = user?.phone ?? '';
    contryCode = user?.countryCode ?? '';
    super.onReady();
  }

  updateUser(UpdateUserRequest updateUserRequest) async {
    loading.value = true;

    if (await ApiConstants.networkInfo.isConnected) {
      // => There is connect to the internet
      try {
        Uri url =
            Uri.parse('${ApiConstants.baseUrl}${ApiConstants.updateUserUrl}');

        // send request
        http.Response response = await http.post(url,
            headers: ApiConstants.getHeader(token: UserStore.to.token),
            body: updateUserRequest.toJson());

        // print(response.body);

        // decode response
        Map<String, dynamic> data = jsonDecode(response.body);

        baseResponse = BaseResponse.fromJson(data);

        // check if success
        if (baseResponse?.success ?? false) {
          if (response.statusCode == 200) {
            updateUserResponse = UpdateUserResponse.fromJson(data);
            if (updateUserResponse != null) {
              updateUserResponse!.updateStore();
              loading.value = false;
              Get.offAllNamed(AppRoutes.homeRoute);
            }
            Get.snackbar(AppStrings.success, AppStrings.successUpdate);
          }
        } else {
          // failure has been occured
          loading.value = false;
          Get.snackbar(AppStrings.failed,
              '${baseResponse?.message ?? AppStrings.failedMessage}');
        }
      } on HttpException catch (e) {
        loading.value = false;
        Get.snackbar(
            AppStrings.failed, '${AppStrings.failedMessage} ${e.message}');
      }
    } else {
      // Network Error
      loading.value = false;
      Get.snackbar(AppStrings.networkFailed, AppStrings.networkFailedMessage);
    }
  }
}
