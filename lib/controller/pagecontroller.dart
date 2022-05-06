import 'package:get/get.dart';

class PageControllers extends GetxController {
  RxInt position = 0.obs;
  RxBool imageController = false.obs;
  getColor(int pos) {
    position.value = pos;
  }

  changeImage() {
    imageController.value = true;
  }
}
