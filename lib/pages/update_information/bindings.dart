import 'package:digitaledge/pages/update_information/controller.dart';
import 'package:get/get.dart';

class UpdateInformationBiniding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateInformationController>(
        () => UpdateInformationController());
  }
}
