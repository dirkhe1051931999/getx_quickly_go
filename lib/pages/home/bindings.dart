import 'package:get/get.dart';
import 'package:getx_quick_go/pages/home/controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
