import 'package:get/get.dart';

class bottomNavBarHomePageController extends GetxController {
  late int index;

  changeIndex(value) {
    index = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    index = 3;
    super.onInit();
  }
}
