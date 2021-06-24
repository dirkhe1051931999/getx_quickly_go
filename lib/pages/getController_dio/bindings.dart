import 'package:get/get.dart';
import 'package:getx_quick_go/pages/getController_dio/controller.dart';

class HotListDioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotListDioController>(() => HotListDioController());
  }
}
