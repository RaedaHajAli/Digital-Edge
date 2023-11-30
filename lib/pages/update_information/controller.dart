import 'package:digitaledge/network/api_service.dart';
import 'package:digitaledge/pages/update_information/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/user/controller.dart';
import '../../core/user/models.dart';

class UpdateInformationController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  enableAutoValidate() {
    autovalidateMode = AutovalidateMode.always;
    update();
  }

  String contryCode = '+971';
  UserItem? user = UserStore.to.userProfile;

  @override
  void onReady() {
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = user?.phone ?? '';
    contryCode = user?.countryCode?? '';
    super.onReady();
  }

  updateUser(UpdateUserRequest updateUserRequest) {
    ApiService.updateUser(updateUserRequest);
  }
}
