import 'package:digitaledge/core/user/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/cache_helper.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();
    Get.put<UserStore>(UserStore());
    

 
  }
}
