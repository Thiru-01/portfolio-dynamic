import 'package:get/get.dart';

class AnimationControllers extends GetxController {
  RxDouble c3 = 0.19.obs;
  RxDouble opacity = 0.0.obs;
  RxDouble pad = 0.0.obs;
  RxBool chechAni = false.obs;

  void changeAni() {
    chechAni.value = true;
  }

  void changeOpacity() {
    pad.value = 12.0;
    opacity.value = 1.0;
  }

  void startAnimation() {
    c3.value = 0;
  }

  bool check() {
    return true;
  }
}
