import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        subtitle: Text('Get.offAllNamed(AppRoutes.App)'),
        // 去下一个路由，清除之前所有的路由
        onTap: () => Get.offAllNamed(AppRoutes.App),
      ),
    );
  }
}
