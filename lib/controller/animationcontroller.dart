import 'package:get/get.dart';

class AnimationControllers extends GetxController {
  RxDouble c3 = 0.19.obs;

  RxBool chechAni = false.obs;

  changeAni() {
    chechAni.value = true;
  }

  void startAnimation() {
    c3.value = 0;
  }

  bool check() {
    return true;
  }
}
