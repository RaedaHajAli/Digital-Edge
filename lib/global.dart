import 'package:digitaledge/core/user/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put<UserStore>(UserStore());
  }
}
