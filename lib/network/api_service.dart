import 'dart:convert';
import 'dart:io';

import 'package:digitaledge/core/color_manager.dart';
import 'package:digitaledge/core/routes_manager.dart';

import 'package:digitaledge/core/user/controller.dart';
import 'package:digitaledge/network/network_info.dart';
import 'package:digitaledge/pages/update_information/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/user/models.dart';
import '../pages/login/models.dart';
import 'api_constants.dart';
import '../pages/register/models.dart';

class ApiService {
  static NetworkInfo networkInfo = NetworkInfo(InternetConnectionChecker());

  static UserItem? user;
  static UpdateUserResponse? updateUserResponse;

  static registerUser(RegisterRequest registerRequest) async {
    BaseResponse? baseResponse;

    if (await networkInfo.isConnected) {
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
        if (baseResponse.success) {
          if (response.statusCode == 201) {
            UserStore.to.userProfile = UserItem.fromJson(data);
            Get.snackbar('Success', 'You have registered successfully');
            Get.offAllNamed(AppRoutes.homeRoute);
            UserStore.to.token = 'Bearer ${UserStore.to.userProfile!.token}';
          }
        } else {
          // failure has been occured
          Get.snackbar('Failed', '${baseResponse.message}');
        }
      } on HttpException catch (e) {
        Get.snackbar('Failed', 'something went wrong ${e.message}');
      }
    } else {
      // Network Error
      Get.snackbar('Network Failed',
          'You are\'t connected to the internet, please check your network');
    }
  }

  // login user
  static loginUser(LoginRequest loginRequest) async {
    BaseResponse? baseResponse;

    if (await networkInfo.isConnected) {
      // => There is connect to the internet
      try {
        Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginUrl}');

        // send request
        http.Response response = await http.post(url,
            headers: ApiConstants.getHeader(), body: loginRequest.toJson());

        print(response.body);

        // decode response
        Map<String, dynamic> data = jsonDecode(response.body);

        baseResponse = BaseResponse.fromJson(data);

        // check if success
        if (baseResponse.success) {
          if (response.statusCode == 200) {
            UserStore.to.userProfile = UserItem.fromJson(data);
            Get.snackbar('Success', 'You have logged in successfully');

            // token = utf8.decode(user!.token.codeUnits);
            UserStore.to.token = 'Bearer ${UserStore.to.userProfile!.token}';

            Get.offAllNamed(AppRoutes.homeRoute);
          }
        } else {
          // failure has been occured
          Get.snackbar('Failed', '${baseResponse.message}');
        }
      } on HttpException catch (e) {
        Get.snackbar('Failed', 'something went wrong ${e.message}');
      }
    } else {
      // Network Error
      Get.snackbar('Network Failed',
          'You are\'t connected to the internet, please check your network');
    }
  }

  // update user
  static updateUser(UpdateUserRequest updateUserRequest) async {
    BaseResponse? baseResponse;

    if (await networkInfo.isConnected) {
      // => There is connect to the internet
      try {
        Uri url =
            Uri.parse('${ApiConstants.baseUrl}${ApiConstants.updateUserUrl}');

        // send request
        http.Response response = await http.post(url,
            headers: ApiConstants.getHeader(token: UserStore.to.token),
            body: updateUserRequest.toJson());

        print(response.body);

        // decode response
        Map<String, dynamic> data = jsonDecode(response.body);

        baseResponse = BaseResponse.fromJson(data);

        // check if success
        if (baseResponse.success) {
          if (response.statusCode == 200) {
            updateUserResponse = UpdateUserResponse.fromJson(data);
            if (updateUserResponse != null) {
              updateUserProfileStore();
              Get.offAllNamed(AppRoutes.homeRoute);
            }
            Get.snackbar('Success', 'Your data has been updated successfully',snackPosition: SnackPosition.BOTTOM,backgroundColor: ColorManager.green);
          }
        } else {
          // failure has been occured
          Get.snackbar('Failed', '${baseResponse.message}');
        }
      } on HttpException catch (e) {
        Get.snackbar('Failed', 'something went wrong ${e.message}');
      }
    } else {
      // Network Error
      Get.snackbar('Network Failed',
          'You are\'t connected to the internet, please check your network');
    }
  }

  static updateUserProfileStore() {
    UserStore.to.userProfile!.email = updateUserResponse!.email;
    UserStore.to.userProfile!.name = updateUserResponse!.name;
    UserStore.to.userProfile!.phone = updateUserResponse!.phone;
    UserStore.to.userProfile!.countryCode = updateUserResponse!.countryCode;
  }
}
