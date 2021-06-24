import 'package:get/get.dart';
import 'package:getx_quick_go/pages/nested_navigation/controller.dart';

class NestedNavigationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NestedNavigationController());
  }
}
