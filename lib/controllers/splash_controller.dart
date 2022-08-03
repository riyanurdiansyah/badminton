import 'package:get/get.dart';
import 'package:badminton/controllers/spf_controller.dart';
import 'package:badminton/routes/app_route_name.dart';

class SplashController extends GetxController {
  final _spfC = Get.find<SpfController>();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (_spfC.fnGetUid.isNotEmpty) {
        Get.offAllNamed(AppRouteName.home);
      } else {
        Get.offAllNamed(AppRouteName.signin);
      }
    });
  }
}
