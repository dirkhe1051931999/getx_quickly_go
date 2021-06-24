import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/common/routes/app_pages.dart';
import 'package:getx_quick_go/global.dart';

import '../index.dart';

/// hellowrod
class HellowordWidget extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Obx(() => Text(controller.state.title)),
          ElevatedButton(
            onPressed: () {
              Global.saveAlreadyOpen();
              Get.offNamed(AppRoutes.App);
            },
            child: Text('确定'),
          )
        ],
      ),
    );
  }
}
