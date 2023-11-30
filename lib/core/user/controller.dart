
import 'package:digitaledge/core/user/models.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  bool isLoggedIn = false;

  String token = '';

  UserItem? userProfile;

  

  
}
