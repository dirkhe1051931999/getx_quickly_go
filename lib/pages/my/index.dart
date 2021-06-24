import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        subtitle: Text('Get.offAllNamed(AppRoutes.App)'),
        onTap: () => Get.offAllNamed(AppRoutes.App),
      ),
    );
  }
}
