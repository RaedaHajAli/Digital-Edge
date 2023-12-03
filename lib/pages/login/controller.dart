import 'dart:convert';
import 'dart:io';

import 'package:digitaledge/core/strings_manager.dart';
import 'package:digitaledge/network/api_constants.dart';
import 'package:digitaledge/pages/login/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/routes_manager.dart';
import '../../core/user/controller.dart';
import '../../core/user/models.dart';
import '../register/models.dart';

class LoginController extends GetxController {
  LoginController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  var loading = false.obs;
  BaseResponse? baseResponse;
  enableAutoValidate() {
    autovalidateMode = AutovalidateMode.always;
    update();
  }

  bool passwordVisibility = true;
  changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }

  login(LoginRequest loginRequest) async {
    loading.value = true;

    if (await ApiConstants.networkInfo.isConnected) {
      // => There is connect to the internet
      try {
        Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginUrl}');

        // send request
        http.Response response = await http.post(url,
            headers: ApiConstants.getHeader(), body: loginRequest.toJson());

        // print(response.body);

        // decode response
        Map<String, dynamic> data = jsonDecode(response.body);

        baseResponse = BaseResponse.fromJson(data);

        // check if success
        if (baseResponse?.success ?? false) {
          if (response.statusCode == 200) {
            UserStore.to.userProfile = UserItem.fromJson(data);
            loading.value = false;
            Get.snackbar(AppStrings.success, AppStrings.successLogin);

            // token = utf8.decode(user!.token.codeUnits);
            UserStore.to.token = 'Bearer ${UserStore.to.userProfile!.token}';
           

            Get.offAllNamed(AppRoutes.homeRoute);
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
