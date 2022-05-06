import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/model/firemodel.dart';

class DataController extends GetxController {
  var title = ''.obs;
  var stitle = ''.obs;
  var byteData = "".obs;
  var desc = ''.obs;
  var github = ''.obs;
  FireModel convertTofiremodel() {
    FireModel data = FireModel(
        title: title.value,
        subtitle: stitle.value,
        description: desc.value,
        fstoragePath: byteData.value,
        github: github.value);
    return data;
  }
}
