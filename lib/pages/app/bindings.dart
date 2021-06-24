import 'package:get/get.dart';
import 'package:getx_quick_go/pages/home/controller.dart';

import 'controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
