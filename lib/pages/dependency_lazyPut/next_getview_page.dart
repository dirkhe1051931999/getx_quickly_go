import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_quick_go/pages/dependency_lazyPut/controller.dart';

// GetView 传入控制器泛型，然后就可以直接获取controller
class NextPageView extends GetView<CountController> {
  NextPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextPage"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('value -> ${controller.count}')),
            Divider(),

            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
