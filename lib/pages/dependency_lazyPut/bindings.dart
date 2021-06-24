import 'package:get/get.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/controller.dart';

class DependencyLazyPutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountController>(() => CountController());
  }
}
