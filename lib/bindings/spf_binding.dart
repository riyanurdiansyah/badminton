import 'package:get/get.dart';
import 'package:badminton/controllers/spf_controller.dart';

class SpfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SpfController());
  }
}
