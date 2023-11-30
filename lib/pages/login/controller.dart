import 'package:digitaledge/network/api_service.dart';
import 'package:digitaledge/pages/login/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  enableAutoValidate() {
    autovalidateMode = AutovalidateMode.always;
    update();
  }


  bool passwordVisibility = true;
  changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }

  login(LoginRequest loginRequest) {
   ApiService.loginUser(loginRequest);
  }
}
