import 'package:digitaledge/pages/home/controller.dart';
import 'package:get/get.dart';

class HomeBiniding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}