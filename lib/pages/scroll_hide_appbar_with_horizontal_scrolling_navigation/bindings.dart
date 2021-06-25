import 'package:get/get.dart';

import 'controller.dart';

class ScrollHideAppbarWithHorizontalScrollingNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrollHideAppbarWithHorizontalScrollingNavigationController>(() => ScrollHideAppbarWithHorizontalScrollingNavigationController());
  }
}
