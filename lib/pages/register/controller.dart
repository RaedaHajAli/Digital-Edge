import 'dart:convert';
import 'dart:io';

import 'package:digitaledge/core/strings_manager.dart';
import 'package:digitaledge/network/extensions.dart';
import 'package:digitaledge/pages/register/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/routes_manager.dart';
import '../../core/user/controller.dart';
import '../../network/models.dart';
import '../../network/api_constants.dart';

class RegisterController extends GetxController {
  RegisterController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String contryCode = '+971';
  var loading = false.obs;
  UserItem? user;

  enableAutoValidate() {
    autovalidateMode = AutovalidateMode.always;
    update();
  }

  bool passwordVisibility = true;
  changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }

  bool confirmPasswordVisibility = true;
  changeconfirmPVisibility() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    update();
  }

  //register
  BaseResponse? baseResponse;
  registerUser(RegisterRequest registerRequest) async {
    loading.value = true;
    if (await ApiConstants.networkInfo.isConnected) {
      // => There is connect to the internet
      try {
        Uri url =
            Uri.parse('${ApiConstants.baseUrl}${ApiConstants.registerUrl}');

        // send request
        http.Response response = await http.post(url,
            headers: ApiConstants.getHeader(), body: registerRequest.toJson());

        // print(response.body);

        // decode response
        Map<String, dynamic> data = jsonDecode(response.body);

        baseResponse = BaseResponse.fromJson(data);

        // check if success
        if (baseResponse?.success ?? false) {
          if (response.statusCode == 201) {
            user = UserItem.fromJson(data);

            loading.value = false;
            Get.snackbar(AppStrings.success, AppStrings.successRegister);
            Get.offAllNamed(AppRoutes.homeRoute);
            UserStore.to.saveToken('Bearer ${user!.token}');

            UserStore.to.saveProfile(user!.toStore());
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
      Get.snackbar(AppStrings.networkFailed, AppStrings.networkFailedMessage);
    }
  }
}
