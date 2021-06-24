import 'package:get/get.dart';

import 'controller.dart';

class TestGetxPluginsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestGetxPluginsController>(() => TestGetxPluginsController());
  }
}
