import 'package:digitaledge/pages/login/controller.dart';
import 'package:get/get.dart';

class LoginBiniding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
