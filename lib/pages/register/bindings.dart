import 'package:digitaledge/pages/register/controller.dart';
import 'package:get/get.dart';

class RegisterBiniding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
