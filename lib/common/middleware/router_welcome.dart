import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';
import 'package:getx_quick_go/global.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.isFirstOpen == true) {
      return null;
    } else {
      return RouteSettings(name: AppRoutes.App);
    }
  }
}
