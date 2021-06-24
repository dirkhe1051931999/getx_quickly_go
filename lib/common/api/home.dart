import 'package:getx_quick_go/common/utils/http.dart';

/// 新闻
class HupuAPI {
  /// 翻页
  static Future<dynamic> getHotList({dynamic param}) async {
    var response = await HttpUtil().get(
      '/1/7.3.23/buffer/hotList',
      queryParameters: param,
    );
    return response;
  }
}
