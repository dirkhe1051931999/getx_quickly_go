import 'package:get/get.dart';

import 'controller.dart';

class VerticalScrollTextBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerticalScrollTextController>(() => VerticalScrollTextController());
  }
}
