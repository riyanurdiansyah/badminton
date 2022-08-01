import 'package:get/get.dart';
import 'package:badminton/models/user_m.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpfController extends GetxController {
  late SharedPreferences prefs;

  final Rx<int> _indexSlider = 0.obs;
  Rx<int> get indexSlider => _indexSlider;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  String get fnGetUid => prefs.getString('uid') ?? '';

  String get fnGetName => prefs.getString('name') ?? '';

  String get fnGetHp => prefs.getString('handphone') ?? '';

  void fnSaveDataToSession(UserModel user) async {
    await prefs.setString('uid', user.uid!);
    await prefs.setString('name', user.name!);
    await prefs.setString('handphone', user.handphone!);
    await prefs.setString('email', user.email!);
    await prefs.setInt('role', user.role!);
    await prefs.setBool('status', user.status!);
  }

  void swipeSlider(int i) {
    _indexSlider.value = i;
  }

  void next() {
    if (_indexSlider.value != 2) {
      _indexSlider.value++;
    }
  }
}
