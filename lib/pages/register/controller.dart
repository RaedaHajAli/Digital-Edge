

import 'package:digitaledge/network/api_service.dart';
import 'package:digitaledge/pages/register/models.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


const String registerUrl = '/user/register';

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
 
  register(RegisterRequest registerRequest)  {
  
    ApiService.registerUser(registerRequest);
   
  }
}
