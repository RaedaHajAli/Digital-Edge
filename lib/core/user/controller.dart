import 'dart:convert';

import 'package:digitaledge/core/cache_helper.dart';
import 'package:digitaledge/core/user/models.dart';
import 'package:get/get.dart';

import '../constants_manager.dart';
import '../routes_manager.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  RxBool isAuth = false.obs;

  String token = '';

  UserProfile? userProfile;

  @override
  void onInit() {
     super.onInit();
    token = CacheHelper.getString(key: AppConatants.TOKEN_KEY);
    print(token);
    var profileOffline = CacheHelper.getString(key: AppConatants.PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      isAuth.value = true;
      userProfile = UserProfile.fromJson(jsonDecode(profileOffline));

    }
   
  }

  saveToken(String value) async {
    await CacheHelper.setData(key: AppConatants.TOKEN_KEY, value: value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return '';
    return CacheHelper.getString(key: AppConatants.PROFILE_KEY);
  }

  saveProfile(UserProfile profile) async {
    isAuth.value = true;
    CacheHelper.setData(
        key: AppConatants.PROFILE_KEY, value: jsonEncode(profile));
    userProfile = profile;
  }

  onLogout() {
    CacheHelper.remove(key: AppConatants.IS_AUTH_KEY);
    CacheHelper.remove(key: AppConatants.PROFILE_KEY);
    isAuth.value = false;
    token = '';
    Get.offAllNamed(AppRoutes.loginRoute);
  }
}
