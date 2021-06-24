import 'package:get/get.dart';
import 'package:getx_quick_go/common/api/home.dart';

class HotListDioController extends GetxController {
  var hotList = Rx<dynamic>({});

  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose");
  }

  getHotList() async {
    hotList.value = await HupuAPI.getHotList(param: {
      "crt": 1624008430022,
      "sign": "33afa95d10b76c780c2e2d6c282cff23",
    });
  }
}
