import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';
import 'package:getx_quick_go/global.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (Global.profile['accessToken'] != null) {
      return null;
    } else {
      return RouteSettings(name: AppRoutes.Login);
    }
  }
}
